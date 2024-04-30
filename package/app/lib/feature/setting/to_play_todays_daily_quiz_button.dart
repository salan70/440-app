import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/model.dart';
import 'package:ntp/ntp.dart';

import '../../../core/common_widget/button/my_button.dart';
import '../../../core/common_widget/dialog/confirm_dialog.dart';
import '../../../core/common_widget/dialog/error_dialog.dart';
import '../../../core/util/presentation_mixin.dart';
import '../../core/router/app_router.dart';

class ToPlayTodaysDailyQuizButton extends ConsumerWidget
    with PresentationMixin {
  const ToPlayTodaysDailyQuizButton({super.key, required this.buttonType});

  final ButtonType buttonType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyButton(
      buttonName: 'to_play_daily_quiz_button',
      buttonType: buttonType,
      onPressed: () async {
        // TODO(me): ローディング, エラーに関する処理もう少しきれいに書きたい。
        final loadingNotifier = ref.read(loadingNotifierProvider.notifier)
          ..show();
        try {
          final isPlayedDailyQuiz =
              await ref.read(isPlayedTodaysDailyQuizProvider.future);

          // * プレイ済みの場合
          if (isPlayedDailyQuiz) {
            loadingNotifier.hide();
            if (context.mounted) {
              await showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return const _AlertAlreadyPlayedDailyQuizDialog();
                },
              );
            }
            return;
          }
          // * 未プレイの場合
          // 念のため、 invalidate する。
          ref.invalidate(dailyQuizProvider);
          final now = await NTP.now();
          final nowInApp = now.calculateDateInApp();
          final dailyQuiz = await ref.read(dailyQuizProvider(nowInApp).future);

          // * 今日の1問が null （未登録などで取得できなかった）の場合。
          if (dailyQuiz == null) {
            logger.e('今日の1問が null でした。登録漏れの可能性があります。');
            loadingNotifier.hide();
            if (context.mounted) {
              await showDialog<void>(
                context: context,
                builder: (context) => const _AlertNotFoundDailyQuizDialog(),
              );
            }
            return;
          }

          // * 今日の1問がプレイできる場合。
          loadingNotifier.hide();
          if (context.mounted) {
            await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return const _ConfirmPlayDailyQuizDialog();
              },
            );
          }
        }
        // * エラーが発生した場合。
        on Exception catch (e, s) {
          logger.e(
            '[to_play_daily_quiz_button]タップ時にエラーが発生しました。',
            e,
            s,
          );
          loadingNotifier.hide();
          if (context.mounted) {
            await showDialog<void>(
              context: context,
              builder: (context) => const ErrorDialog(),
            );
          }
        }
      },
      child: FittedBox(
        child: Text(
          '今日の1問',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          ),
        ),
      ),
    );
  }
}

/// 本日分のクイズがプレイ済みの旨を表示するダイアログ。
class _AlertAlreadyPlayedDailyQuizDialog extends StatelessWidget {
  const _AlertAlreadyPlayedDailyQuizDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'エラー',
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      content:
          const Text('本日分はプレイ済みです。\n\n※毎日$borderHourForTodayInApp時に更新されます。'),
      actions: [
        MyButton(
          buttonName: 'ok_button_in_already_played_daily_quiz_dialog',
          buttonType: ButtonType.main,
          onPressed: context.popRoute,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

/// 今日の1問が null （未登録などで取得できなかった）の旨を表示するダイアログ。
class _AlertNotFoundDailyQuizDialog extends StatelessWidget {
  const _AlertNotFoundDailyQuizDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'エラー',
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      content: const Text('申し訳ありません。\n今日の1問はお休みです。'),
      actions: [
        MyButton(
          buttonName: 'ok_button_in_'
              'not_found_daily_quiz_dialog',
          buttonType: ButtonType.main,
          onPressed: context.popRoute,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

/// 今日の1問がプレイできる場合、プレイするか確認するダイアログ。
class _ConfirmPlayDailyQuizDialog extends ConsumerWidget
    with PresentationMixin {
  const _ConfirmPlayDailyQuizDialog();

  static const _playDailyQuizConfirmText = '「今日の1問」を開始しますか？'
      '\n\n※1日1度しかプレイできません。'
      '\n※毎日$borderHourForTodayInApp時更新。'
      '\n\n※プレイ中にアプリが終了された場合、不正解となります。';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConfirmDialog(
      confirmText: _playDailyQuizConfirmText,
      onPressedYes: () async {
        await executeWithOverlayLoading(
          ref,
          action: () async {
            final now = await NTP.now();
            final nowInApp = now.calculateDateInApp();
            // クイズを作成する。
            await ref.read(
              hitterQuizNotifierProvider(
                QuizType.daily,
                questionedAt: nowInApp,
              ).future,
            );

            // ローカルプッシュ通知のスケジュールを更新し、
            // プレイ済みなのにリマインドが通知されるのを防ぐ。
            await ref
                .read(localPushNotificationServiceProvider)
                .scheduleRemindDailyQuizNotification();
          },
          onLoadingComplete: () async {
            final now = await NTP.now();
            final nowInApp = now.calculateDateInApp();

            if (context.mounted) {
              await context.pushRoute(
                PlayDailyQuizRoute(
                  questionedAt: nowInApp,
                ),
              );
            }
          },
        );
      },
    );
  }
}
