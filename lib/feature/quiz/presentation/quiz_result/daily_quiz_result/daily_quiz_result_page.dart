import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common_widget/back_to_top_button.dart';
import '../../../../../util/constant/strings_constant.dart';
import '../../../../admob/presentation/banner_ad_widget.dart';
import '../../component/result_quiz_widget.dart';
import '../../component/share_button.dart';
import '../component/custom_confetti_widget.dart';
import '../component/result_text.dart';

class DailyQuizResultPage extends StatelessWidget {
  const DailyQuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    const shareText = '#389quiz #今日の1問\n$appStoreUrl';
    const buttonWidth = 160.0;

    // TODO(me): globalKeyを引数として渡すのイケてない感ある
    // 本当はProviderで参照したかった。。
    final globalKey = GlobalKey();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ListView(
                  children: [
                    const BannerAdWidget(),
                    const SizedBox(height: 16),
                    const ResultText(),
                    ResultQuizWidget(globalKey: globalKey),
                    const SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        width: buttonWidth,
                        child: ShareButton(
                          isMain: false,
                          globalKey: globalKey,
                          shareText: shareText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: SizedBox(
                        width: buttonWidth,
                        child: BackToTopButton(isMain: true),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CustomConfettiWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
