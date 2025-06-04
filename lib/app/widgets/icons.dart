import 'package:flutter/widgets.dart';
import 'package:task_manager_app/app/core/values/colors.dart';
import 'package:task_manager_app/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(personIcon, fontFamily: 'MaterialIcons'),
      color: purple,
    ), // task
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: pink), // task
    Icon(
      IconData(movieIcon, fontFamily: 'MaterialIcons'),
      color: green,
    ), // task
    Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: yellow,
    ), // task
    Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: deepPink,
    ), // task
    Icon(
      IconData(shopIcon, fontFamily: 'MaterialIcons'),
      color: lightBlue,
    ), // task
  ];
}
