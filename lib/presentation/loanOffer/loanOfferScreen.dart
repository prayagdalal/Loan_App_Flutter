// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pmmy/presentation/accountDetails/accountController.dart';
import 'package:pmmy/presentation/loanOffer/loanOfferController.dart';
import 'package:pmmy/presentation/personalDetails/personalController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';

import '../../utills/customButton.dart';

class LoanScreen extends StatelessWidget {
  LoanScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoanController());

  final fullnamecontroller = TextEditingController();
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
                    text: 'Select Loan Offer',
                    color: white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(
                    text: 'Select Business Type',
                    color: white,
                    size: 12,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: dgrey,
                        border: Border.all(color: black, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DropdownButtonHideUnderline(
                          child: Obx(
                        () => DropdownButton(
                          dropdownColor: dgrey,
                          hint: CustomText(
                            text: "Select Business",
                            color: white,
                          ),
                          isExpanded: true,
                          onChanged: (newvalue) {
                            controller.setbusinessvalue(newvalue.toString());
                          },
                          value: controller.businessvalue.value,
                          items: controller.businessType
                              .map((String e) => DropdownMenuItem(
                                    child: Text(
                                      e,
                                      style:
                                          TextStyle(fontSize: 16, color: white),
                                    ),
                                    value: e,
                                  ))
                              .toList(),
                        ),
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: 'Select Loan Amount',
                    color: white,
                    size: 12,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: dgrey,
                        border: Border.all(color: black, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DropdownButtonHideUnderline(
                          child: Obx(
                        () => DropdownButton(
                          dropdownColor: dgrey,
                          hint: CustomText(
                            text: "Select Loan",
                            color: white,
                          ),
                          isExpanded: true,
                          value: controller.loanvalue.value.toString(),
                          items: controller.loanAmount
                              .map((dynamic e) => DropdownMenuItem(
                                    child: Text(
                                      e.toString(),
                                      style:
                                          TextStyle(fontSize: 16, color: white),
                                    ),
                                    value: e.toString(),
                                  ))
                              .toList(),
                          onChanged: (newvalue) {
                            controller.loanvalue.value = newvalue.toString();
                          },
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: 'Select EMI Tenure',
                    color: white,
                    size: 12,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: dgrey,
                        border: Border.all(color: black, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DropdownButtonHideUnderline(
                          child: Obx(
                        () => DropdownButton(
                          dropdownColor: dgrey,
                          hint: CustomText(
                            text: "Select Emi",
                            color: white,
                          ),
                          isExpanded: true,
                          onChanged: (newvalue) {
                            controller.setemivalue(newvalue.toString());
                          },
                          value: controller.emivalue.value,
                          items: controller.emiList
                              .map((dynamic e) => DropdownMenuItem(
                                    child: Text(
                                      e['tenure'].toString(),
                                      style:
                                          TextStyle(fontSize: 16, color: white),
                                    ),
                                    value: e['id'],
                                  ))
                              .toList(),
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(buttonText: "Apply Now"),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
