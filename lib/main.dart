import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pmmy/presentation/OTP/otpController.dart';
import 'package:pmmy/presentation/OTP/otpScreen.dart';
import 'package:pmmy/presentation/accountDetails/accountController.dart';
import 'package:pmmy/presentation/accountDetails/accountScreen.dart';
import 'package:pmmy/presentation/documentDetails/documentScreen.dart';
import 'package:pmmy/presentation/homes/homeController.dart';
import 'package:pmmy/presentation/homes/homeScreen.dart';
import 'package:pmmy/presentation/login/loginController.dart';
import 'package:pmmy/presentation/login/loginScreen.dart';
import 'package:pmmy/presentation/payment/paymentScreen.dart';
import 'package:pmmy/presentation/personalDetails/personalController.dart';
import 'package:pmmy/presentation/personalDetails/personalScreen.dart';
import 'package:pmmy/presentation/phone/phoneScreen.dart';
import 'package:pmmy/presentation/signature/signatureScreen.dart';
import 'package:pmmy/utills/colors.dart';

import 'presentation/loanOffer/loanOfferController.dart';
import 'presentation/loanOffer/loanOfferScreen.dart';

final loginController = Get.put(LoginController());
final otpController = Get.put(OtpScreenUiController());
final loanController = Get.put(LoanController());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());
  Get.lazyPut(() => PersonalController());
  Get.lazyPut(() => AccountController());
  Get.lazyPut(() => LoanController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: yellow,
          secondary: yellow,
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginScreen(),
        '/phone': (context) => PhoneScreen(),
        '/otp': (context) => OtpScreenUi(),
        '/home': (context) => HomeScreen(),
        '/personal': (context) => PersonalScreen(),
        '/account': (context) => AccountScreen(),
        '/loan': (context) => LoanScreen(),
        '/document': (context) => DocumentScreen(),
        '/signature': (context) => SignatureScreen(),
        '/payment': (context) => PaymentScreen(),
      },
    );
  }
}
