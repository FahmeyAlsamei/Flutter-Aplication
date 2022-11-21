/// ClientModel.dart
import 'dart:ffi';

import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/users/model/user_model.dart';

class ServicesModel {
  int? id;
  String? Name;
  String? Detial_AR;
  // String? Email;
  bool? is_radiation;
  bool? is_laboratry;
  bool? is_farmacy;
  bool? is_clinic;
  bool? is_ServicesModel;
  String? Phone_Number_tow;

  String? location_Name;
  String? images_back;
  String? Phone_Number;
  String? Date_Update;
  String? Date_Added;
  String? images_main;

  Users? created_by;
  double? latitude;
  double? longitude;
  List<Category>? category;

  ServicesModel({
    this.id,
    this.Detial_AR,
    this.Date_Added,
    this.Date_Update,
    this.images_main,
    this.Name,
    this.Phone_Number,
    // this.Email,
    this.location_Name,
    this.images_back,
    this.is_clinic,
    this.is_farmacy,
    this.created_by,
    this.latitude,
    this.longitude,
    this.category = const [],
    this.is_ServicesModel,
    this.Phone_Number_tow,
    this.is_laboratry,
    this.is_radiation,
    // this.is_riting,
    // this.ratingdata,
  });

  // ActivTime? Activ_Time;
  // List<RatingdataServicesModel>? ratingdata;
  // List<IsRitingServicesModel>? is_riting;

  factory ServicesModel.fromMap(Map<String, dynamic> json) => ServicesModel(
        id: json["id"],
        Name: json["Name"],
        Detial_AR: json["Detial_AR"],

        // Email: json["Email"],
        category: json["category"] == null
            ? []
            : List<Category>.from(json["category"].map((x) =>
                x.runtimeType == Int ? Category(id: x) : Category.fromJson(x))),

        // doctors: json["doctors"] == null
        //       ? []
        //       : List<Doctors>.from(
        //       json["doctors"].map((x) => Doctors.fromJson(x))),

        created_by: json["created_by"] == null
            ? null
            : json["created_by"].runtimeType == int
                ? Users(id: json["created_by"])
                : Users.fromJsonListComercial(json["created_by"]),
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        // keyVerify: json["keyVerify"],
        // isVerify: json["isVerify"]==0,

        Phone_Number: json["Phone_Number"],
        images_main: json["images_main"],
        Date_Added: json["Date_Added"],

        Date_Update: json["Date_Update"],
        // Activ_Time: json["Activ_Time"] == null
        //     ? null: json["Activ_Time"].runtimeType==int?ActivTime(id:json["Activ_Time"])
        //     : ActivTime.fromJson(json["Activ_Time"]),

        // isBlock: json["isBlock"] != null ? json["isBlock"] : 0,
        // is_clinic: json["is_clinic"] != null ? json["is_clinic"] : 0,

        is_farmacy: json["is_farmacy"] ?? false,
        is_clinic: json["is_clinic"] ?? false,
        is_laboratry: json["is_laboratry"] ?? false,
        is_radiation: json["is_radiation"] ?? false,
        is_ServicesModel: json["is_ServicesModel"] ?? true,

        Phone_Number_tow: json["Phone_Number_tow"],

        // keyVerify: json["keyVerify"],
        // isVerify: json["isVerify"]==0,
        // is_riting: json["isRiting"] == null
        //     ? []
        //     : List<IsRitingServicesModel>.from(
        //     json["isRiting"].map((x) => IsRitingServicesModel.fromJson(x))),

        // ratingdata: json["ratingdata"] == null
        //     ? []
        //     : List<RatingdataServicesModel>.from(
        //     json["ratingdata"].map((x) => RatingdataServicesModel.fromJson(x))),
        location_Name: json["location_Name"],

        // KeyActiveStatus: json["KeyActiveStatus"],
      );
  factory ServicesModel.fromMapForSave(Map<String, dynamic> json) =>
      ServicesModel(
        id: json["id"],
        Name: json["Name"],
        Detial_AR: json["Detial_AR"],

        // Email: json["Email"],
        // category: json["category"] == null
        //     ? []
        //     : List<Category>.from(
        //     json["category"].map((x) => Category.fromJson(x))),
        // created_by: json["created_by"] == null
        //     ? null
        //     : Users.fromJsonListComercial(json["created_by"]),
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        // keyVerify: json["keyVerify"],
        // isVerify: json["isVerify"]==0,
        images_back: json["images_background"],
        Phone_Number: json["Phone_Number"],
        images_main: json["images_main"],
        Date_Added: json["Date_Added"],

        Date_Update: json["Date_Update"],
        // Activ_Time: json["Activ_Time"] == null
        //     ? null
        //     : ActivTime.fromJson(json["Activ_Time"]),

        // isBlock: json["isBlock"] != null ? json["isBlock"] : 0,
        // is_clinic: json["is_clinic"] != null ? json["is_clinic"] : 0,

        is_farmacy: json["is_farmacy"] ?? false,
        is_clinic: json["is_clinic"] ?? false,
        is_laboratry: json["is_laboratry"] ?? false,
        is_radiation: json["is_radiation"] ?? false,
        is_ServicesModel: json["is_ServicesModel"] ?? true,
        Phone_Number_tow: json["Phone_Number_tow"],

        // keyVerify: json["keyVerify"],
        // isVerify: json["isVerify"]==0,
        // is_riting: json["isRiting"] == null
        //     ? []
        // : List<IsRitingServicesModel>.from(
        // json["isRiting"].map((x) => IsRitingServicesModel.fromJson(x))),

        // ratingdata: json["ratingdata"] == null
        //     ? []
        //     : List<RatingdataServicesModel>.from(
        //     json["ratingdata"].map((x) => RatingdataServicesModel.fromJson(x))),
        location_Name: json["location_Name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Name": Name,
        "Detial_AR": Detial_AR,
        // "Email": Email,
        "Phone_Number": Phone_Number,
        "category": category?.map((x) => x.id).toList(),
        "Phone_Number": Phone_Number,
        " images_main": images_main,
        "id_api": id,
        // "last_Name": lastName,
        "Date_Added": Date_Added,
        "images_background": images_back,
        "Date_Update": Date_Update,
      };

  dynamic toJsonsaveLocation() => {
        'latitude': latitude,
        // 'Email': Email,
        //'keyVerify':KeyActiveStatus,
        'longitude': longitude,
      };

  dynamic toJsonsave() => {
        'id': id,
        'Name': Name,
        // 'Email': Email,
        //'keyVerify':KeyActiveStatus,
        'Detial_AR': Detial_AR,
        'Phone_Number': Phone_Number,
        "images_background": images_back,
        "images_main": images_main,
      };
}
