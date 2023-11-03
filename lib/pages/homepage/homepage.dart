import 'package:ecommerce_app_flutter/common/values/colors.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/components/sign_in_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: ""),
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              homePageHeaderLabel(title: "Hello"),
              SizedBox(height: 5.h),
              homePageHeaderLabel(title: "Maaz", color: AppColors.primaryText),
              SizedBox(height: 20.h),
              searchView()
            ],
          )),
    );
  }
}

Widget homePageHeaderLabel(
    {required String title, Color color = AppColors.TertiaryElementText}) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget searchView() {
  return Container(
    child: Text("Search bar"),
    decoration: BoxDecoration(color: AppColors.primaryBackground),
  );
}
