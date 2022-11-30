import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pmmy/network/api.dart';
import 'package:pmmy/presentation/OTP/otpScreen.dart';
import 'package:pmmy/presentation/accountDetails/accountScreen.dart';
import 'package:pmmy/presentation/documentDetails/documentScreen.dart';
import 'package:pmmy/presentation/homes/homeScreen.dart';
import 'package:pmmy/presentation/loanOffer/loanOfferScreen.dart';
import 'package:pmmy/presentation/payment/paymentScreen.dart';
import 'package:pmmy/presentation/personalDetails/personalScreen.dart';
import 'package:pmmy/presentation/phone/phoneScreen.dart';
import 'package:pmmy/presentation/signature/signatureScreen.dart';
import 'package:pmmy/utills/colors.dart';

class CustomButton extends StatefulWidget {
  final String? buttonText;
  final dynamic? data;

  const CustomButton({Key? key, this.buttonText, this.data}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;
  late FlutterToast flutterToast;

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterToast = FlutterToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          widget.buttonText.toString(),
          style: TextStyle(
              color: black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        widget.buttonText == "Apply For Loan" ? Get.to(PersonalScreen()) : null;
        widget.buttonText == "Next" ? Get.to(AccountScreen()) : null;
        widget.buttonText == "Save" ? Get.to(LoanScreen()) : null;
        widget.buttonText == "Apply Now" ? Get.to(DocumentScreen()) : null;
        widget.buttonText == "Register Now" ? Get.to(SignatureScreen()) : null;
        widget.buttonText == "Go Next" ? Get.to(PaymentScreen()) : null;
        widget.buttonText == "Go Home" ? Get.to(HomeScreen()) : null;
      },
      style: ElevatedButton.styleFrom(
        primary: yellow,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
