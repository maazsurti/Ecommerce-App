part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  final String username;
  const UsernameEvent(this.username);
}

class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent(this.password);
}

class ReEnterPasswordEvent extends RegisterEvent {
  final String reEnterPassword;
  const ReEnterPasswordEvent(this.reEnterPassword);
}
