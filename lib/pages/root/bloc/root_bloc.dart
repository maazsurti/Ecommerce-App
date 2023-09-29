import 'package:ecommerce_app_flutter/pages/root/bloc/root_event.dart';
import 'package:ecommerce_app_flutter/pages/root/bloc/root_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(const RootState()) {
    on<SelectedPageChangedEvent>((event, emit) {
      emit(RootState(index: event.index));
    });
  }
}
