import 'package:ecommerce_app_flutter/common/routes/pages.dart';
import 'package:ecommerce_app_flutter/common/service/get_initial_widget.dart';
import 'package:ecommerce_app_flutter/common/values/colors.dart';
import 'package:ecommerce_app_flutter/pages/root/tab_bar_controller.dart';
import 'package:ecommerce_app_flutter/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppRoutes.allProviders(context)],
      child: ScreenUtilInit(
        builder: ((context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                iconTheme: IconThemeData(color: AppColors.primaryText),
                appBarTheme:
                    const AppBarTheme(elevation: 0, color: Colors.white),
                colorSchemeSeed: Colors.white,
              ),
              home: getInitialWidget(),
              onGenerateRoute: AppRoutes.generateRouteSettings,
            )),
      ),
    );
  }
}
