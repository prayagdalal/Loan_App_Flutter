import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController {
  List<dynamic> documentList = [
    {"documentname": "Passport Size Photo", "flag": "false"},
    {"documentname": "Pan Card Photo", "flag": "false"},
    {"documentname": "Aadhar Card Front Side", "flag": "false"},
    {"documentname": "Aadhar Card Back Side", "flag": "false"},
    {"documentname": "Cancelled Cheque Photo", "flag": "false"},
  ].obs;
}
