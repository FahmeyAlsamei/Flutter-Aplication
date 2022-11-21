import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intil;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled3/presentation/screens/home/screan/home_screen.dart';
import 'package:untitled3/share/component/constant_compontent/colors.dart';

import '../../models/language.dart';

bool isEnglish =
    Language.getData(key: "isDark") != null && Language.getData(key: "isDark")!
        ? true
        : false;
Widget defualtOutLinedButton(
    {required String title,
    Color background = Colors.white,
    required Function() function,
    double paddingHorizatal = 50,
    double paddingVerical = 13,
    double border = 20,
    required bool isEnglish}) {
  return OutlinedButton(
    onPressed: function,
    style: OutlinedButton.styleFrom(
        backgroundColor: background,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizatal, vertical: paddingVerical),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(78, 162, 152, 1),
            ),
            borderRadius: BorderRadius.circular(
              border,
            ))),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: isEnglish ? 2 : 0,
        color: Colors.black,
      ),
    ),
  );
}

Widget defualtElevatedButton(
    {required String title,
    required Function() function,
    double paddingHorizatal = 94,
    double paddingVerical = 13,
    double letterSpacing = 0,
    double border = 20}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
        primary:  MyColor.myYellow,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizatal, vertical: paddingVerical),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        )),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 14,
          fontWeight: letterSpacing == 0 ? FontWeight.bold : FontWeight.w600,
          color: Colors.white,
          letterSpacing: letterSpacing),
    ),
  );
}

Widget defualtElevatedButtonWithColor(
    {required String title,
    required Function() function,
    double paddingHorizatal = 94,
    double paddingVerical = 13,
    double letterSpacing = 0,
    Color background = Colors.white,
    double border = 20}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
        primary: background,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizatal, vertical: paddingVerical),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        )),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 14,
          fontWeight: letterSpacing == 0 ? FontWeight.bold : FontWeight.w600,
          color: Colors.white,
          letterSpacing: letterSpacing),
    ),
  );
}

Widget defualtElevatedButtonIcon(
    {required String title,
    required Function() function,
    required IconData icon,
    Color background = const Color.fromRGBO(212, 148, 107,0.8),
    double paddingHorizatal = 94,
    double paddingVerical = 13,
    double letterSpacing = 0,
    double border = 20}) {
  return ElevatedButton.icon(
    onPressed: function,
    label: Text(title,
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'Crimson_Pro',
            fontWeight: FontWeight.w600,
            letterSpacing: letterSpacing,
            color: Colors.white)),
    icon: Icon(
      icon,
      color: Colors.white,
    ),
    style: ElevatedButton.styleFrom(
        primary: background,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizatal, vertical: paddingVerical),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        )),
  );
}

Widget defualtRadioList(
    {required String title,
    required int value,
    required int choosenValue,
    required Function(dynamic value) function}) {
  return RadioListTile(
    title: Text(title),
    value: value,
    groupValue: choosenValue,
    onChanged: function,
    activeColor: const Color.fromRGBO(78, 162, 152, 1),
  );
}

Widget defualtCheckboxListTile({
  required String title,
  required bool checkValue,
  required Function(dynamic value) function,
}) {
  return CheckboxListTile(
    title: Text(title),
    controlAffinity: ListTileControlAffinity.leading,
    value: checkValue,
    onChanged: function,
    autofocus: false,
    activeColor: Colors.blue,
    checkColor: Colors.white,
  );
}

defualtRichedText({
  required String firstTitle,
  required String secondtTitle,
  required TapGestureRecognizer firstTime,
  required TapGestureRecognizer secondtTime,
  FontWeight font = FontWeight.w500,
}) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
      text: firstTitle,
      style: TextStyle(
          fontSize: 15,
          color: Colors.blue.withOpacity(1),
          fontWeight: font,
          decoration: TextDecoration.underline),
      recognizer: firstTime,
    ),
    const TextSpan(text: '  -  ', style: TextStyle(color: Colors.grey)),
    TextSpan(
      text: secondtTitle,
      style: TextStyle(
          fontSize: 15,
          color: Colors.blue.withOpacity(1),
          fontWeight: font,
          decoration: TextDecoration.underline),
      recognizer: secondtTime,
    ),
  ]));
}

