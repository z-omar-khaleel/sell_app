import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';

import 'package:sell_app/services/shared_pref.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

import 'modules/auth/controller/states/states_auth.dart';

import 'modules/auth/screens/auth_screen.dart';
import 'modules/home/controller/cubit/home_cubit.dart';
import 'modules/home/controller/states/home_states.dart';
import 'modules/home/screens/main_screen.dart';
import 'observer/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // Use cubits...

  bool? isBoarding = await SharePref.getData(key: 'isBoarding') ?? false;
  print(isBoarding);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,

    // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) => SellAppAuthCubit(InitialStateAuth())),
        BlocProvider(create: (c) => SellAppCubitHome(InitialSellAppHome())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: whiteTheme,
        home: HomeScreen(),
      ),
    );
  }
}
