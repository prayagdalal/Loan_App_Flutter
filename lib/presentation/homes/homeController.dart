import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pmmy/network/api.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var banners = [].obs;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
  }

  getBanner() {
    ApiMethods.getBanner().then((value) {
      List<dynamic> tmp = [];

      tmp.addAll(value['banners']);

      for (var i = 0; i < tmp.length; i++) {
        banners.add(tmp[i]['url']);
      }
      print(banners);
    });
  }
}
