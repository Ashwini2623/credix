import 'dart:async';

import 'package:credix/features/register_page/widgets/text_form_field.dart';
import 'package:credix/routing/routing.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int _seconds = 60;
  Timer? _timer;
  bool _resend = false;
  bool _openOtp = false;

  late TextEditingController otpController;
  TextEditingController mobile = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    otpController = TextEditingController();
    _resetTimer();
    super.initState();
  }

  _resetTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds <= 0) {
        timer.cancel();
        _resend = true;
      }
      setState(() {
        if (_seconds >= 0) {
          _seconds -= 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _resend = false;
    otpController.dispose();
    super.dispose();
  }

  _formatSecond(int second) {
    int min = 0;
    int sec = second;
    if (_seconds >= 60) {
      min = second ~/ 60;
      sec = second % 60;
    }
    return sec < 10 ? "0$min:0$sec" : "0$min:$sec";
  }

  _resendOTP() {
    setState(() {
      _resend = false;
      _resetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              !_openOtp
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Enter your mobile number and login',
                            style: Theme.of(context).textTheme.titleMedium),
                        kSizedBoxHeight(16.0),
                        MobileTextFormField(controller: mobile),
                        kSizedBoxHeight(16.0),
                      ],
                    )
                  : const SizedBox(),
              _openOtp
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Text('Please enter OTP',
                              style: Theme.of(context).textTheme.titleMedium),
                          PinCodeTextField(
                            appContext: context,
                            cursorHeight: 15,
                            cursorWidth: 2,
                            length: 6,
                            autoDisposeControllers: false,
                            obscureText: false,
                            animationType: AnimationType.none,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderWidth: 1.5,
                              borderRadius: BorderRadius.circular(8),
                              fieldHeight: 45,
                              fieldWidth: 42,
                              inactiveFillColor: kGreyColor,
                              activeColor: kBlueColor,
                              selectedColor: kBlueColor,
                              inactiveColor: kGreyColor,
                              selectedFillColor: kGreyColor,
                              activeFillColor: kGreyColor,
                            ),
                            cursorColor: kBlueColor,
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            errorTextSpace: 16.0,
                            errorTextMargin: const EdgeInsets.only(top: 32.0),
                            validator: (v) {
                              if (v?.length != 6) {
                                return 'Please fill the OTP Field';
                              }
                              return null;
                            },
                          ),
                        ])
                  : const SizedBox(),
              !_openOtp
                  ? ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _openOtp = true;
                          });
                        }
                      },
                      child: const Text('Login'))
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          NavigationPageRoute().push(context);
                        }
                      },
                      child: const Text('Login')),
              kSizedBoxHeight(16.0),
              _openOtp
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Did not receive OTP?',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        kSizedBoxWidth(8.0),
                        !_resend
                            ? Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${_formatSecond(_seconds)}",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kBlueColor),
                                ),
                              )
                            : Container(),
                        _resend
                            ? InkWell(
                                onTap: () {
                                  _resendOTP();
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kBlueColor,
                                          decoration: TextDecoration.underline),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  : const SizedBox()
            ]));
  }
}
