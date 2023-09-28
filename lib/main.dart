import 'package:ecommerce_app_flutter/common/values/colors.dart';
import 'package:ecommerce_app_flutter/firebase_options.dart';
import 'package:ecommerce_app_flutter/pages/bloc_providers.dart';
import 'package:ecommerce_app_flutter/pages/register/register.dart';
import 'package:ecommerce_app_flutter/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: ((context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                iconTheme: IconThemeData(color: AppColors.primaryText),
                appBarTheme:
                    const AppBarTheme(elevation: 0, color: Colors.white),
                colorSchemeSeed: Colors.white,
              ),
              home: const SignIn(),
              routes: {
                "signIn": (context) => const SignIn(),
                "register": (context) => const Register()
              },
            )),
      ),
    );
  }
}
