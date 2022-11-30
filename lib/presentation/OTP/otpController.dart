import 'package:get/get.dart';
import 'package:pmmy/presentation/login/loginController.dart';

class OtpScreenUiController extends GetxController {
  RxString phone = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getsessionData();
  }

  getsessionData() {
    print('==in session-----');
    LoginController.getSession('phone').then((value) {
      phone.value = value;
      print('session value:-' + value);
    });
  }
}
