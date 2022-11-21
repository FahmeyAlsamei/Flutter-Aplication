import 'package:flutter/material.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/models/language.dart';
import 'package:untitled3/presentation/screens/home/screan/appointment.dart';

import '../../../share/component/components.dart';
import '../../../share/component/constant_compontent/colors.dart';
import '../edite_screen/Editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEngilsh = Language.getData(key: "isDark") != null &&
          Language.getData(key: "isDark")!
      ? true
      : false;

  @override
  Widget build(BuildContext context) {
    Color color = MyColor.myYellow.withOpacity(0.8);
    return Directionality(
      textDirection: isEngilsh ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: color,
          ),
          body: Container(
              decoration: defualtBoxDecoration(),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [


                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topCenter,
                                stops: [
                                  1.9,
                                  8.5
                                ],
                                colors: [
                                  color.withOpacity(0.9),
                                  color,
                                ]),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: const Radius.circular(30)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child:  SizedBox(
                                height: 30,
                              )
                          ),

                          Text(
                              AppData.UserAccountData != null
                                  ? "${AppData.UserAccountData!.Email}"
                                  : "",
                              style: TextStyle(fontSize: 18, color: color)),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AppData.UserAccountData != null &&
                                            AppData.UserAccountData!
                                                    .images_user !=
                                                null &&
                                            AppData.UserAccountData!
                                                .images_user!.isNotEmpty
                                        ? NetworkImage(
                                            AppData
                                                .UserAccountData!.images_user!,
                                          ) as ImageProvider
                                        : const AssetImage(
                                            "assets/images/f.jpg",
                                          ),
                                  )),
                            ),
                          ),
                          SizedBox(height: 5,),
                          SizedBox(

                            child: Text(
                                AppData.UserAccountData != null &&
                                    AppData.UserAccountData!.id != 0
                                    ? AppData.UserAccountData!.Full_Name!
                                    : "مرحباً بك !",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),

                          ),
                          SizedBox(
                            child: Text(
                                AppData.UserAccountData != null &&
                                    AppData.UserAccountData!.id != 0
                                    ? "${AppData.UserAccountData!.PhoneNo}"
                                    : "مرحباً بك !",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    // margin: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.width / 2.5),
                    // padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.width / 3.2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    // height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      // physics: const NeverScrollableScrollPhysics(),
                      children: [

                        SizedBox(height: 10,),
                        Center(
                          child: defualtElevatedButtonIcon(
                              title: isEngilsh
                                  ? "Update my profile"
                                  : "تعديل ملفي الشخصي",
                              function: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return EditProfile();
                                }));
                              },
                              icon: Icons.update,
                              paddingHorizatal: 13,
                              border: 25),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyAppointment()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(234, 235, 243, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Row(children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.edit_calendar_outlined,
                                      color: color,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Text(
                                      isEngilsh ? "My Orders" : "طلباتي",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: isEngilsh
                                              ? null
                                              : FontWeight.w700
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.black,
                                  ))
                                ]),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(234, 235, 243, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Row(children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.favorite,
                                      color: color,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Text(
                                      isEngilsh ? "My Favorite" : "مفضلاتي",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: isEngilsh
                                              ? null
                                              : FontWeight.w700),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.black,
                                  ))
                                ]),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