defualtTextSpan({
  required String title,
  required TapGestureRecognizer isTime,
  FontWeight font = FontWeight.w500,
}) {
  return TextSpan(
    text: title,
    style: TextStyle(
        fontSize: 15,
        color: Colors.blue.withOpacity(1),
        fontWeight: font,
        decoration: TextDecoration.underline),
    recognizer: isTime,
  );
}

Widget defualtIconButton({
  required Icon icon,
  required Function() function,
}) {
  return IconButton(
      icon: icon,
      color: const Color.fromRGBO(78, 162, 152, 1),
      splashColor: const Color.fromRGBO(234, 235, 243, 1),
      onPressed: function);
}

Widget defualtDilog({required Function() function}) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey, width: 2)),
    child: Container(
      height: 150,
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '8', suffixText: 'AM'),
                ),
              ),
              Text(" To"),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '5', suffixText: 'PM'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: function,
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(138, 215, 228, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                      fontSize: 15, color: Colors.black, letterSpacing: 2),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

//
// Widget defualtTextFiledForInformation(
//     {
//    required String hinText,
//     required IconData icon,
//    required TextEditingController myController,
//     TextInputType inputType=TextInputType.text  ,
//     int numberOfline=1
//
//   } ) {
//   return TextFormField(
//
//     controller: myController,
//     keyboardType: inputType,
//     maxLines: numberOfline,
//     decoration: InputDecoration(
//       hintText: hinText,
//       hintStyle: TextStyle(color: Colors.grey,fontSize: 19),
//       filled: true,
//       fillColor: Colors.white,
//       prefixIcon: Icon(
//         icon,
//         color: Colors.black,
//         size: 26,
//       ),
//       contentPadding: EdgeInsets.symmetric(vertical: 2),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             color: Colors.grey.withOpacity(0.8),
//           )),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//               width: 2,
//               style: BorderStyle.solid,
//               color: Color.fromRGBO(138, 215, 228, 1))),
//     ),
//
//   );
// }

Widget defualtTextField(
    {required String hinText,
    bool isScore = false,
    IconData? icon,
    VoidCallback? onPressed,
    required TextEditingController myController,
    TextInputType inputType = TextInputType.text,
    int numberOfline = 1,
    bool readonly = false,
    FormFieldValidator<String>? validator,
    String? errorText,
    IconData? suffix,
    GestureTapCallback? onTap}) {
  return TextFormField(
    validator: validator,
    readOnly: readonly,
    controller: myController,
    keyboardType: inputType,
    maxLines: numberOfline,

    // textAlign: TextAlign.right,
    // onTap: onTap,

    onTap: () {
      if (onTap != null) {
        onTap();
      }
      if (myController.selection ==
          TextSelection.fromPosition(
              TextPosition(offset: myController.text.length - 1))) {
        // setState(() {
        myController.selection = TextSelection.fromPosition(
            TextPosition(offset: myController.text.length));
        // });
      }
    },enableSuggestions: false,
    autocorrect: false,
      cursorColor:MyColor.myYellow,
    decoration: InputDecoration(
      border: InputBorder.none,
      // hintText: "Search Restaurant",
      filled: true,


      errorText: errorText,
      hintText: hinText,
      // hintText: "",
      hintStyle: icon == Icons.attach_money
          ? TextStyle(fontSize: 12, fontWeight: FontWeight.w700)
          : null,
      // filled: true,
      // isDense: false,

      fillColor: Colors.white,
      suffixIcon: suffix != null
          ? IconButton(
              icon: Icon(
                suffix,
                color:  MyColor.myYellow,
                size: 26,
              ),
              onPressed: onPressed,
            )
          : null,
      prefixIcon: Icon(
        icon,
        color:  MyColor.myYellow,
        size: 26,
      ),

      contentPadding:
          EdgeInsets.symmetric(vertical: 12, horizontal: icon == null ? 0 : 10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color:  MyColor.myYellow.withOpacity(0.8),
        ),
      ),
    ),
    style: const TextStyle(height: 1.7,decorationStyle: TextDecorationStyle.solid),
    obscureText: isScore,

  );
}

