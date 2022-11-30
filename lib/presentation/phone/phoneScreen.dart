import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pmmy/network/api.dart';
import 'package:pmmy/presentation/OTP/otpController.dart';
import 'package:pmmy/presentation/OTP/otpScreen.dart';
import 'package:pmmy/presentation/login/loginController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';

import '../../utills/customButton.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);
  TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FlutterToast flutterToast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [grey, dgrey])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Center(
                  child: Image.asset(
                    "assets/demo.png",
                    scale: 2.3,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Phone Sign In',
                      size: 22,
                      weight: FontWeight.bold,
                      color: white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // TextField(
                    //   style: TextStyle(color: black),
                    //   controller: mobileController,
                    //   decoration: InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: black, width: 0.5),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       filled: true,
                    //       hintStyle: TextStyle(color: black),
                    //       hintText: 'Phone no...+91',
                    //       fillColor: white),
                    // ),
                    CustomTextField(
                      controller: mobileController,
                      hintText: 'Your phone no +91',
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await ApiMethods.login(mobileController.text)
                                  .then((value) {
                                print('-------------------on click');
                                value = jsonDecode(value);
                                if (value['success'] == 1) {
                                  print('-------------------in success');
                                  Get.to(OtpScreenUi());
                                  LoginController.setSession(
                                      'phone', mobileController.text);
                                }
                              });
                              // Get.to(OtpScreenUi());
                            } else
                              null;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: yellow,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
