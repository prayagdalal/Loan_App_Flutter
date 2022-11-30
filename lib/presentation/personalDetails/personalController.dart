import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController {
  TextEditingController dateInput = TextEditingController();
  var fatherController = TextEditingController();
  var mobileController = TextEditingController();
  var cityController= TextEditingController();
    var pinController= TextEditingController();


  var gender = ["Male", "Female", "Other"];
  var mStatus = ["Single", "Married", "Divorced", "Widowed"];
  var state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "Delhi",
    "Puducherry"
  ];

  var gen = 'Male'.obs;
  var status = 'Single'.obs;
  var stateValue = 'Gujarat'.obs;

  void setGender(String value) {
    gen.value = value;
  }

  void setMstatus(String value) {
    status.value = value;
  }

  void setState(String value) {
    stateValue.value = value;
  }
}
