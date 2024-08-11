import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/infrastructure/auth_repository.dart';
import 'user_info.dart';
import 'user_info_repository.dart';

part 'user_info_state.g.dart';

@riverpod
Future<UserInfo?> currentUserInfo(CurrentUserInfoRef ref) {
  final currentUser = ref.watch(authRepositoryProvider).getCurrentUser()!;
  return ref.watch(userInfoRepositoryProvider).fetchUserInfo(currentUser.uid);
}
