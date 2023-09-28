import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UsernameEvent>(_usernameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<EmailEvent>(_emailEvent);
    on<ReEnterPasswordEvent>(_reEnterPasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    print(event.username);
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _reEnterPasswordEvent(
      ReEnterPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.reEnterPassword));
  }
}
