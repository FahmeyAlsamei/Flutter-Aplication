import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language{

  Future<SharedPreferences> sharedPreferences=SharedPreferences.getInstance();
  static SharedPreferences? prefrence;

void putData({
 required String key,
 required bool value,

})async{
    prefrence=await sharedPreferences;
   if(prefrence!=null){
     prefrence?.setBool(key, value);
   }

 }

 static bool? getData(
  {
  required String key
}
     ){
     if(prefrence!=null)
       return prefrence?.getBool(key);

 }
}