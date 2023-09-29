import 'package:ecommerce_app_flutter/common/routes/names.dart';
import 'package:ecommerce_app_flutter/common/values/colors.dart';
import 'package:ecommerce_app_flutter/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'bloc/welcome_blocs.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
      final pages = [
        page(
          1,
          context,
          "next",
          "First one learning",
          "Forget about a for of paper all knowledge in one learning",
          "assets/images/reading.png",
        ),
        page(
          2,
          context,
          "next",
          "Connect with everyone",
          "Always keep in touch with your tutor and your friend",
          "assets/images/boy.png",
        ),
        page(
          3,
          context,
          "Get Started",
          "Always fascinated learning ",
          "Anywhere, Anytime. The time is at your discretion so study whenever you want",
          "assets/images/man.png",
        ),
      ];

      return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      state.page = index;
                      return pages[index % pages.length];
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: ElevatedButton(
                            onPressed: () {
                              state.page += 1;
                              if (state.page <= 2) {
                                controller.animateToPage(state.page,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoute.signIn, (route) => false);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0), // Remove padding
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        14), // Add border radius
                                    side: const BorderSide(width: 0)),
                                backgroundColor:
                                    AppColors.primaryElement // Background color
                                ),
                            child: const SizedBox(
                              height: 56,
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 40.w,
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: pages.length,
                            effect: const ExpandingDotsEffect(
                                expansionFactor: 1.8,
                                dotHeight: 13,
                                dotWidth: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }

  Widget page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath),
        ),
        const SizedBox(height: 40),
        Container(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        )),
        const SizedBox(height: 8),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
