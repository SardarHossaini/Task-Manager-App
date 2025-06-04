import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/extensions.dart';
import 'package:task_manager_app/app/modules/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.sp),
              child: Text(
                "My List",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
