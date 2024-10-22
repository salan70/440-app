import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/model.dart';

import '../app_router.dart';

class ForceUpdateGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final container = ProviderContainer();
    final needUpdate = await container.read(needUpdateProvider.future);

    if (needUpdate) {
      // * アップデートが必要な場合
      await router.push(const ForceUpdateRoute());
      return;
    }

    // * アップデートが必要ない場合
    resolver.next();
  }
}
