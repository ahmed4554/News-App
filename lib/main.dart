import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/shopApp/shop_app_layout.dart';
import 'package:news_app/modules/shopapp/cubit/shopAppCubitData.dart';
import 'package:news_app/modules/shopapp/onboarding_screen/onBoardingScreen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/themes/themes.dart';
import 'constans/components.dart';
import 'modules/shopapp/login/login.dart';
import 'modules/shopapp/shopApp_cupit_login/shopAppCubit.dart';
import 'network/local/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioGet();
  await SharedHelper.init();
  bool? isDark = SharedHelper.getShared(key: 'isDark');
  bool? onBoarding = SharedHelper.getShared(key: 'onboarding');
  String? token = SharedHelper.getShared(key: 'token');
  Widget? widget;
  print('$onBoarding from main');
  if (onBoarding != null) {
    if (token != null)
      widget = ShopAppHome();
    else
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    isDark: isDark,
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? widget;

  MyApp({this.isDark, this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ..getBusiness()
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => ShopAppCubit()),
        BlocProvider(create: (BuildContext context) => ShopAppCubitData()..getHomeData()..getCategoriesData()),
      ],
      child: BlocConsumer<AppCubit, AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                // AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
                ThemeMode.light,
            home: widget,
          );
        },
      ),
    );
  }
}
