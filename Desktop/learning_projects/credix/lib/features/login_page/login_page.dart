import 'package:credix/features/login_page/widgets/otp.dart';
import 'package:credix/shared/common_wave_widget.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      kSizedBoxHeight(kToolbarHeight),
                      AspectRatio(
                          aspectRatio: 5,
                          child:
                              Image.asset('$kAssetImagePath/credix-logo.png')),
                      kSizedBoxHeight(kToolbarHeight),
                      const OtpPage(),
                    ],
                  ),
                ),
              ),
            ),
            const CommonWaveWidget(),
          ])),
    );
  }
}
