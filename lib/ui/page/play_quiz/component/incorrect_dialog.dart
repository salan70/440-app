import 'package:flutter/material.dart';

import '../../quiz_result/quiz_result_page.dart';

class IncorrectDialog extends StatelessWidget {
  const IncorrectDialog({super.key, required this.selectedHitter});

  // Providerで保持するほうが良いかも？
  final String selectedHitter;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('残念...'),
      content: Text('$selectedHitter選手ではありません'),
      actions: <Widget>[
        TextButton(
          child: Text(
            '諦める',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (_) => const QuizResultPage(),
              ),
            );
          },
        ),
        TextButton(
          child: const Text('もう一度回答する'),
          onPressed: () {
            // TODO(me): ここに動画の広告入れたい
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
