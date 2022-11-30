// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pmmy/presentation/homes/homeController.dart';
import 'package:pmmy/utills/colors.dart';
import 'package:pmmy/utills/customButton.dart';
import 'package:pmmy/utills/customtext.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('------------In screen');

    print(controller.banners.length);
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
            text: 'Home',
            color: black,
            weight: FontWeight.bold,
            size: 18,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: yellow),
      key: controller.scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CustomText(
                text: 'PMMY',
                color: dgrey,
                weight: FontWeight.bold,
                size: 24,
              ),
              decoration: BoxDecoration(
                color: yellow,
              ),
            ),
            ListTile(
              title: CustomText(
                text: 'Home',
                color: black,
              ),
              onTap: controller.closeDrawer,
            ),
            ListTile(
              title: CustomText(
                text: 'Settings',
                color: black,
              ),
              onTap: controller.closeDrawer,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
                child: Obx(
              () => CarouselSlider(
                options: CarouselOptions(),
                items: controller.banners
                    .map((item) => Container(
                          child: Center(
                              child: Image.network(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ))
                    .toList(),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            CustomButton(buttonText: "Apply For Loan"),
          ],
        ),
      ),
    );
  }
}
