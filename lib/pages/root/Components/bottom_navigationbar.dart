import 'package:flutter/material.dart';
import '../../../common/values/colors.dart';

BottomNavigationBarItem bottomNavBarItem({required String imagePath}) {
  return BottomNavigationBarItem(
      icon: SizedBox(
        height: 20,
        width: 20,
        child: Image.asset(imagePath),
      ),
      label: "",
      activeIcon: SizedBox(
        height: 20,
        width: 20,
        child: Image.asset(
          imagePath,
          color: AppColors.primaryElement,
        ),
      ));
}
