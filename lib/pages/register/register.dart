import 'package:ecommerce_app_flutter/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../sign_in/components/sign_in_appbar.dart';
import '../sign_in/sign_in.dart';
import 'bloc/register_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: const CustomAppBar(
                appBarTitle: "Register",
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: customLabel(
                            title: "Enter your details below to Sign Up")),
                    Container(
                      margin: EdgeInsets.only(
                        top: 40.h,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customLabel(title: "Username"),
                          const SizedBox(height: 4),
                          customField(
                            hintText: "Enter your username",
                            iconName: "user",
                            callback: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UsernameEvent(value));
                            },
                          ),
                          customLabel(title: "Email"),
                          const SizedBox(height: 4),
                          customField(
                            hintText: "Enter your email address",
                            iconName: "user",
                            callback: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
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
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          customLabel(title: "Confirm Password"),
                          const SizedBox(height: 4),
                          customField(
                            hintText: "Re-enter your password to confirm",
                            iconName: "user",
                            hideText: true,
                            callback: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(ReEnterPasswordEvent(value));
                            },
                          ),
                          customLabel(
                              title:
                                  "By creating an account, you are agreeing to the terms and conditions",
                              color: Colors.black,
                              size: 12),
                          const SizedBox(height: 16),
                          loginAndRegisterButton(
                            title: "Register",
                            onTap: () {
                              RegisterController(context).handleEmailRegister();
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
