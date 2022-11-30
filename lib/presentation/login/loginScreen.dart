// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pmmy/network/api.dart';
import 'package:pmmy/presentation/OTP/otpScreen.dart';
import 'package:pmmy/presentation/homes/homeScreen.dart';
import 'package:pmmy/presentation/login/loginController.dart';
import 'package:pmmy/presentation/phone/phoneScreen.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customButton.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
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
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppBar().preferredSize.height,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/demo.png",
                      scale: 2.8,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: 'Register',
                    color: white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'Use the form below to started',
                    color: white,
                    size: 12,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      hintText: "Name",
                      controller: loginController.namecontroller.value),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      hintText: "Mobile no",
                      controller: loginController.phonecontroller.value),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      hintText: "City",
                      controller: loginController.citycontroller.value),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('-------------------on click');

                            ApiMethods.signup(
                                    loginController.namecontroller.value
                                        .toString(),
                                    loginController.phonecontroller.value
                                        .toString(),
                                    loginController.citycontroller.value
                                        .toString())
                                .then((value) {
                              flutterToast.showToast(
                                gravity: ToastGravity.BOTTOM,
                                child: Text(
                                  value[0] == 1
                                      ? "Registration successful"
                                      : "Registration Failed",
                                  style: TextStyle(color: white),
                                ),
                                toastDuration: Duration(seconds: 2),
                              );
                              Get.to(PhoneScreen());
                            });
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CustomText(
                        text: 'Already have an account?',
                        size: 14,
                        color: white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(PhoneScreen()),
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: CustomText(
                              text: 'Login',
                              size: 14,
                              color: yellow,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
