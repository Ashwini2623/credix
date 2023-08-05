import 'package:credix/features/register_page/widgets/text_form_field.dart';
import 'package:credix/routing/routing.dart';
import 'package:credix/shared/common_wave_widget.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController userName = TextEditingController();
  final TextEditingController panCard = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController dob = TextEditingController();

  final items = const [
    'Male',
    'Female',
    'Other',
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Register',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: kWhiteColor),
      )),
      body: SafeArea(
          child: Form(
        key: _formKey,
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
                          NameTextField(controller: userName),
                          kSizedBoxHeight(16.0),
                          DobTextField(controller: dob),
                          kSizedBoxHeight(16.0),
                          GenderTextField(controller: gender, items: items),
                          kSizedBoxHeight(16.0),
                          PanTextField(controller: panCard),
                          kSizedBoxHeight(16.0),
                          AddressTextField(controller: address),
                          kSizedBoxHeight(24.0),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  NavigationPageRoute().push(context);
                                }
                              },
                              child: const Text('Submit'))
                        ]),
                  )),
            ),
            const CommonWaveWidget(),
          ],
        ),
      )),
    );
  }
}
