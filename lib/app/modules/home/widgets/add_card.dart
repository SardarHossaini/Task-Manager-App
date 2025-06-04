import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_manager_app/app/core/utils/extensions.dart';
import 'package:task_manager_app/app/core/values/colors.dart';
import 'package:task_manager_app/app/data/models/task.dart';
import 'package:task_manager_app/app/modules/home/controller.dart';
import 'package:task_manager_app/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            title: "Task Type",
            radius: 5,
            content: Form(
              key: homeCtrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: homeCtrl.editController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a task name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.0.wp,
                      vertical: 1.0.hp,
                    ),
                    child: Wrap(
                      spacing: 2.0.wp,
                      runSpacing: 2.0.wp, // Add this line for vertical spacing
                      children: icons
                          .map(
                            (e) => Obx(() {
                              final index = icons.indexOf(e);
                              return ChoiceChip(
                                label: e,
                                selected: homeCtrl.chipIndex.value == index,
                                onSelected: (selected) {
                                  if (selected) {
                                    homeCtrl.chipIndex.value = index;
                                  }
                                },
                                selectedColor:
                                    Colors.blue[100], // یا هر رنگ دلخواه
                                backgroundColor: Colors.grey[200],
                                showCheckmark: false, // تیک را حذف می‌کند
                              );
                            }),
                          )
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(150, 50),
                    ),
                    onPressed: () {
                      if (homeCtrl.formKey.currentState!.validate()) {
                        int icon =
                            icons[homeCtrl.chipIndex.value].icon!.codePoint;
                        String color = icons[homeCtrl.chipIndex.value].color!
                            .toHex();
                        var task = Task(
                          title: homeCtrl.editController.text,
                          icon: icon,
                          color: color,
                        );
                        Get.back();
                        homeCtrl.addTask(task)
                            ? EasyLoading.showSuccess("Create successfully")
                            : EasyLoading.showError("Duplicated task");
                      }
                    },
                    child: Text(
                      "Confrim",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
          homeCtrl.editController.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: [8, 4],
            color: Colors.grey[400]!,
          ),
          child: Center(
            child: Icon(Icons.add, size: 10.0.wp, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
