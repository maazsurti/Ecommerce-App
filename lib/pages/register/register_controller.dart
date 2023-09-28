import 'package:ecommerce_app_flutter/common/widgets/flutter_toasts.dart';
import 'package:ecommerce_app_flutter/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String password = state.password;
    String confirmPassword = state.rePassword;
    String email = state.email;

    if (username.isEmpty) {
      showToast(message: "Username cannot be empty");
    } else if (password.isEmpty) {
      showToast(message: "Please enter your password");
    } else if (confirmPassword.isEmpty) {
      showToast(message: "Please re-enter your password");
    } else if (email.isEmpty) {
      showToast(message: "Please enter your email");
    } else if (password != confirmPassword) {
      showToast(message: "The passwords must match");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        showToast(
            message:
                "Your account has been created succesfully. Please check your inbox to confirm your email address");
        Navigator.of(context).pop();
      } else {
        showToast(message: "Could not create your account");
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        showToast(message: "Please enter a stronger password");
      } else if (e.code == "email-already-in-user") {
        showToast(message: "This email is already in use");
      } else if (e.code == "invalid-email") {
        showToast(message: "The email address is badly formatted");
      } else if (e.code == "email-already-in-use") {
        showToast(message: "The email address is already in use by another account.");
      } else {
        showToast(message: "Something went wrong. Please try again");
      }
    }
    ;
  }
}
