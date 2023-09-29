import 'package:ecommerce_app_flutter/common/routes/names.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/bloc/sign_in_states.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/sign_in_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';
import 'components/sign_in_appbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: const CustomAppBar(
                appBarTitle: "Login",
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: buildThirdPartyLogin(context: context),
                    ),
                    Center(
                        child: customLabel(
                            title: "Or use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(
                        top: 55.h,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customLabel(title: "Email"),
                          const SizedBox(height: 4),
                          customField(
                            hintText: "Enter your email address",
                            iconName: "user",
                            callback: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          // SizedBox(height: 16),
                          customLabel(title: "Password"),
                          const SizedBox(height: 4),
                          customField(
                            hintText: "Enter your password",
                            iconName: "user",
                            hideText: true,
                            callback: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          forgotPasswordButton(),
                          loginAndRegisterButton(
                            title: "Login",
                            isLoginButton: true,
                            onTap: () {
                              SignInController(context: context)
                                  .handleSignIn(LoginType.email);
                            },
                          ),
                          const SizedBox(height: 16),
                          loginAndRegisterButton(
                            title: "Register",
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoute.register);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildThirdPartyLogin({required BuildContext context}) {
  return Container(
    width: 250.w,
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: signInIcon(serviceName: "google"),
          onTap: () {},
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: signInIcon(serviceName: "apple"),
          onTap: () {},
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: signInIcon(serviceName: "facebook"),
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget signInIcon({required String serviceName}) {
  return SizedBox(
    width: 40.w,
    height: 40.w,
    child: Image.asset("assets/icons/$serviceName.png"),
  );
}

Widget customLabel(
    {required String title,
    Color color = AppColors.SecondaryElementText,
    int size = 14}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      title,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.normal,
          fontFamily: 'Avenir',
          fontSize: size.sp),
    ),
  );
}

Widget customField({
  required String hintText,
  required String iconName,
  void Function(String value)? callback,
  bool hideText = false,
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: CupertinoTextField(
            onChanged: (value) {
              callback?.call(value);
            },
            cursorColor: Colors.black,
            obscureText: hideText,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Avenir',
              fontSize: 14.sp,
            ),
            placeholderStyle: const TextStyle(
                color: AppColors.SecondaryElementText,
                backgroundColor: Colors.transparent),
            placeholder: hintText,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.zero,
            ),
          ),
        )
      ],
    ),
  );
}

Widget forgotPasswordButton() {
  return Container(
    margin: EdgeInsets.only(bottom: 50.h),
    child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Text(
          "Forgot Password",
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 12.h,
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () {}),
  );
}

Widget loginAndRegisterButton(
    {required String title,
    bool isLoginButton = false,
    void Function()? onTap}) {
  return Container(
      child: ElevatedButton(
    onPressed: () => onTap?.call(),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8), // Remove padding
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14), // Add border radius
          side: BorderSide(width: isLoginButton ? 0 : 0.5)),
      backgroundColor: isLoginButton
          ? AppColors.primaryElement
          : AppColors.primaryBackground, // Background color
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: isLoginButton
                  ? AppColors.primaryBackground
                  : AppColors.primaryElement,
              fontSize: 16,
              fontFamily: 'Avenir'),
        ),
      ),
    ),
  ));
}
