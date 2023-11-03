import 'package:ecommerce_app_flutter/pages/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';

Widget buildPage(int index) {
  List widget = [
    Center(
      child: HomePage(),
    ),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  return widget[index];
}
