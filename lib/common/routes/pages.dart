// combine blocs and their respective pages

import 'package:ecommerce_app_flutter/pages/root/bloc/root_bloc.dart';
import 'package:ecommerce_app_flutter/pages/root/tab_bar_controller.dart';
import 'package:ecommerce_app_flutter/pages/register/bloc/register_bloc.dart';
import 'package:ecommerce_app_flutter/pages/register/register.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/sign_in.dart';
import 'package:ecommerce_app_flutter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ecommerce_app_flutter/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'names.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}

class AppRoutes {
  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoute.onboarding,
      page: Welcome(),
      bloc: BlocProvider(create: (_) => WelcomeBloc()),
    ),
    PageEntity(
      route: AppRoute.signIn,
      page: SignIn(),
      bloc: BlocProvider(create: (_) => SignInBloc()),
    ),
    PageEntity(
      route: AppRoute.register,
      page: Register(),
      bloc: BlocProvider(create: (_) => RegisterBloc()),
    ),
    PageEntity(
      route: AppRoute.homePage,
      page: TabBarController(),
      bloc: BlocProvider(create: (_) => RootBloc()),
    ),
  ];

  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var pageEntity =
          routes.where((element) => element.route == settings.name);
      if (pageEntity.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => pageEntity.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}
