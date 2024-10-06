import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/router/app_router.dart';
import '../../core/util/controller_mixin.dart';

part 'quiz_setting_page_controller.freezed.dart';
part 'quiz_setting_page_controller.g.dart';

@freezed
class QuizSettingPageState with _$QuizSettingPageState {
  const factory QuizSettingPageState({
    required SearchCondition searchCondition,
  }) = _QuizSettingPageState;
}

@riverpod
class QuizSettingPageController extends _$QuizSettingPageController
    with ControllerMixin {
  @override
  Future<QuizSettingPageState> build() async {
    final searchCondition = await ref.watch(searchConditionProvider.future);
    return QuizSettingPageState(searchCondition: searchCondition);
  }

  /// [state.value!.teamList]  を更新する。
  void updateTeamList(List<Object?> selectedTeamList) {
    final teamList = selectedTeamList.cast<String>();
    _updateSearchCondition(
      teamList,
      (condition, value) => condition.copyWith(teamList: value),
    );
  }

  /// [state.value!.minGames] を更新する。
  void updateMinGames(int minGames) => _updateSearchCondition(
        minGames,
        (condition, value) => condition.copyWith(minGames: value),
      );

  /// [state.value!.minHits] を更新する。
  void updateMinHits(int minHits) {
    _updateSearchCondition(
      minHits,
      (condition, value) => condition.copyWith(minHits: value),
    );
  }

  /// [state.value!.minHr] を更新する。
  void updateMinHr(int minHr) {
    _updateSearchCondition(
      minHr,
      (condition, value) => condition.copyWith(minHr: value),
    );
  }

  /// [state.value!.selectedStatsList] を更新する。
  void updateSelectedStatsList(List<String> selectedStatsList) {
    _updateSearchCondition(
      selectedStatsList,
      (condition, value) => condition.copyWith(selectedStatsList: value),
    );
  }

  void chipOnDelete(int index) {
    if (_canRemoveTeam) {
      _removeTeam(index);
    }
  }

  /// 「クイズをプレイする旨のボタン」をタップした際の処理。
  Future<void> onTapPlayNormalQuiz() async {
    await executeWithOverlayLoading(
      ref,
      action: () async {
        // searchCondition を repository へ保存する。
        _saveSearchCondition();

        // クイズ取得時のエラーをキャッチできるよう、ここで `hitterQuizStateProvider` を取得しておく。
        await ref.read(normalQuizStateProvider.future);

        // Analytics に search_condition を送信する。
        await ref.read(analyticsServiceProvider).logSearchCondition();
      },
      onLoadingComplete: () =>
          ref.read(appRouterProvider).push(const PlayNormalQuizRoute()),
    );
  }

  /// SearchConditionの特定のフィールドを更新する汎用メソッド
  void _updateSearchCondition<T>(
    T value,
    SearchCondition Function(SearchCondition, T) updater,
  ) {
    state = AsyncValue.data(
      state.value!.copyWith(
        searchCondition: updater(state.value!.searchCondition, value),
      ),
    );
  }

  /// 球団を取り除けるか判別する。
  ///
  /// state.teamList の長さが2以上の場合に取り除ける。
  /// （取り除くと空になる場合取り除けない。）
  bool get _canRemoveTeam => state.value!.searchCondition.teamList.length > 1;

  /// 選択した球団を取り除く。
  void _removeTeam(int selectedIndex) {
    final teamList = state.value!.searchCondition.teamList;
    final removedTeamList = createRemovedTeamList(teamList, selectedIndex);

    _updateSearchCondition(
      removedTeamList,
      (condition, value) => condition.copyWith(teamList: value),
    );
  }

  /// [teamList] から [removeIndex] の要素を除いたリストを作成する。
  ///
  /// state.teamList に対して `removeAt()` が
  /// 使えないため、この関数を使う。
  @visibleForTesting
  List<String> createRemovedTeamList(List<String> teamList, int removeIndex) {
    if (teamList.length <= removeIndex) {
      // ここに入ることはない想定
      return teamList;
    }

    final removedTeamList = <String>[];
    for (final team in teamList) {
      if (team != teamList[removeIndex]) {
        removedTeamList.add(team);
      }
    }
    return removedTeamList;
  }

  /// [listLength] が teamList として有効かどうか。
  bool isValidTeamList(int listLength) => listLength >= minChoseTeamNum;

  /// [listLength] が selectedStatsList として有効かどうか。
  bool isValidSelectedStatsList(int listLength) =>
      listLength == mustSelectStatsNum;

  /// 成績をタップ時に状態（選択/未選択）を変更できるかどうか。
  bool canChangeStatsState({
    required int selectedLength,
    required bool isSelected,
  }) {
    if (selectedLength == mustSelectStatsNum && isSelected) {
      return true;
    }
    return selectedLength < mustSelectStatsNum;
  }

  /// [SearchCondition] を repository に保存する。
  void _saveSearchCondition() {
    ref
        .read(searchConditionRepositoryProvider)
        .save(state.value!.searchCondition);

    // TODO(me): ここの invalidate によって、望ましくない UI のリビルドが発生しないか確認する。
    ref.invalidate(searchConditionProvider);
  }
}
