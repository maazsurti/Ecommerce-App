part of 'register_bloc.dart';

class RegisterState {
  final String username;
  final String email;
  final String password;
  final String rePassword;
  const RegisterState(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterState copyWith(
      {String? username, String? email, String? password, String? rePassword}) {
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
