import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ui/page/force_update_page.dart';
import '../../ui/page/gallery_list_page.dart';
import '../../ui/page/play_daily_quiz_page.dart';
import '../../ui/page/play_normal_quiz_page.dart';
import '../../ui/page/quiz_history_daily_page.dart';
import '../../ui/page/quiz_history_normal_page.dart';
import '../../ui/page/quiz_setting_page.dart';
import '../../ui/page/result_daily_quiz_page.dart';
import '../../ui/page/result_normal_quiz_page.dart';
import '../../ui/page/top_page.dart';
import 'guards/force_update_guard.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) => AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ForceUpdateRoute.page),
        AutoRoute(
          page: TopRoute.page,
          initial: true,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: GalleryListRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: QuizHistoryDailyRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: QuizHistoryNormalRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: ResultNormalQuizRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: ResultDailyQuizRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: PlayNormalQuizRoute.page,
          guards: [ForceUpdateGuard()],
        ),
        AutoRoute(
          page: PlayDailyQuizRoute.page,
          guards: [ForceUpdateGuard()],
        ),
      ];
}
