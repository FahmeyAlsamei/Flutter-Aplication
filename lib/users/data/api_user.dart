import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/config/path.dart';
import 'package:untitled3/users/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiProvider with ChangeNotifier {
  UserApiProvider() {
    //this.fetchTasks();
  }

  List<Users> _todos = [];
  List<Users> _usersErr = [];

  List<Users> get todos {
    return [..._todos];
  }

  int ChckLogIN = 0;

  Future<Users?> logInUserByPhoneNo(
      {String PhoneNo = '', String password = ''}) async {
    // AppData.androidDeviceInfo;

    //
    // String Phone=PhoneNo;
    //
    //       if(PhoneNo.startsWith('+967'))
    //         Phone=PhoneNo;
    //       else if(PhoneNo.startsWith('77')||PhoneNo.startsWith('73')||PhoneNo.startsWith('71')||PhoneNo.startsWith('70')){
    //         Phone="%2B967"+PhoneNo;
    //       }
    // if(PhoneNo.startsWith('+966'))
    //   Phone=PhoneNo;
    // else if(PhoneNo.startsWith('051')||PhoneNo.startsWith('050')||PhoneNo.startsWith('017')||PhoneNo.startsWith('058')
    //
    //     ||PhoneNo.startsWith('059')||PhoneNo.startsWith('054')||PhoneNo.startsWith('056')){
    //   Phone="%2B966"+PhoneNo;
    // }
    String unencodedPath = "/api/User/?PhoneNo=$PhoneNo"
        "&password=$password";

    Map data;
    print("https://" + PathAPI.PATH_MAIN_API_local + unencodedPath);

    var url =
        Uri.parse("https://" + PathAPI.PATH_MAIN_API_local + unencodedPath);
    final response = await http.get(url, headers: PathAPI.Header);

    if (response.statusCode == 200) {
      try {
        // dataPhoneNo = json.decode(response.body);
        // //);
        data = json.decode(utf8.decode(response.bodyBytes));

        // if(data['results'].length>0) {
        //   Users user = Users.fromJson(
        //       json.decode(utf8.decode(response.bodyBytes))['results'][0]);
        //   UsersForInfoPrivateModel us=UsersForInfoPrivateModel.fromJson(json.decode(utf8.decode(response.bodyBytes))['results'][0]);
        //   SaveLogInOp(iduser:user.id,user: us,user_name: PhoneNo,password: password);
        // }
        // user.I

        // if (data['results'].length > 0) await AccountConfig.addToRefrence(user);

        if (data['results'].length > 0) {
          Users user = Users.fromJson(
              json.decode(utf8.decode(response.bodyBytes))['results'][0]);

          AppData.UserAccountData = user;
          await AccountConfig.addToRefrence(user);
          return AppData.UserAccountData!;
        }
        notifyListeners();
        //   setState(() {
        // });
      } catch (exeption) {
        // return   AppData.UserAccountData;
      }
    }
    ChckLogIN = 0;
    return null;
  }

  Future<Users> addUsers(Users users) async {
    // users.UserName = users.UserName.contains(other)

    // if(prefs?.getString("CodeCountry")=="+966"){
    //   idCountry=2;
    // }
    // if(prefs?.getString("CodeCountry")=="+967"){
    //   idCountry=1;
    // }
    // if(prefs?.getString("CodeCountry")=="+965"){
    //   idCountry=3;
    // }
    // if(prefs?.getString("CodeCountry")=="+971"){
    //   idCountry=4;
    // }
    // if(prefs?.getString("CodeCountry")=="+974"){
    //   idCountry=5;
    // }
    // if(prefs?.getString("CodeCountry")=="+968"){
    //   idCountry=6;
    // }
    // if(prefs?.getString("CodeCountry")=="+973"){
    //   idCountry=7;
    // }
    // if(prefs?.getString("CodeCountry")=="+963"){
    //   idCountry=8;
    // }

    final unencodedPath = '/api/User/';

    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);

    // "id": 9,
    // "url": "https://testmyguideatmyphone.pythonanywhere.com/RowadMarketing-api/v8/UserInfo/UsersRegisterAndLogIn/9/",
    // "Frist_Name": null,
    // "last_Name": null,
    // "Synopsis": null,
    // "Full_Name": "hxbxnbxnb",
    // "Email": "jshsgsh@hdghdgd.com",
    // "Gender": null,
    // "Date_Update": "2022-02-08T18:55:11.631456Z",
    // "Date_Added": "2022-02-08T18:55:11.631494Z",
    // "IMEI_device": "1efa300ab8ca2438",
    // "password": "ddddd",
    // "session_no": "LJr3BchzQ8IwY1uZijz36qgWLTm",
    // "UserName": "dddd",
    // "PhoneNo": "737310611",
    // "keyVerify": [],
    // "images_user": null,
    // "KeyActiveStatus": true

    var request = http.MultipartRequest(
      'POST',
      url,
    );

    // request.headers=PathAPI.Header;

    //request.fields['Frist_Name'] = users.fristName;

    if (users.images_user != null && users.images_user!.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'images_user', users.images_user ?? ""));
    }
    request.fields['Full_Name'] = users.Full_Name ?? "";
    request.fields['location'] = users.location ?? "";
    // request.fields['PhoneNo_one'] = todo.phoneNoOne;
    // request.fields['PhoneNo_two'] = todo.phoneNoTwo;
    // request.fields['PhoneNo_whatsapp'] = todo.phoneNoWhatsapp;
    // // request.fields['PhoneNo_landline'] = todo.Name;
    // request.fields['PhoneNo_landline'] = todo.phoneNoLandline;
    request.fields['password'] = users.password ?? "";
    request.fields['PhoneNo'] = users.PhoneNo ?? "";

    // request.fields['Synopsis'] = users.Synopsis;
    // "Name": "scdscdsc",
    // "Detial_AR": "scsc",
    // "location_Name": "scsc",
    // "Detial_EN": "scsc",
    // "Name_EN": "",
    // "images_main": null,
    // "PhoneNo_one": "",
    // "PhoneNo_two": "",
    // "PhoneNo_whatsapp": "",
    // "PhoneNo_landline": "",
    // "latitude": null,
    // "longitude": null

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));
    // final response = await http.post(url,
    //     headers:
    //     {
    //       "Content-Type": "application/json",
    //       //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
    //
    //     }
    //  ,
    //       body: jsonEncode(users.toJsonsave()));
    ////
    ////
    if (response.statusCode == 201) {
      //users.id = json.decode(response.body)['id'];
      //_todos.add(users);
      // Future<List<Users> >

      ////

      Users user = Users.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      AppData.UserAccountData = user;
      await AccountConfig.addToRefrence(user);

      notifyListeners();

      return AppData.UserAccountData!;
    } else {
      // var data = utf8.decode(response.bodyBytes);

      // _usersErr =data.toList();

      return AppData.UserAccountData!;

      // if( data.Email.toString().isNotEmpty){
      //     return "التأكد من صحة البريد او قد يكون موجود من سابق";
      // }
      //  if( data["UserName"].toString().isNotEmpty){
      //     return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //   }
      //
      //  if( data["UserName"].toString().isNotEmpty){
      //      return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //  }

/*      'id': id,
     'UserName': UserName,
     'Full_Name': Full_Name,
     'KeyActiveStatus':KeyActiveStatus,
     'Email':Email,
     'keyVerify':KeyActiveStatus,
     'password':password,
     'PhoneNo':PhoneNo,
     'session_no':session_no,


     "images_user": images_user*/

      // ////data[0]);
      //  ////data.Email);

      // return response.body.toString();
    }
  }

  Future<Map> updateUser(Users users) async {
    // users.UserName=users.UserName.toLowerCase();
    // users.UserName= users.UserName.replaceFirst('ابراهيم', 'ibrahim');
    // users.UserName= users.UserName.replaceFirst('محمد', 'Mohammed');
    // users.UserName= users.UserName.replaceFirst('عايشة', 'Aisha');
    // users.UserName= users.UserName.replaceFirst('ياسمين', 'Jasmine');
    // users.UserName= users.UserName.replaceFirst('هارون', 'Aaron');
    // users.UserName= users.UserName.replaceFirst('كريم', 'Karim');
    // users.UserName= users.UserName.replaceFirst('جمال', 'Jamal');
    // users.UserName= users.UserName.replaceFirst('زين', 'Zain');
    // users.UserName= users.UserName.replaceFirst('ادم', 'Adam');
    // users.UserName= users.UserName.replaceFirst('دليلة', 'Dalila');
    // users.UserName= users.UserName.replaceFirst('ليلى', 'Leila');
    // users.UserName= users.UserName.replaceFirst('عبد القادر', 'AbduAlkader');
    // users.UserName= users.UserName.replaceFirst('عبد الله', 'AbduAllah');
    // users.UserName= users.UserName.replaceFirst('عبد', 'Abdu');
    // users.UserName= users.UserName.replaceFirst('عبده', 'Abdu');
    // users.UserName= users.UserName.replaceFirst('ايمن', 'Aymen');
    // users.UserName= users.UserName.replaceFirst('يمن', 'Yemen');
    // users.UserName= users.UserName.replaceFirst('ال', 'Al');
    //
    // //
    // // users.UserName= users.UserName.replaceFirst('احمد', 'Ahmad');
    // // users.UserName= users.UserName.replaceFirst('احمد', 'Ahmad');
    // // users.UserName= users.UserName.replaceFirst('احمد', 'Ahmad');
    // users.UserName= users.UserName.replaceFirst('ا', 'a');
    // users.UserName= users.UserName.replaceFirst('إ', 'e');
    // users.UserName= users.UserName.replaceFirst('أ', 'a');
    // users.UserName= users.UserName.replaceFirst('ب', 'b');
    // users.UserName= users.UserName.replaceFirst('ت', 'T');
    // users.UserName= users.UserName.replaceFirst('ث', 'th');
    // users.UserName= users.UserName.replaceFirst('ج', 'g');
    // users.UserName= users.UserName.replaceFirst('ح', 'h');
    // users.UserName= users.UserName.replaceFirst('خ', 'kh');
    // users.UserName= users.UserName.replaceFirst('د', 'd');
    // users.UserName= users.UserName.replaceFirst('ذ', 'th');
    // users.UserName= users.UserName.replaceFirst('ر', 'r');
    // users.UserName= users.UserName.replaceFirst('ز', 'z');
    // users.UserName= users.UserName.replaceFirst('س', 's');
    // users.UserName= users.UserName.replaceFirst('ش', 'sh');
    // users.UserName= users.UserName.replaceFirst('ص', 's');
    // users.UserName= users.UserName.replaceFirst('ض', 'th');
    // users.UserName= users.UserName.replaceFirst('ط', 't');
    // users.UserName= users.UserName.replaceFirst('ع', 'a');
    // users.UserName= users.UserName.replaceFirst('غ', 'gh');
    // users.UserName= users.UserName.replaceFirst('ف', 'f');
    // users.UserName= users.UserName.replaceFirst('ق', 'k');
    // users.UserName= users.UserName.replaceFirst('ك', 'kh');
    // users.UserName= users.UserName.replaceFirst('ل', 'l');
    // users.UserName= users.UserName.replaceFirst('م', 'm');
    // users.UserName= users.UserName.replaceFirst('ن', 'n');
    // users.UserName= users.UserName.replaceFirst('ه', 'h');
    // users.UserName= users.UserName.replaceFirst('و', 'u');
    // users.UserName= users.UserName.replaceFirst('ي', 'i');
    // users.UserName= users.UserName.replaceFirst(' ', '');

    var unencodedPath = '/api/User/${users.id}/';
    // var unencodedPath="/api/AllUsersApi/${4}";
    //  var unencodedPath="/api/AllUsersApi/${id}/";

    ////"https://"+PathAPI.PATH_MAIN_API+unencodedPath);
    ////"patch");
    ////"patch tow");

////' json.encode(users)');

    ////UserToJson(users));

    ////json.encode(users));
    // final response = await http.patch(url,
    //
    //     headers: <String, String>{
    //      // "content-type": " text/html; charset=utf-8",
    //
    //       'content-type': 'application/json; charset=UTF-8',
    //       //"connection": "keep-alive",
    //     //"location":" /api/AllUsersApi/4/", "date":" Wed, 28 Jul 2021 13:58:08 GMT",
    //       //"content-length": "263",
    //      //"referrer-policy": "same-origin",
    //       //"content-type": "text/html; charset=utf-8",
    //      // "x-content-type-options": "nosniff", "server": "PythonAnywhere", "x-clacks-overhead": "GNU Terry Pratchett"
    //       //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
    //       "Accept": "application/json",
    //       //"Content-Type": "application/x-www-form-urlencoded"
    //
    //     //  "Vary": "Accept"
    //     },
    //
    //     body: json.encode(users),
    //encoding:
    //);
    //
    //body: jsonEncode({
    //
    //   "Full_Name": "ابراهيم شاهر سعيد الزريقي",
    //   "Email": "rowad_marketing@gmail.com",
    // "password": "123456"
    //   "UserName": "rowad_marketing",
    //
    //   "keyVerify": "False"
    //
    //
    //
    //})
    //
    //   encoding: Encoding.getByName("utf-8")
    //
    //
    // );

    var request = http.MultipartRequest(
        'patch', Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath));
    // request.headers['authorization'] = PathAPI.Token_API;

    if (users.images_user != null && users.images_user!.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'images_user', users.images_user ?? ""));
    }
    if (users.id != null) request.fields['id'] = users.id.toString();

    if (users.Full_Name != null && users.Full_Name!.isNotEmpty) {
      request.fields['Full_Name'] = users.Full_Name ?? "";
    }
    if (users.Email != null && users.Email!.isNotEmpty) {
      request.fields['Email'] = users.Email ?? "";
    }
    // request.fields['PhoneNo_one'] = todo.phoneNoOne;
    // request.fields['PhoneNo_two'] = todo.phoneNoTwo;
    // request.fields['PhoneNo_whatsapp'] = todo.phoneNoWhatsapp;
    // // request.fields['PhoneNo_landline'] = todo.Name;
    // request.fields['PhoneNo_landline'] = todo.phoneNoLandline;
    if (users.password != null && users.password!.isNotEmpty) {
      request.fields['password'] = users.password ?? "";
    }

    if (users.PhoneNo != null && users.PhoneNo!.isNotEmpty) {
      request.fields['PhoneNo'] = users.PhoneNo ?? "";
    }

    // request.fields['Synopsis'] = users.Synopsis;

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      // await db.updateUser(Users.fromJsonSave(json.decode(utf8.decode(response.bodyBytes))));

      AppData.UserAccountData =
          Users.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      // await db.deleteAll();

      //

      // await db.newUser(Users.fromJsonSave(json.decode(utf8.decode(response.bodyBytes))));

      // prefs?.clear();
      prefs?.setBool("HaveAccount", true);

      await AccountConfig.addToRefrence(AppData.UserAccountData!);

      notifyListeners();
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      ////response.body.toString() );

      //var data = json.decode(response.body) ;
      // _usersErr =data.toList();

      //if( data.Email.toString().isNotEmpty){
      //return "التأكد من صحة البريد او قد يكون موجود من سابق";
      //}
      //if( data["UserName"].toString().isNotEmpty){
      //return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //}

      //if( data["UserName"].toString().isNotEmpty){
      //return "التأكد من اسم المستخدم او قد يكون موجود من سابقُ";
      //}

