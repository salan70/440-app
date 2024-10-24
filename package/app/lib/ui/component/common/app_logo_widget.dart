import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth * 0.7,
      child: Image.asset('assets/in_app/top_icon_simple.png'),
    );
  }
}
