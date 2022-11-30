import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pmmy/network/api.dart';

class LoanController extends GetxController {
  var businessType = ["Employee", "Self-employeed", "Government Job"];

  var loanAmount = [].obs;
  var loanId = ''.obs;

  List<dynamic> emiList = [
    {'id': 'EMI12', 'tenure': '24 Months | 2 Year'},
    {'id': 'EMI36', 'tenure': '36 Months | 3 Year'},
    {'id': 'EMI38', 'tenure': '48 Months | 4 Year'},
    {'id': 'EMI60', 'tenure': '60 Months | 5 Year'},
    {'id': 'EMI72', 'tenure': '72 Months | 6 Year'},
    {'id': 'EMI84', 'tenure': '84 Months | 7 Year'},
    {'id': 'EMI96', 'tenure': '96 Months | 8 Year'},
    {'id': 'EMI108', 'tenure': '108 Months | 9 Year'},
    {'id': 'EMI120', 'tenure': '120 Months | 10 Year'},
    {'id': 'EMI132', 'tenure': '132 Months | 11 Year'},
    {'id': 'EMI144', 'tenure': '144 Months | 12 Year'},
    {'id': 'EMI156', 'tenure': '156 Months | 13 Year'},
    {'id': 'EMI168', 'tenure': '168 Months | 14 Year'},
    {'id': 'EMI180', 'tenure': '180 Months | 15 Year'},
    {'id': 'EMI192', 'tenure': '192 Months | 16 Year'},
    {'id': 'EMI204', 'tenure': '204 Months | 17 Year'},
    {'id': 'EMI216', 'tenure': '216 Months | 18 Year'},
    {'id': 'EMI228', 'tenure': '228 Months | 19 Year'},
    {'id': 'EMI240', 'tenure': '240 Months | 20 Year'},
  ];
  var businessvalue = "Employee".obs;
  RxString loanvalue = ''.obs;
  var emivalue = "12 Months | 1 Year".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLoanAmount();
    emivalue.value = emiList[0]['id'];
  }

  void setbusinessvalue(String value) {
    businessvalue.value = value;
  }

  void setloanvalue(String value) {
    loanvalue.value = value;
  }

  void setemivalue(String value) {
    emivalue.value = value;
  }

  void getLoanAmount() {
    ApiMethods.getAmount().then((value) {
      loanAmount.addAll(value['amounts']);
      print('-------------------amount');
      print(loanAmount);
      loanAmount.asMap();
      loanvalue.value = loanAmount[0];
      print('------------------First -amount');
      setloanvalue(loanAmount[0]);
    });
  }
}
