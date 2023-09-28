import 'package:ecommerce_app_flutter/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ecommerce_app_flutter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register/bloc/register_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(lazy: false, create: (context) => SignInBloc()),
        BlocProvider(lazy: false, create: (context) => RegisterBloc()),
      ];
}
