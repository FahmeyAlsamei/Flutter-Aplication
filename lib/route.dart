

import 'package:flutter/material.dart';
import 'package:untitled3/presentation/screens/edite_screen/Editprofile.dart';
import 'package:untitled3/presentation/screens/login/login.dart';
import 'package:untitled3/share/component/constant_compontent/string.dart';

import 'presentation/screens/home/screan/home_screen.dart';

class AppRoute{



  Route? generateRoute( RouteSettings sttings){

    if(sttings.name==homeScreen){
      return MaterialPageRoute(builder: (context)=>MyHomePage());

    }
    if(sttings.name==editeProfileScreen){
      return MaterialPageRoute(builder: (context)=>EditProfile());

    }
    if(sttings.name==loginScreen){
      return MaterialPageRoute(builder: (context)=>LogIn());

    }
  }

}