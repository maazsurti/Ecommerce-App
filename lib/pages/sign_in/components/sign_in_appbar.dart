import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle; // Add a parameter to receive the title

  const CustomAppBar({
    Key? key,
    required this.appBarTitle, // Initialize the parameter
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: null,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      title: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 20.w,
              height: 14.h,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              onTap: () {
                print("Side button tapped");
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/person.png"))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
