import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/model.dart';

import '../component/common/button/my_button.dart';

@RoutePage()
class ForceUpdatePage extends ConsumerWidget {
  const ForceUpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリのアップデート'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              '新しいバージョンが利用可能です！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'アップデートは数分で完了します。\nより良い体験のためアップデートをお願いします！',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            MyButton(
              buttonName: 'to_store_for_update_button',
              buttonType: ButtonType.main,
              onPressed: () => ref.read(appInfoServiceProvider).launchStore(),
              child: const Text('今すぐアップデート'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
