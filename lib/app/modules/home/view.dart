import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page or perform an action
              },
              child: const Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