BoxDecoration defualtBoxDecoration() {
  return const BoxDecoration(
//Color.fromRGBO(170, 234, 201, 0.7),
// Color.fromRGBO(234, 223, 239, 0.6),
//Color.fromRGBO(204, 204, 255, 0.6), //C
//Color.fromRGBO(138, 215, 228, 0.8),
//
// Color.fromRGBO(234, 234, 255, 0.6),
// Color.fromRGBO(41, 149, 150, 1),
      color: MyColor.myGrey//Color.fromRGBO(244, 245, 250, 255)

      // color: Color.fromRGBO(235, 236, 243, 1),
      //248,248,255)
      //(240, 239, 241, 1),
      //  Color.fromRGBO(234, 235, 243, 1),
      // Color.fromRGBO(240, 239, 241, 1),
      // Color.fromRGBO(230, 223, 247, 1),
      // Color.fromRGBO(249,245, 250, 1),
      );
}

defualtBoxDecoration1() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.grey.withOpacity(0.3)),
  );
}

Widget defualtTheme(
  context,
  child,
) {
  return Column(
    children: [
      Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(119, 205, 188, 1),
              // header background color
              onPrimary: Colors.black,
              // header text color
              onSurface: Colors
                  .black //Color.fromRGBO(119, 205, 188, 1), // body text color
              ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary:
                  MyColor.myYellow, // button text color
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: 450,
            width: 750,
            child: child,
          ),
        ),
      ),
    ],
  );
}

Widget defualtTheme1(
  context,
  child,
) {
  return Column(
    children: [
      Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(119, 205, 188, 1),
              // header background color
              onPrimary: Colors.black,
              // header text color
              onSurface: Colors
                  .black //Color.fromRGBO(119, 205, 188, 1), // body text color
              ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary:
                  const Color.fromRGBO(119, 205, 188, 1), // button text color
            ),
          ),
        ),
        // child: child,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: 500,
            width: 750,
            child: child,
          ),
        ),
      ),
    ],
  );
}

defualtDateTimeField({required TextEditingController controller}) {
  final timeframe = intil.DateFormat("hh:mm a");
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: DateTimeField(
        format: timeframe,
        controller: controller,
        style: const TextStyle(
          color: Color.fromRGBO(36, 164, 164, 1),
        ),
        onShowPicker: (context, currentValue) async {
          final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              builder: defualtTheme);
          return time == null ? null : DateTimeField.convert(time);
        }),
  );
}

defualtTextForTableRow(
    {required String title,
    double? fontSize = 15,
    Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 1,
    ),
    child: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontSize, color: color),
    ),
  );
}

defualtContianerForTableRow(
  String title,
) {
  return Container(
    padding: const EdgeInsets.all(2),
    height: 30,
    child: Text(
      title,
      style: const TextStyle(color: Colors.grey),
    ),
  );
}

defualtContianerForTableRow1(
  String title,
) {
  return Container(
    padding: const EdgeInsets.all(2),
    height: 30,
    child: Text(
      title,
      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
    ),
  );
}

defualtContianerForTableRow2(
  String title,
) {
  return Container(
    padding: const EdgeInsets.all(2),
    height: 30,
    child: Text(
      title,
      style: const TextStyle(
          color: Color.fromRGBO(36, 164, 164, 1), fontWeight: FontWeight.w400),
    ),
  );
}

defualtContianerForTableRow3(
  String title,
) {
  return Container(
    padding: const EdgeInsets.only(top: 2, left: 8, right: 2, bottom: 2),
    height: 30,
    child: Text(
      title,
      style: const TextStyle(color: Colors.grey),
    ),
  );
}

Widget buildText(
    String text, String fontfamily, FontWeight? fontWeight, bool isReadmore) {
  // if read more is false then show only 3 lines from text
  // else show full text
  final lines = isReadmore ? null : 2;
  return Text(
    text,
    style:
        TextStyle(fontSize: 12, fontFamily: fontfamily, fontWeight: fontWeight),
    maxLines: lines,
    // overflow properties is used to show 3 dot in text widget
    // so that user can understand there are few more line to read.
    overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
  );
}