/*      'id': id,
     'UserName': UserName,
     'Full_Name': Full_Name,
     'KeyActiveStatus':KeyActiveStatus,
     'Email':Email,
     'keyVerify':KeyActiveStatus,
     'password':password,
     'PhoneNo':PhoneNo,
     'session_no':session_no,


     "images_user": images_user*/

      // ////data[0]);
      //  ////data.Email);

      return json.decode(utf8.decode(response.bodyBytes));
    }
  }

  fetchOnUserByID(int id) async {
    // await http.get(url,headers: PathAPI.Header);
    // if (response != null) if (response.statusCode == 200) {
    //   ////"dataUser");

    var unencodedPath = "/api/User/";
    ////"https://"+PathAPI.PATH_MAIN_API+unencodedPath+"?format=json");
    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath,
        {"${id}/?format": "json; charset=UTF-8"});
    ////"https://"+url.host+url.path+url.query);
    //
    //url.query.toString());
    ////url.isAbsolute);

    final response = await http.get(url, headers: PathAPI.Header);
    ////
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }

    // notifyListeners();
//  return  data;

    // fetchTasks() async {
    //   var unencodedPath="/api/AllUsersApi/?format=json";
    //   var url=Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);
    //   final response = await http.get(url,headers: PathAPI.Header);
    //   if (response != null) if (response.statusCode == 200) {
    //     var data = json.decode(response.body) as List;
    //     _todos = data.map<Users>((json) => Users.fromMap(json)).toList();
    //     notifyListeners();
    //   }
  }

  fetchOneUser(String Emile) async {
    var unencodedPath = "/UserDetilsApiWhithEmile/${Emile}/?format=json";
    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);
    final response = await http.get(url, headers: PathAPI.Header);
    if (response != null) if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Users>((json) => Users.fromMap(json)).toList();
      ////_todos);
      notifyListeners();
    }
  }
}
