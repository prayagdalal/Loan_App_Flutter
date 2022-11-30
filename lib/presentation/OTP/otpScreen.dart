// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pmmy/presentation/homes/homeScreen.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:pmmy/utills/colors.dart';

import '../../network/api.dart';
import '../login/loginController.dart';
import 'otpController.dart';

class OtpScreenUi extends StatelessWidget {
  OtpScreenUi({Key? key}) : super(key: key);
  OtpScreenUiController otpScreenUiController = OtpScreenUiController();
  Future<String?> validateOtp(String otp) async {
    print('in validate OTP function');
    LoginController.getSession('phone').then((value) {
      otpScreenUiController.phone.value = value;
      print('phone------------' + otpScreenUiController.phone.value);
      if (otpScreenUiController.phone.value != '' ||
          otpScreenUiController.phone.value.isNotEmpty)
        ApiMethods.otpVerify(otpScreenUiController.phone.value, otp)
            .then((value) {
          print(value);
          value = jsonDecode(value);
          print(value['is_verified']);
          if (value['is_verified'] == 1) {
            return null;
          } else {
            return "The entered Otp is wrong";
          }
        });
    });

    //return null;
  }

  void moveToNextScreen(context) {
    Get.to(HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpScreen.withGradientBackground(
        topColor: grey,
        bottomColor: dgrey,
        otpLength: 5,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        themeColor: yellow,
        titleColor: yellow,
        title: "Sign In",
      ),
    );
  }
}
