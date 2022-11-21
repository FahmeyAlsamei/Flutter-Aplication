/// ClientModel.dart
import 'dart:convert';


Users UserFromJson(String str) {
  final jsonData = json.decode(str);
  return Users.fromMap(jsonData);
}

String UserToJson(Users data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Users {
  int? id;
  String? Full_Name;
  String? password;
  String? Email;

  // bool isBlockBool;
  String? location;

  String? PhoneNo;
  String? Date_Update;
  String? Date_Added;
  String? images_user;

  Users({
     this.id,
    this.password,
    this.Date_Added,
    this.Date_Update,
    this.images_user,
    this.Full_Name,
    this.PhoneNo,
    this.Email,
    this.location,
    // this.isAdminBool,
    // this.isBlockBool,
  });



  factory Users.fromMapfetchUserAccount(Map<String, dynamic> json) => new Users(
    id: json["id"],
    Full_Name: json["Full_Name"],
    password: json["password"],
    Email: json["Email"],

    // isBlock: json["isBlock"] != null ? json["isBlock"] : 0,
    // isAdmin: json["isAdmin"] != null ? json["isAdmin"] : 0,
    // isBlockBool: json["isBlock"] != null ? json["isBlock"] : false,
    // isAdminBool: json["isAdmin"] != null ? json["isAdmin"] : false,
    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,

    location:json["location"],

    PhoneNo: json["PhoneNo"],
    images_user: json["images_user"],
    Date_Added: json["Date_Added"],
    Date_Update: json["Date_Update"],

    // KeyActiveStatus: json["KeyActiveStatus"],
  );

  factory Users.fromMap(Map<String, dynamic> json) => new Users(
    id: json["id"],
    Full_Name: json["Full_Name"],
    password: json["password"],
    Email: json["Email"],


    // keyVerify: json["keyVerify"],
    // isVerify: json["isVerify"]==0,

    PhoneNo: json["PhoneNo"],
    images_user: json["images_user"],
    Date_Added: json["Date_Added"],
    Date_Update: json["Date_Update"],

    // KeyActiveStatus: json["KeyActiveStatus"],
  );
  Map<String, dynamic> toMap() => {
    "id": id,
    "Full_Name": Full_Name,
    "password": password,
    "Email": Email,
    "PhoneNo": PhoneNo,

    "PhoneNo": PhoneNo,
    " images_user": images_user,
    "id_api": id,
    // "last_Name": lastName,
    "Date_Added": Date_Added,
    "Date_Update": Date_Update,
  };


  Map<String, dynamic> toMapDataBaseSave() => {
    "id": id,
    "Full_Name": Full_Name,
    "password": password,
    "Email": Email==null&& Email==''?"": Email,
    // "isVerify": isVerify,
    "PhoneNo": PhoneNo,
    " images_user": images_user,
    "id_api": id,
    // "last_Name": lastName,
    "Date_Added": Date_Added,
    "Date_Update": Date_Update,
    // "isBlock": isBlock,
    // "isAdmin": isAdmin,
    // "isBlock": isBlock!=null && isBlock? 1:0,
    // "isAdmin": isAdmin!=null && isAdmin? 1:0,
    // "KeyActiveStatus": KeyActiveStatus

  };

  Map<String, dynamic> toMapForUpdateKayInDataBase() => {
    "id": id,
    // "Full_Name": Full_Name,
    // "UserName": UserName,
    // "password": password,
    // "Email": Email,
    // "keyVerify": keyVerify,
    // "isVerify": isVerify ,

    // "session_no": session_no,
    // "PhoneNo": PhoneNo,
    // "IMEI_device":IMEI_device,
    // " images_user":images_user,
    // "Frist_Name": fristName,
    //"id_api":id,
    // // "last_Name": lastName,
    // "Date_Added": Date_Added,
    // "Date_Update": Date_Update,
    // "KeyActiveStatus":KeyActiveStatus
  };
  factory Users.fromJsonSave(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      Full_Name: json['Full_Name'],

      Email: json['Email'],
      // keyVerify: json['keyVerify'],
      password: json['password'],
      PhoneNo: json['PhoneNo'],
      // "PhoneNo": PhoneNo,

      images_user: json['images_user'],

    );
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      Full_Name: json['Full_Name'],

      Email: json['Email'],
      // keyVerify: json['keyVerify'],
      password: json['password'],
      PhoneNo: json['PhoneNo'],
      location:  json['location'],
      Date_Update:  json['Date_Update'],
      Date_Added:   json['Date_Added'],

      // "PhoneNo": PhoneNo,
      // isBlock:  json["isBlock"] != null &&   json["isBlock"] == false ? 0: json["isBlock"] != null &&   json["isBlock"] == true ?1:0,

      // isAdmin:  json["isAdmin"] != null &&   json["isAdmin"] == false ? 0: json["isAdmin"] != null &&   json["isAdmin"] == true ?1:0,
      images_user: json['images_user'],

    );
  }
  factory Users.fromJsonListComercial(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      Full_Name: json['Full_Name'],

      Email: json['Email'],
      // keyVerify: json['keyVerify'],
      password: json['password'],
      PhoneNo: json['session_no'],


      // KeyActiveStatus: json['KeyActiveStatus'],
      // session_no: json['session_no'],
      // IMEI_device: json['IMEI_device'],
      images_user: json['images_user'],

    );
  }

  dynamic toJson() => {
    'id': id,
    'Full_Name': Full_Name,
    'Email': Email,
    'password': password,
    'PhoneNo': PhoneNo,
    "images_user": images_user,
  };

  dynamic toJsonsave() => {
    'id': id,
    'Full_Name': Full_Name,
    'Email': Email,
    //'keyVerify':KeyActiveStatus,
    'password': password,
    'PhoneNo': PhoneNo,

    "images_user": images_user,

  };
}
