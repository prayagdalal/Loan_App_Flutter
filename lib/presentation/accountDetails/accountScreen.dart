// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pmmy/presentation/accountDetails/accountController.dart';
import 'package:pmmy/presentation/personalDetails/personalController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';

import '../../utills/customButton.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final fullnamecontroller = TextEditingController();
  AccountController accountController = AccountController();

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
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              // ignore: prefer_const_constructors
              title: CustomText(
                text: 'Apply For Loan',
                size: 16,
                weight: FontWeight.bold,
                color: yellow,
              )),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CustomText(
                    text: 'Account Details',
                    color: white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Account Number',
                    controller: accountController.accountnoController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Account Name',
                    controller: accountController.accountnameController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Branch Name',
                    controller: accountController.branchController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'IFSC Code',
                    controller: accountController.ifscController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Aadhar Card Number',
                    controller: accountController.adharController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(buttonText: "Save"),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
