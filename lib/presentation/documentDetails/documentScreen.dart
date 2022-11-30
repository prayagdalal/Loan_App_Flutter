// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pmmy/presentation/accountDetails/accountController.dart';
import 'package:pmmy/presentation/documentDetails/documentController.dart';
import 'package:pmmy/presentation/personalDetails/personalController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customTextfield.dart';
import 'package:pmmy/utills/customtext.dart';

import '../../utills/customButton.dart';

class DocumentScreen extends StatelessWidget {
  DocumentScreen({Key? key}) : super(key: key);
  final fullnamecontroller = TextEditingController();
  DocumentController documentController = DocumentController();

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
                    text: 'Document Details',
                    color: white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  ListView.builder(
                      itemCount: documentController.documentList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: dgrey.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Image.asset(
                                    'assets/demo.png',
                                    alignment: Alignment.center,
                                  ),
                                ),
                                title: CustomText(
                                  text: documentController.documentList[index]
                                      ['documentname'],
                                  color: white,
                                  size: 17,
                                  weight: FontWeight.w400,
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      print('clk');
                                    },
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      color: yellow,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        );
                      }),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(buttonText: "Register Now"),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
