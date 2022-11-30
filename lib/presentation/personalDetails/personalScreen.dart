// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pmmy/presentation/personalDetails/personalController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';

import '../../utills/customButton.dart';

class PersonalScreen extends StatelessWidget {
  PersonalScreen({Key? key}) : super(key: key);
  final fullnamecontroller = TextEditingController();
  PersonalController personalController = PersonalController();

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
                    text: 'Personal Details',
                    color: white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Enter full name',
                    controller: fullnamecontroller,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    style: TextStyle(color: white),
                    controller: personalController.dateInput,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white, width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: dgrey,
                      hintText: 'Enter Date',
                      hintStyle: TextStyle(color: white),
                      //icon: Icon(Icons.calendar_today), //icon of text field
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        personalController.dateInput.text = formattedDate;
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: dgrey,
                              border: Border.all(color: black, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: DropdownButtonHideUnderline(
                                child: Obx(
                              () => DropdownButton(
                                dropdownColor: dgrey,
                                hint: CustomText(
                                  text: "Select DOB",
                                  color: white,
                                ),
                                isExpanded: true,
                                onChanged: (newvalue) {
                                  personalController
                                      .setGender(newvalue.toString());
                                },
                                value: personalController.gen.value,
                                items: personalController.gender
                                    .map((String e) => DropdownMenuItem(
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                fontSize: 16, color: white),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: dgrey,
                              border: Border.all(color: black, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: DropdownButtonHideUnderline(
                                child: Obx(
                              () => DropdownButton(
                                dropdownColor: dgrey,
                                hint: CustomText(
                                  text: "Select Status",
                                  color: white,
                                ),
                                isExpanded: true,
                                onChanged: (newvalue) {
                                  personalController
                                      .setMstatus(newvalue.toString());
                                },
                                value: personalController.status.value,
                                items: personalController.mStatus
                                    .map((String e) => DropdownMenuItem(
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                fontSize: 16, color: white),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Enter father name',
                    controller: personalController.fatherController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Enter mobile no',
                    controller: personalController.mobileController,
                  ),
                  SizedBox(
                    height: 12,
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
                            text: "Select state",
                            color: white,
                          ),
                          isExpanded: true,
                          onChanged: (newvalue) {
                            personalController.setState(newvalue.toString());
                          },
                          value: personalController.stateValue.value,
                          items: personalController.state
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Enter city',
                          controller: personalController.cityController,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Enter pincode',
                          controller: personalController.pinController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(buttonText: "Next"),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
