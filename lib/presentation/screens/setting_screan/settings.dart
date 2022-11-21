import 'package:flutter/material.dart';
import 'package:untitled3/presentation/screens/home/screan/home_screen.dart';
import 'package:untitled3/share/component/components.dart';

import '../../../models/language.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool iselectedLanguageEnglish = true;
  bool iselectedNotificationNo = true;
  bool iselectedRemindMeNo = true;

  bool isEngilsh = Language.getData(key: "isDark") != null &&
      Language.getData(key: "isDark")!;
  TextStyle style1 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Color color = Theme.of(context).primaryColor;
    TextStyle style =
        TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16);
    TextStyle style2 = TextStyle(color: color, fontWeight: FontWeight.w800);
    return Directionality(
      textDirection: isEngilsh ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(isEngilsh ? 'Settings' : "الاعدادات"),
          ),
          body: Container(
            decoration: defualtBoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: color,
                      size: 25,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      isEngilsh ? "Change Language" : "تغير الغة",
                      style: style,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isEngilsh
                            ? "You can change the application langauge between Arabic and English   "
                            : "يمكنك تغير لغة الـتطبيق بين العربية و الإنجليزية ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            "English",
                            style: style2,
                          ),
                          Switch(
                              value: isEngilsh,
                              activeTrackColor: color,
                              inactiveTrackColor: color,
                              activeColor: Color.fromRGBO(234, 235, 243, 1),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  language.putData(key: "isDark", value: value);
                                });
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                  return MyHomePage();
                                }), (route) => false);
                                print(isEngilsh);
                              }),
                          Text(
                            isEngilsh ? "Arabic" : "العربية",
                            style: style2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: color,
                      size: 25,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      isEngilsh ? "Notifications" : "التنبيهات",
                      style: style,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isEngilsh
                            ? "Choose to activate application notifications or  to   deactivate it     "
                            : "يمكنك الاختيار بين استقبال التنبيهات أو إيقافها",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            isEngilsh ? "on" : "تشغيل",
                            style: style2,
                          ),
                          Switch(
                              value: iselectedNotificationNo,
                              activeTrackColor: color,
                              inactiveTrackColor: color,
                              activeColor: Color.fromRGBO(234, 235, 243, 1),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  iselectedNotificationNo = value;
                                });
                              }),
                          Text(
                            isEngilsh ? "off" : "إيقاف",
                            style: style2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications_active_outlined,
                      color: color,
                      size: 25,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      isEngilsh ? "Remind me" : "ذكرني",
                      style: style,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            isEngilsh ? "on" : "تشغيل",
                            style: style2,
                          ),
                          Switch(
                              value: iselectedRemindMeNo,
                              activeTrackColor: color,
                              inactiveTrackColor: color,
                              activeColor: Color.fromRGBO(234, 235, 243, 1),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  iselectedRemindMeNo = value;
                                });
                              }),
                          Text(
                            isEngilsh ? "off" : "إيقاف",
                            style: style2,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
