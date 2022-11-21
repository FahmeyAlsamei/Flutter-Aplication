/// ClientModel.dart
import 'dart:ffi';

import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/users/model/user_model.dart';


class ServicesModel {
  int? id;
  Users? createdBy;
  Category? category;
  String? Name;
  double? latitude;
  double? longitude;
  bool? isNeedService;
  bool? isHaveService;
  String? detialAR;
  String? locationName;
  String? imagesOne;
  String? imagesTow;
  String? imagesThree;
  String? dateAdded;
  String? request_date;
  String? request_time;
  String? dateUpdate;
  bool? isCancel;
  bool? isConform;
  bool? isFinish;
  String? phoneNumber;
  String? phoneNumberTow;

  ServicesModel(
      {this.id,
        this.createdBy,
        this.category,
        this.Name,
        this.latitude,
        this.longitude,
        this.isNeedService,
        this.isHaveService,
        this.detialAR,
        this.locationName,
        this.imagesOne,
        this.imagesTow,
        this.imagesThree,
        this.dateAdded,
        this.request_date,
        this.request_time,
        this.dateUpdate,
        this.isCancel,
        this.isConform,
        this.isFinish,
        this.phoneNumber,
        this.phoneNumberTow});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'] != null
        ? json['created_by'].runtimeType == int
        ? Users(id: json['created_by'])
        : Users.fromJson(json['created_by'])
        : null;
    category = json['category'] != null
        ? json['category'].runtimeType == int
        ? Category(id: json['category'])
        : Category.fromJson(json['category'])
        : null;
    Name = json['Name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isNeedService = json['is_need_service'];
    isHaveService = json['is_have_service'];
    detialAR = json['Detial_AR'];
    locationName = json['location_Name'];
    imagesOne = json['images_one'];
    imagesTow = json['images_tow'];
    imagesThree = json['images_three'];
    dateAdded = json['Date_Added'];
    request_date = json['request_date'];
    request_time = json['request_time'];
    dateUpdate = json['Date_Update'];
    isCancel = json['isCancel'];
    isConform = json['isConform'];
    isFinish = json['isFinish'];
    phoneNumber = json['Phone_Number'];
    phoneNumberTow = json['Phone_Number_tow'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    // data['id'] = id;
    if (createdBy != null && createdBy!.id != 0) {
      data['created_by'] = createdBy!.id.toString();
    }
    if (category != null) {
      data['category'] = category!.id!.toString();
    }
    data['Name'] = Name.toString();
    data['latitude'] = latitude.toString();
    data['longitude'] = longitude.toString();
    data['is_need_service'] = isNeedService.toString();
    data['is_have_service'] = isHaveService.toString();
    data['Detial_AR'] = detialAR.toString();
    data['location_Name'] = locationName.toString();
    // data['images_one'] = imagesOne;
    // data['images_tow'] = imagesTow;
    // data['images_three'] = imagesThree;
    // data['Date_Added'] = dateAdded;
    data['request_date'] = request_date.toString();
    data['request_time'] = request_time.toString();
    // data['Date_Update'] = dateUpdate.toString();
    data['isCancel'] = isCancel.toString();
    // data['isConform'] = isConform.toString();
    data['isFinish'] = isFinish.toString();
    data['Phone_Number'] = phoneNumber.toString();
    data['Phone_Number_tow'] = phoneNumberTow.toString();
    return data;
  }

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

// class CreatedBy {
//   int? id;
//   String? fullName;
//   String? location;
//   Null? email;
//   String? password;
//   String? phoneNo;
//   String? dateUpdate;
//   String? dateAdded;
//   Null? imagesUser;
//
//   CreatedBy(
//       {this.id,
//         this.fullName,
//         this.location,
//         this.email,
//         this.password,
//         this.phoneNo,
//         this.dateUpdate,
//         this.dateAdded,
//         this.imagesUser});
//
//   CreatedBy.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['Full_Name'];
//     location = json['location'];
//     email = json['Email'];
//     password = json['password'];
//     phoneNo = json['PhoneNo'];
//     dateUpdate = json['Date_Update'];
//     dateAdded = json['Date_Added'];
//     imagesUser = json['images_user'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['Full_Name'] = fullName;
//     data['location'] = location;
//     data['Email'] = email;
//     data['password'] = password;
//     data['PhoneNo'] = phoneNo;
//     data['Date_Update'] = dateUpdate;
//     data['Date_Added'] = dateAdded;
//     data['images_user'] = imagesUser;
//     return data;
//   }
// }