defualtDropdownButtonFormField({
  required List<String> listOfValue,
  required var value,
  required Text text,
  Icon? icon,
  Container? container,
  String? errDownButon,
  required Function(dynamic val) onChanged,
  required Function(dynamic val) onSaved,
  // required Function(dynamic val) icon,
}) {
  return DropdownButtonFormField(
    value: value,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    hint: text,
    onChanged: onChanged,
    //     (value) {
    //   setState(() {
    //     _selectedValue = value;
    //   });
    // },
    onSaved: onSaved,
    //     (value) {
    // setState(() {
    // _selectedValue = value;
    // });
    // },
    isDense: false,
    icon: Icon(Icons.arrow_drop_down_circle),
    iconDisabledColor: Colors.red,
    iconEnabledColor: Color.fromRGBO(119, 205, 188, 1),
    isExpanded: true,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorText: errDownButon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Color.fromRGBO(119, 205, 188, 0.6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.4),
            )),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5)),
    items: listOfValue.map((String val) {
      return DropdownMenuItem(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                icon!,
                SizedBox(
                  width: 30,
                ),
                Text(val),
              ],
            ),
          ));
    }).toList(),
  );
}

dilogShow(BuildContext context, bool isEnglish) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey)),
    backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
    child: Container(
      height: isEnglish
          ? MediaQuery.of(context).size.height / 3
          : MediaQuery.of(context).size.height / 2.8,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Icon(
              Icons.check_circle,
              color: Color.fromRGBO(119, 205, 188, 1),
              size: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isEnglish
                  ? ''' Will try to add information to application as soon as possible after validation process of them. and Thanks'''
                  : ''' سوف نحاول قدر الامكان اضافة المعلومات في التطبيق في أقرب وقت ممكن بعد التحقق منها وشكراً''',
              style: TextStyle(
                  fontSize: isEnglish ? 14 : 18,
                  fontWeight: isEnglish ? FontWeight.w500 : FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 29,
          ),
          SizedBox(
            width: double.infinity,
            child: defualtElevatedButton(
              title: isEnglish ? "Agree" : " موافق ",
              function: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }), (route) => false);
              },
              border: 8,
              paddingHorizatal: 35,
              paddingVerical: 10,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<Widget> erroDilogShow(BuildContext context, bool isEnglish) async {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey)),
    backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
    child: Container(
      height: isEnglish
          ? MediaQuery.of(context).size.height / 3
          : MediaQuery.of(context).size.height / 2.8,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Icon(
              Icons.info_outline,
              color: Color.fromRGBO(119, 205, 188, 1),
              size: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isEnglish
                  ? ''' Filed to get data please check internet connection..'''
                  : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',
              style: TextStyle(
                  fontSize: isEnglish ? 14 : 18,
                  fontWeight: isEnglish ? FontWeight.w500 : FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 29,
          ),
          SizedBox(
            width: double.infinity,
            child: defualtElevatedButton(
              title: isEnglish ? "Agree" : " موافق ",
              function: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }), (route) => false);
              },
              border: 8,
              paddingHorizatal: 35,
              paddingVerical: 10,
            ),
          ),
        ],
      ),
    ),
  );
}

errrorDilod(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,

    // type: AlertType.info,

    desc: isEnglish
        ? ''' Filed to get data please check internet connection..'''
        : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',
    style: AlertStyle(
      descStyle: TextStyle(
          fontSize: isEnglish ? 14 : 18,
          fontWeight: isEnglish ? FontWeight.w500 : FontWeight.w700),

      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: true,

      overlayColor: Color.fromRGBO(235, 236, 243, 0.1),

      //  descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 10),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    ),

    buttons: [
      DialogButton(
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (route) => false),
        color: const Color.fromRGBO(119, 205, 188, 1),
        child: Text(
          isEnglish ? "Agree" : "موافق",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      //     // DialogButton(
      //     //   child: Text(
      //     //     isEnglish ? " Later " : "لاحقا",
      //     //     style: TextStyle(
      //     //         color: Colors.white, fontSize: 20),
      //     //   ),
      //     //   onPressed: () => Navigator.pop(context),
      //     //   gradient: LinearGradient(colors: [
      //     //     Color.fromRGBO(76, 22, 72, 1),
      //     //     Color.fromRGBO(99, 55, 66, 1.0)
      //     //   ]),
      //     // ),
    ],
  ).show();
}

noInterntConnection() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        isEnglish
            ? ''' Filed to get data please check internet connection..'''
            : ''' فشل في جلب البيانات رجاء تحقق من اتصال الانترنت ''',
        style: TextStyle(
            fontSize: isEnglish ? 14 : 18,
            fontWeight: isEnglish ? FontWeight.w500 : FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
