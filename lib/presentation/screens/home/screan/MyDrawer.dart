import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/models/language.dart';
import 'package:untitled3/presentation/screens/home/screan/home_screen.dart';
import 'package:untitled3/presentation/screens/login/login.dart';

class MyDrawer extends StatelessWidget {
  void selectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushNamed(
        n == 1
            ? '/'
            : (n == 2)
                ? '/appo'
                : (n == 3)
                    ? '/edit'
                    : (n == 4)
                        ?
                        // AddProducts.routeName :
                        (n == 5)
                            ? '/help'
                            : (n == 6)
                                ? '/aboutus'
                                : (n == 7)
                                    ? '/connectus'
                                    : (n == 8)
                                        ? '/login'
                                        : '/logout'
                        : "",
        arguments: {"id": 10, 'title': "Qutaiba"});
  }

  Widget shapeFormat(String title, IconData icon, BuildContext context, int n) {
    return Container(
        height: 45,
        child: ListTile(
          title: Text(title, style: const TextStyle(fontSize: 14)),
          leading: Icon(icon, color: Colors.black),
          onTap: () {
            if ((n == 1)) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            } else if ((n == 8)) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const LogIn()));
            } else if ((n == 8)) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const LogIn()));
            }
            // selectScreen(context, n);
            // print(n);
            else if ((n == 9)) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const LogIn()));
            } else if ((n == 7)) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const LogIn()));
            }
          },
        ));
  }

  bool isEngilsh = Language.getData(key: "isDark") != null &&
          Language.getData(key: "isDark")!
      ? true
      : false;
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Directionality(
      textDirection: isEngilsh ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
          child: Container(
              width: 30,
              child: ListView(children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        stops: const [
                          1,
                          0.5
                        ],
                        colors: [
                          color,
                          color.withOpacity(0.6),
                        ]),
                    borderRadius: const BorderRadius.only(
                        bottomRight: const Radius.circular(30),
                        bottomLeft: const Radius.circular(30)),
                  ),
                  accountName: Text(
                    AppData.UserAccountData != null &&
                            AppData.UserAccountData!.id != 0
                        ? AppData.UserAccountData!.Full_Name!
                        : "مرحباً بك !",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  accountEmail: Text(
                    AppData.UserAccountData != null &&
                            AppData.UserAccountData!.id != 0
                        ? AppData.UserAccountData!.PhoneNo!
                        : "",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  currentAccountPicture: GestureDetector(
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("images/qutiba.png"),
                    ),
                    onTap: () {
                      print("this your account");
                    },
                  ),
                ),
                Column(
                  children: [
                    shapeFormat(isEngilsh ? "Home" : "الرئيسية",
                        Icons.home_outlined, context, 1),
                    shapeFormat(isEngilsh ? "Request" : "الطلبات",
                        Icons.list_alt_outlined, context, 2),
                    shapeFormat(isEngilsh ? "Edit Profile" : "تعديل الحساب",
                        Icons.edit_outlined, context, 3),
                    shapeFormat(isEngilsh ? "Setting" : "الاعدادت",
                        Icons.settings_outlined, context, 4),
                    shapeFormat(isEngilsh ? "Help" : "مساعدة",
                        Icons.help_outline, context, 5),
                    shapeFormat(isEngilsh ? "About Us" : "حول",
                        Icons.info_outlined, context, 6),
                    shapeFormat(isEngilsh ? "Connect Us" : "تواصل بناء",
                        Icons.message_outlined, context, 7),
                    shapeFormat(isEngilsh ? "Share the App" : "مشاركة التطبيق",
                        Icons.share_outlined, context, 7),
                    AppData.UserAccountData != null &&
                            (AppData.UserAccountData!.id != null &&
                                AppData.UserAccountData!.id != 0)
                        ? shapeFormat(isEngilsh ? "Log out " : "تسجيل الخروج",
                            Icons.logout_outlined, context, 9)
                        : shapeFormat(isEngilsh ? "Log In " : "تسجيل الدخول",
                            Icons.login_outlined, context, 8)
                  ],
                ),
              ]))),
    );
  }
}
