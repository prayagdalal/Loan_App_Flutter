import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmmy/utills/colors.dart';

import '../presentation/login/loginController.dart';

class CustomTextField extends StatelessWidget {
  LoginController loginController = LoginController();

  final String? hintText;
  bool? valid = false;
  TextEditingController? controller;
  CustomTextField({Key? key, this.hintText, this.controller, this.valid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: hintText == 'Your phone no +91' ? black : white),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: hintText == 'Your phone no +91' ? yellow : white,
                width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          hintStyle:
              TextStyle(color: hintText == 'Your phone no +91' ? black : white),
          hintText: hintText,
          fillColor: hintText == 'Your phone no +91' ? white : dgrey),
    );
  }
}
