// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [GalleryListPage]
class GalleryListRoute extends PageRouteInfo<void> {
  const GalleryListRoute({List<PageRouteInfo>? children})
      : super(
          GalleryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GalleryListPage();
    },
  );
}

/// generated route for
/// [PlayDailyQuizPage]
class PlayDailyQuizRoute extends PageRouteInfo<PlayDailyQuizRouteArgs> {
  PlayDailyQuizRoute({
    Key? key,
    required DateTime questionedAt,
    List<PageRouteInfo>? children,
  }) : super(
          PlayDailyQuizRoute.name,
          args: PlayDailyQuizRouteArgs(
            key: key,
            questionedAt: questionedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayDailyQuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PlayDailyQuizRouteArgs>();
      return PlayDailyQuizPage(
        key: args.key,
        questionedAt: args.questionedAt,
      );
    },
  );
}

class PlayDailyQuizRouteArgs {
  const PlayDailyQuizRouteArgs({
    this.key,
    required this.questionedAt,
  });

  final Key? key;

  final DateTime questionedAt;

  @override
  String toString() {
    return 'PlayDailyQuizRouteArgs{key: $key, questionedAt: $questionedAt}';
  }
}

/// generated route for
/// [PlayNormalQuizPage]
class PlayNormalQuizRoute extends PageRouteInfo<void> {
  const PlayNormalQuizRoute({List<PageRouteInfo>? children})
      : super(
          PlayNormalQuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayNormalQuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlayNormalQuizPage();
    },
  );
}

/// generated route for
/// [QuizHistoryDailyPage]
class QuizHistoryDailyRoute extends PageRouteInfo<QuizHistoryDailyRouteArgs> {
  QuizHistoryDailyRoute({
    Key? key,
    required HitterQuizResult quizResult,
    List<PageRouteInfo>? children,
  }) : super(
          QuizHistoryDailyRoute.name,
          args: QuizHistoryDailyRouteArgs(
            key: key,
            quizResult: quizResult,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizHistoryDailyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizHistoryDailyRouteArgs>();
      return QuizHistoryDailyPage(
        key: args.key,
        quizResult: args.quizResult,
      );
    },
  );
}

class QuizHistoryDailyRouteArgs {
  const QuizHistoryDailyRouteArgs({
    this.key,
    required this.quizResult,
  });

  final Key? key;

  final HitterQuizResult quizResult;

  @override
  String toString() {
    return 'QuizHistoryDailyRouteArgs{key: $key, quizResult: $quizResult}';
  }
}

/// generated route for
/// [QuizHistoryNormalPage]
class QuizHistoryNormalRoute extends PageRouteInfo<QuizHistoryNormalRouteArgs> {
  QuizHistoryNormalRoute({
    Key? key,
    required HitterQuizResult quizResult,
    List<PageRouteInfo>? children,
  }) : super(
          QuizHistoryNormalRoute.name,
          args: QuizHistoryNormalRouteArgs(
            key: key,
            quizResult: quizResult,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizHistoryNormalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizHistoryNormalRouteArgs>();
      return QuizHistoryNormalPage(
        key: args.key,
        quizResult: args.quizResult,
      );
    },
  );
}

class QuizHistoryNormalRouteArgs {
  const QuizHistoryNormalRouteArgs({
    this.key,
    required this.quizResult,
  });

  final Key? key;

  final HitterQuizResult quizResult;

  @override
  String toString() {
    return 'QuizHistoryNormalRouteArgs{key: $key, quizResult: $quizResult}';
  }
}

/// generated route for
/// [QuizSettingPage]
class QuizSettingRoute extends PageRouteInfo<void> {
  const QuizSettingRoute({List<PageRouteInfo>? children})
      : super(
          QuizSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizSettingPage();
    },
  );
}

/// generated route for
/// [ResultDailyQuizPage]
class ResultDailyQuizRoute extends PageRouteInfo<ResultDailyQuizRouteArgs> {
  ResultDailyQuizRoute({
    Key? key,
    required QuizState quizState,
    List<PageRouteInfo>? children,
  }) : super(
          ResultDailyQuizRoute.name,
          args: ResultDailyQuizRouteArgs(
            key: key,
            quizState: quizState,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultDailyQuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultDailyQuizRouteArgs>();
      return ResultDailyQuizPage(
        key: args.key,
        quizState: args.quizState,
      );
    },
  );
}

class ResultDailyQuizRouteArgs {
  const ResultDailyQuizRouteArgs({
    this.key,
    required this.quizState,
  });

  final Key? key;

  final QuizState quizState;

  @override
  String toString() {
    return 'ResultDailyQuizRouteArgs{key: $key, quizState: $quizState}';
  }
}

/// generated route for
/// [ResultNormalQuizPage]
class ResultNormalQuizRoute extends PageRouteInfo<ResultNormalQuizRouteArgs> {
  ResultNormalQuizRoute({
    Key? key,
    required QuizState quizState,
    List<PageRouteInfo>? children,
  }) : super(
          ResultNormalQuizRoute.name,
          args: ResultNormalQuizRouteArgs(
            key: key,
            quizState: quizState,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultNormalQuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultNormalQuizRouteArgs>();
      return ResultNormalQuizPage(
        key: args.key,
        quizState: args.quizState,
      );
    },
  );
}

class ResultNormalQuizRouteArgs {
  const ResultNormalQuizRouteArgs({
    this.key,
    required this.quizState,
  });

  final Key? key;

  final QuizState quizState;

  @override
  String toString() {
    return 'ResultNormalQuizRouteArgs{key: $key, quizState: $quizState}';
  }
}

/// generated route for
/// [TopPage]
class TopRoute extends PageRouteInfo<void> {
  const TopRoute({List<PageRouteInfo>? children})
      : super(
          TopRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TopPage();
    },
  );
}
