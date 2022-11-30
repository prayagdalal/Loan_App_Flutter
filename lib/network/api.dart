import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String main_url = "http://194.233.69.10";
const String api_url = main_url + "/lms/ajax.php?action=";

class ApiMethods {
  static String getURL(methodName) {
    String requestUrl = api_url + methodName;
    return requestUrl;
  }

  static Future<dynamic> signup(
      String firstname, String contact_no, String address) async {
    final response = await http.post(
        Uri.parse('http://194.233.69.10/lms/ajax.php?action=userSignup'),
        body: {
          "firstname": firstname.toString(),
          "address": address.toString(),
          "contact_no": contact_no.toString(),
        });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  static Future<dynamic> login(String contact_no) async {
    final response = await http.post(
        Uri.parse('http://194.233.69.10/lms/ajax.php?action=userLogin'),
        body: {
          "contact_no": contact_no.toString(),
        });
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  static Future<dynamic> otpVerify(String contact_no, String otp) async {
    final response = await http.post(
        Uri.parse(
            'http://194.233.69.10/lms/ajax.php?action=userLoginOtpVerify'),
        body: {"contact_no": contact_no.toString(), "otp": otp});
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  static Future<dynamic> getBanner() async {
    final response = await http
        .get(Uri.parse('http://194.233.69.10/lms/ajax.php?action=get_banner'));
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      return response.body;
    }
  }

  static Future<dynamic> getAmount() async {
    final response = await http.get(
      Uri.parse('http://194.233.69.10/lms/ajax.php?action=getAmount'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      return response.body;
    }
  }
}
