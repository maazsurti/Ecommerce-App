import 'package:ecommerce_app_flutter/pages/root/tab_bar_controller.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/sign_in.dart';
import 'package:ecommerce_app_flutter/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import 'storage_service.dart';

Widget getInitialWidget() {
  bool isFirstLaunched =
      Global.storageService.getValue(Keys.isLaunchedForTheFirstTime, false);
  if (!isFirstLaunched) {
    //If its the first launch
    Global.storageService
        .setBool(Keys.isLaunchedForTheFirstTime.toString(), true);
    return Welcome();
  } else {
    //If not, then check if they are logged in or not
    bool isUserLoggedIn = Global.storageService.isUserLoggedIn;
    if (isUserLoggedIn) {
      return TabBarController();
    } else {
      return SignIn();
    }
  }
}
