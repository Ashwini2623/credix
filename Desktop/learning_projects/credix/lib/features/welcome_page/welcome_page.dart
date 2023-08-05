import 'package:credix/routing/routing.dart';
import 'package:credix/shared/common_wave_widget.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Welcome',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: kWhiteColor),
      )),
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
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kSizedBoxHeight(kToolbarHeight),
                        AspectRatio(
                            aspectRatio: 5,
                            child: Image.asset(
                                '$kAssetImagePath/credix-logo.png')),
                        kSizedBoxHeight(kToolbarHeight),
                        Text(
                          'Welcome to Credix',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        kSizedBoxHeight(16.0),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        kSizedBoxHeight(kToolbarHeight),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    LoginPageRoute().push(context);
                                  },
                                  child: const Text('Login')),
                              kSizedBoxHeight(24.0),
                              ElevatedButton(
                                  onPressed: () {
                                    RegisterPageRoute().push(context);
                                  },
                                  child: const Text('Register')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CommonWaveWidget(),
            ]),
      ),
    );
  }
}
