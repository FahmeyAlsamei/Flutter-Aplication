import 'package:flutter/material.dart';

import '../../../share/component/components.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void selectionPage(BuildContext ctx, int n) {
    Navigator.of(ctx).pop('/');
  }

  TextEditingController user_Name = new TextEditingController();

  TextEditingController user_Password = new TextEditingController();

  TextEditingController user_Phone1 = new TextEditingController();

  TextEditingController user_Location = new TextEditingController();

  bool obScure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(119, 205, 188, 1),
        title: Text(" Edit Profile"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          decoration: defualtBoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.3),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/Qutaiba.jpg'))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 5, color: Colors.white),
                              color: Color.fromRGBO(119, 205, 188, 1),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                buildTextField(
                  labelText: 'Full Name',
                  placeholder: 'Qutaiba Sultan',
                ),
                SizedBox(
                  height: 10,
                ),
                buildTextField(
                  labelText: 'PhoneNumber',
                  placeholder: '',
                ),
                SizedBox(
                  height: 10,
                ),
                buildTextField(
                    labelText: 'Password',
                    placeholder: 'Qutaiba Sultan',
                    suffix: obScure ? Icons.visibility : Icons.visibility_off,
                    obscure: obScure,
                    onPressed: () {
                      print(obScure);
                      setState(() {
                        obScure = !obScure;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                buildTextField(
                  labelText: 'Location',
                  placeholder: 'Aden',
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: defualtElevatedButton(
                      title: 'SAVE',
                      function: () {
                        // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      paddingHorizatal: 15,
                      paddingVerical: 15,
                      border: 8),
                )
              ],
            ),
          )),
    );
  }
}

Widget buildTextField(
    {required String labelText,
    required String placeholder,
    IconData? suffix,
    bool obscure = false,
    VoidCallback? onPressed}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: Colors.grey,
                ),
                onPressed: onPressed)
            : null,
        contentPadding: EdgeInsets.only(bottom: 5, left: 10, top: 2),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.4),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: Color.fromRGBO(119, 205, 188, 1))),
      ),
    ),
  );
}
