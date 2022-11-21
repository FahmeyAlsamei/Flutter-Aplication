import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/services/models/services_models.dart';
import 'package:untitled3/users/model/user_model.dart';

class RequestModel {
  int? id;
  Users? created_by;

  String? request_date;
  String? request_time;
  bool? isCancel;
  bool? isConform;
  bool? isFinish;

  String? Name;
  String? Phone_Number;

  String? Date_Update;
  String? Date_Added;
  Category? category;
  ServicesModel? services;

  RequestModel(
      {this.id,
      this.created_by,
      this.Name,
      this.Phone_Number,
      this.category,
      this.request_date,
      this.request_time,
      this.Date_Update,
      this.Date_Added,
      this.isCancel,
      this.isConform,
      this.isFinish,
      this.services});

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        // category:json['category'] ==null?null:json['category'],
        // doctors:json['doctor'] ==null?null:json['doctor'],
//      hospital,
        Name: json['Name'],
        Phone_Number: json['Phone_Number'],

        id: json['id'],
        Date_Added: json['Date_Added'],
        Date_Update: json['Date_Update'],
        isFinish: json['isFinish'],
        request_date: json['request_date'],
        request_time: json['request_time'],
        isCancel: json['isCancel'],
        isConform: json['isConform'],
        // blood_Type: json['isCancel'],
        // gender: json['gender'],
        // is_data_aveilable: json['is_data_aveilable'],
        // volunteer_data:json['volunteer_data'],
        // last_volunted_date:json['last_volunted_date'] ,
        // status:json['status'] ,
        // is_blood_volunteer:json['is_blood_volunteer'] ?? false,
        // is_needer_blood: json['is_needer_blood']!= null? json['is_needer_blood']:false,
        created_by: json["created_by"] == null
            ? null
            : json["created_by"].runtimeType == int
                ? Users(id: json["created_by"])
                : Users.fromJsonListComercial(json["created_by"]),

        category: json["category"] == null
            ? null
            : json["category"].runtimeType == int
                ? Category(id: json["category"])
                : Category.fromJson(json["category"]),
        services: json["services"] == null
            ? null
            : json["services"].runtimeType == int
                ? ServicesModel(id: json["services"])
                : ServicesModel.fromJson(json["services"]),
        //  request_date,
        // request_time
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": Name,
        "isConform": isConform,
        "isCancel": isCancel,
        "isFinish": isFinish,
        "request_date": request_date,
        "request_time": request_time,
        "Date_Added": Date_Added,
        "Date_Update": Date_Update,
        "Phone_Number": Phone_Number,
      };
  Map<String, dynamic> toJsonIsCansel() => {
        // "isConform":isConform,

        "isCancel": isCancel,
        // "isFinish":isFinish,
        // "request_date":request_date,
        // "request_time":request_time,
        // "Date_Added":Date_Added,
        // "Date_Update":Date_Update,
        // "Phone_Number": Phone_Number,
      };
  Map<String, dynamic> toJsonIsConfirm() => {
        "isConform": isConform,

        // "isCancel":isCancel,
        // "isFinish":isFinish,
        // "request_date":request_date,
        // "request_time":request_time,
        // "Date_Added":Date_Added,
        // "Date_Update":Date_Update,
        // "Phone_Number": Phone_Number,
      };
  Map<String, dynamic> toJsonIsFinish() => {
        "isFinish": isFinish,

        // "isCancel":isCancel,
        // "isFinish":isFinish,
        // "request_date":request_date,
        // "request_time":request_time,
        // "Date_Added":Date_Added,
        // "Date_Update":Date_Update,
        // "Phone_Number": Phone_Number,
      };
}
