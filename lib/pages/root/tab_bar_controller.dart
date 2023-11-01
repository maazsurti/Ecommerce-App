import 'package:ecommerce_app_flutter/common/values/colors.dart';
import 'package:ecommerce_app_flutter/pages/root/Components/BuildPage.dart';
import 'package:ecommerce_app_flutter/pages/root/bloc/root_bloc.dart';
import 'package:ecommerce_app_flutter/pages/root/bloc/root_event.dart';
import 'package:ecommerce_app_flutter/pages/root/bloc/root_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/names.dart';
import '../../common/service/storage_service.dart';
import '../../global.dart';
import '../root/Components/bottom_navigationbar.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: buildPage(state.index),
            ),
            bottomNavigationBar: Container(
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h))),
              child: BottomNavigationBar(
                currentIndex: context.read<RootBloc>().state.index,
                onTap: (value) {
                  context.read<RootBloc>().add(SelectedPageChangedEvent(value));
                  if (value == 4) {
                    Global.storageService
                        .setBool(Keys.isUserLoggedIn.name, false);
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.signIn, (route) => false);
                  }
                },
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.QuaternaryElementText,
                items: [
                  bottomNavBarItem(imagePath: "assets/icons/home.png"),
                  bottomNavBarItem(imagePath: "assets/icons/search2.png"),
                  bottomNavBarItem(imagePath: "assets/icons/play-circle1.png"),
                  bottomNavBarItem(
                      imagePath: "assets/icons/message-circle.png"),
                  bottomNavBarItem(imagePath: "assets/icons/person2.png"),
                ],
                type: BottomNavigationBarType.fixed,
                elevation: 0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
