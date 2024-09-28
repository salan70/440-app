void main() {
  // group('isCorrectHitterQuiz関数', () {
  //   test('正解している', () {
  //     final container = ProviderContainer(
  //       overrides: [
  //         hitterQuizStateProvider.overrideWith(
  //           (ref) => const AsyncData(dummyHitterQuiz),
  //         ),
  //         submittedHitterProvider.overrideWith(
  //           (ref) => const Hitter(
  //             label: '牧秀悟',
  //             id: '9d377b08-3b1d-4ff2-892f-597c404e4b7d',
  //           ),
  //         ),
  //       ],
  //     );
  //     final result =
  //         container.read(hitterQuizServiceProvider).isCorrectHitterQuiz();
  //     expect(true, result);
  //   });

  //   test('不正解している', () {
  //     final container = ProviderContainer(
  //       overrides: [
  //         hitterQuizStateProvider.overrideWith(
  //           (ref) => const AsyncData(dummyHitterQuiz),
  //         ),
  //         submittedHitterProvider.overrideWith(
  //           (ref) => const Hitter(label: '牧秀悟', id: 'incorrect Id'),
  //         ),
  //       ],
  //     );
  //     final result =
  //         container.read(hitterQuizServiceProvider).isCorrectHitterQuiz();
  //     expect(false, result);
  //   });

  //   test('null', () {
  //     final container = ProviderContainer(
  //       overrides: [
  //         hitterQuizStateProvider.overrideWith(
  //           (ref) => const AsyncData(dummyHitterQuiz),
  //         ),
  //         submittedHitterProvider.overrideWith(
  //           (ref) => null,
  //         ),
  //       ],
  //     );
  //     final result =
  //         container.read(hitterQuizServiceProvider).isCorrectHitterQuiz();
  //     expect(false, result);
  //   });
  // });
}
