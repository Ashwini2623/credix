import 'package:credix/routing/routing.dart';
import 'package:credix/shared/common_wave_widget.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigation() async {
      await Future.delayed(const Duration(milliseconds: 1500), () {
        WelcomePageRoute().go(context);
      });
    }

    return FutureBuilder(
      future: navigation(),
      builder: (c, s) => Scaffold(
        backgroundColor: kBlueColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Flexible(flex: 2, child: SizedBox()),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    left: 32.0, right: 32.0, bottom: 45.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 20.0,
                          blurRadius: 5.0,
                          offset: Offset(3, 4),
                          blurStyle: BlurStyle.outer)
                    ]),
                padding: const EdgeInsets.all(32.0),
                child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset('$kAssetImagePath/credix-logo.png')),
              ),
              const CommonWaveWidget()
            ],
          ),
        ),
      ),
    );
  }
}
