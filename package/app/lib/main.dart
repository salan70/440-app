import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:common/common.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:model/model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'core/router/app_router.dart';
import 'core/router/navigator_key.dart';
import 'core/util/colors_constant.dart';
import 'core/util/config/firebase_config.dart';
import 'ui/component/common/loading_widget.dart';
import 'ui/controller/login_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 環境変数から [Flavor] を取得する。
  final flavor = Flavor.fromEnvironment;

  // 初期化関連
  await initialize(flavor);

  // iOS 端末にてステータスバーを表示させるための設定。
  //
  // 参考: https://halzoblog.com/error-bug-diary/20220922-2/
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  // Drift Database の初期化

  final dbFolder = await getApplicationDocumentsDirectory();
  final dbPath = p.join(dbFolder.path, driftDatabaseName);
  final driftDatabase = MyDriftDatabase(dbPath);

  // Sembast データベースの初期化
  final docsDir = await getApplicationDocumentsDirectory();
  final db = await databaseFactoryIo
      .openDatabase(p.join(docsDir.path, 'search_conditions.db'));

  // 画面の向きを縦で固定する。
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ProviderScope(
        overrides: [
          flavorProvider.overrideWithValue(flavor),
          searchConditionRepositoryProvider.overrideWith(
            (ref) => SearchConditionRepository(db),
          ),
          notificationSettingRepositoryProvider.overrideWith(
            (ref) => NotificationSettingRepository(db),
          ),
          dbPathProvider.overrideWith((ref) => dbPath),
          driftDatabaseProvider.overrideWith((ref) => driftDatabase),
        ],
        child: const MyApp(),
      ),
    );
  });
}

Future<void> initialize(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // .envの読み込み
  await dotenv.load();

  // Firebaseの初期化
  await Firebase.initializeApp(options: flavor.firebaseOptions);

  // App Check の初期化
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('site-key'),
    androidProvider:
        kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug,
    appleProvider:
        kReleaseMode ? AppleProvider.deviceCheck : AppleProvider.debug,
  );

  // Firebase Analytics
  // アプリ起動時にイベントを送信
  await FirebaseAnalytics.instance.logEvent(
    name: 'launch_app',
  );

  // Firebase Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Flutterフレームワークで処理されないエラーを送信する
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // FCM の通知権限リクエスト
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();

  // トークンの取得（ `web` 以外の場合のみ）
  if (!kIsWeb) {
    final token = await messaging.getToken();
    logger.i('🐯 FCM TOKEN: $token');
  }

  // table_calendarを日本語で表示するために必要
  await initializeDateFormatting();

  // ローカルPUSH通知を日時に応じて送信するために必要
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyApp();
}

class _MyApp extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // * ログイン関連の処理
      await ref.read(loginControllerProvider).login();

      // * ATTをダイアログ表示
      // main()だとうまく表示されないため、
      // MyAppのinitState()に記載
      // AdMobの初期化より前に実行する必要がある
      if (await AppTrackingTransparency.trackingAuthorizationStatus ==
          TrackingStatus.notDetermined) {
        // ATTダイアログがうまく表示されない場合があるため、待機処理を追加
        await Future<void>.delayed(const Duration(milliseconds: 200));
        await AppTrackingTransparency.requestTrackingAuthorization();
      }
      // AdMobの初期化
      await MobileAds.instance.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.rocknRollOneTextTheme().copyWith(
          bodyMedium: GoogleFonts.rocknRollOneTextTheme().bodyMedium?.copyWith(
                fontSize: 16,
              ),
          labelLarge: GoogleFonts.rocknRollOneTextTheme().labelLarge?.copyWith(
                fontSize: 16,
              ),
          headlineSmall:
              GoogleFonts.rocknRollOneTextTheme().headlineSmall?.copyWith(
                    color: primaryColor,
                  ),
        ),
        // ボタン
        primaryColor: highlightColor,
        canvasColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        dialogBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          error: errorColor,
          surface: backgroundColor,
        ),
      ),
      routerConfig: ref.watch(appRouterProvider).config(),
      builder: (context, child) => Navigator(
        key: ref.watch(navigatorKeyProvider),
        observers: [ref.watch(analyticsObserverProvider)],
        onDidRemovePage: (route) {},
        pages: [
          MaterialPage<Widget>(
            child: Stack(
              children: [
                child!,
                // ローディングを表示する
                if (ref.watch(loadingNotifierProvider)) const LoadingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
