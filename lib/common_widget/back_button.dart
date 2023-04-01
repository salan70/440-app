import 'package:baseball_quiz_app/common_widget/my_button.dart';
import 'package:baseball_quiz_app/util/constant/button_type_constant.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key, required this.buttonType});

  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      buttonType: buttonType,
      onPressed: Navigator.of(context).pop,
      child: const Text('戻る'),
    );
  }
}
