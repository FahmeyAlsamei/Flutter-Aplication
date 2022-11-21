import 'package:flutter/material.dart';
import 'package:untitled3/models/language.dart';
import 'package:untitled3/presentation/screens/home/screan/appointment.dart';
import 'package:untitled3/presentation/screens/profile_screen/profile.dart';
import 'package:untitled3/presentation/screens/setting_screan/settings.dart';

// import '../../modules/drawer_menu/add_product/add_products.dart';
import '../../../../share/component/constant_compontent/colors.dart';
import '../../servece_information/service_info.dart';
import 'main_screen_inside_home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainScreen();
  bool isEngilsh = Language.getData(key: "isDark") != null &&
          Language.getData(key: "isDark")!
      ? true
      : false;
  @override
  Widget build(BuildContext context) {
    Color color = MyColor.myYellow;

    return Directionality(
      textDirection: isEngilsh ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyColor.myGrey,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColor.myYellow,
          onPressed: () {
             Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ServiceInfo(isServiceNeeder: false,isServiceProvider: true,modifyButtonPressed: false,)));
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              verticalDirection:
                  isEngilsh ? VerticalDirection.up : VerticalDirection.down,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection:
                      isEngilsh ? VerticalDirection.up : VerticalDirection.down,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              MainScreen(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? color : Colors.grey,
                          ),
                          Text(
                            isEngilsh ? "Home" : "الرئيسية",
                            style: TextStyle(
                              color: currentTab == 0 ? color : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              MyAppointment(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart_rounded,
                            color: currentTab == 1 ? color : Colors.grey,
                          ),
                          Text(
                            isEngilsh ? "request" : " الطلبات",
                            // 'request',
                            style: TextStyle(
                              color: currentTab == 1 ? color : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Profile(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            color: currentTab == 2 ? color : Colors.grey,
                          ),
                          Text(
                            isEngilsh ? "Profile" : " الحساب",
                            style: TextStyle(
                              color: currentTab == 2 ? color : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Settings(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: currentTab == 3 ? color : Colors.grey,
                          ),
                          Text(
                            isEngilsh ? "Setting" : "الاعدادت",
                            // 'Settings'?"الاعدادات",
                            style: TextStyle(
                              color: currentTab == 3 ? color : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
