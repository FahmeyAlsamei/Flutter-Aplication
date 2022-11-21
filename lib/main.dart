import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/route.dart';
import 'package:untitled3/share/component/constant_compontent/colors.dart';

import 'config/data.dart';



void main() {
  AccountConfig.checkHaveAndVeryAccount();
  runApp( MyApp(appRoute: AppRoute(),));
}

class MyApp extends StatelessWidget {
  AppRoute appRoute;
   MyApp({super.key,required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //

         onGenerateRoute: appRoute.generateRoute,
        theme: ThemeData(
          primaryColor:  MyColor.myYellow.withOpacity(0.8),
          scaffoldBackgroundColor:MyColor.myGrey,
          appBarTheme:  AppBarTheme(
              backwardsCompatibility: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(235, 236, 243, 1),
                  statusBarIconBrightness: Brightness.dark),
              titleTextStyle: TextStyle(
                  fontSize: 18,

                  fontFamily: 'Anton',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2),
              backgroundColor: MyColor.myYellow.withOpacity(0.8),
              elevation: 1),
          dialogBackgroundColor: const Color.fromRGBO(234, 235, 243, 1),
        ),
        darkTheme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.red),
        )
        );
  }
}
