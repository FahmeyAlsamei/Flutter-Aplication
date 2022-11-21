// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/config/path.dart';
import 'package:untitled3/services/models/services_models.dart';
import 'package:http/http.dart' as http;

class ServicesProvider with ChangeNotifier {
  List<ServicesModel> _todos = [];

  List<ServicesModel> get() {
    return [..._todos];
  }

  // Future<ServicesModel?> addIsConfirmServices( ServicesModel Services) async{
  //
  //
  //   int id =Services.id!;
  //   var unencodedPath =
  //       '/api/Servicesave/${id}/';
  //
  //   var url =Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath,);
  //
  //   var response = await http.patch(url,
  //       // final response = await http.post(url,
  //       headers:
  //       {
  //         "Content-Type": "application/json",
  //         //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
  //
  //       }
  //       ,
  //       body: jsonEncode(Services.isConform())
  //   );
  //   //
  //   // var request =http.post(
  //   //
  //   //   'POST',
  //   //   url
  //   // );
  //
  //   // request.headers.addAll((PathAPI.Header));
  //   //
  //   // // if(Services.images_main !=null&& Services.images_main!.isNotEmpty){
  //   // //   request.files.add(await http.MultipartFile.fromPath('images_main', Services.images_main??""));
  //   // // }
  //   // request.fields['Name']=Services.Name??"";
  //   // request.fields["Phone_Number1"]=Services.Phone_Number1??"";
  //   // request.fields["phone_Number2"]=Services.phone_Number2??"";
  //   // request.fields["city"]=Services.city??"";
  //   // request.fields["directorat"]=Services.directorate??"";
  //   // request.fields["Services_Type"]=Services.Services_Type??"";
  //   // request.fields["is_Male"]=Services.is_Male?.toString()??"";
  //   // request.fields["is_Famle"]=Services.is_Famle?.toString()??"";
  //   // request.fields["is_Data_for_all"]=Services.is_Data_for_all?.toString()??"";
  //   // request.fields["is_Data_Hospital"]=Services.is_Data_Hospital?.toString()??"";
  //   // request.fields["is_Volunteer_befor"]=Services.is_Volunteer_befor?.toString()??"";
  //   // request.fields["last_volunted_date"]=Services.last_volunted_date??"";
  //   // request.fields["is_Volunteer_first_time"]=Services.is_Volunteer_first_time?.toString()??"";
  //   // request.fields["is_Services_volunteer"]=Services.is_Services_volunteer?.toString()??"";
  //   // request.fields["is_needer_Services"]=Services.is_needer_Services?.toString()??"";
  //   // request.fields["Detial_AR"]=Services.Detial_AR??"";
  //   // request.fields["created_by"]=  Services.created_by?.id.toString()??"";
  //
  //
  //   print(url.scheme+"://"+url.host+url.path+"?"+url.query);
  //   print(Services.id);
  //   print(Services.Name);
  //
  //
  //   // var streamedResponse=await request.send();
  //
  //   // var response=await http.Response.fromStream(streamedResponse);
  //
  //   print(utf8.decode(response.bodyBytes));
  //
  //   ServicesModel ?Services1;
  //   if(response.statusCode==201){
  //     Services1=ServicesModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     return Services1;
  //   }
  //   return Services1;
  //
  // }

  Future<ServicesModel?> addIsEventServices(
      ServicesModel Services, Map<String, dynamic> map) async {
    int id = Services.id!;
    var unencodedPath = '/api/Servicesave/${id}/';

    var url = Uri.http(
      PathAPI.PATH_MAIN_API_local,
      unencodedPath,
    );

    var response = await http.patch(url,
        // final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
        },
        body: jsonEncode(map));
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Services.images_main !=null&& Services.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Services.images_main??""));
    // // }
    // request.fields['Name']=Services.Name??"";
    // request.fields["Phone_Number1"]=Services.Phone_Number1??"";
    // request.fields["phone_Number2"]=Services.phone_Number2??"";
    // request.fields["city"]=Services.city??"";
    // request.fields["directorat"]=Services.directorate??"";
    // request.fields["Services_Type"]=Services.Services_Type??"";
    // request.fields["is_Male"]=Services.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Services.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Services.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Services.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Services.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Services.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Services.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Services_volunteer"]=Services.is_Services_volunteer?.toString()??"";
    // request.fields["is_needer_Services"]=Services.is_needer_Services?.toString()??"";
    // request.fields["Detial_AR"]=Services.Detial_AR??"";
    // request.fields["created_by"]=  Services.created_by?.id.toString()??"";

    print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    print(Services.id);
    print(Services.Name);

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    ServicesModel? Services1;
    if (response.statusCode == 201) {
      Services1 =
          ServicesModel.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return Services1;
    }
    return Services1;
  }

  Future<ServicesModel?> addNewServices(ServicesModel Services) async {
    const unencodedPath = '/api/Servicesave/';

    var url = Uri.http(
      PathAPI.PATH_MAIN_API_local,
      unencodedPath,
    );

    var response = await http.post(url,
        // final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
        },
        body: jsonEncode(Services.toMap()));
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Services.images_main !=null&& Services.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Services.images_main??""));
    // // }
    // request.fields['Name']=Services.Name??"";
    // request.fields["Phone_Number1"]=Services.Phone_Number1??"";
    // request.fields["phone_Number2"]=Services.phone_Number2??"";
    // request.fields["city"]=Services.city??"";
    // request.fields["directorat"]=Services.directorate??"";
    // request.fields["Services_Type"]=Services.Services_Type??"";
    // request.fields["is_Male"]=Services.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Services.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Services.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Services.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Services.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Services.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Services.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Services_volunteer"]=Services.is_Services_volunteer?.toString()??"";
    // request.fields["is_needer_Services"]=Services.is_needer_Services?.toString()??"";
    // request.fields["Detial_AR"]=Services.Detial_AR??"";
    // request.fields["created_by"]=  Services.created_by?.id.toString()??"";

    print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    print(Services.id);
    print(Services.Name);

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    ServicesModel? Services1;
    if (response.statusCode == 201) {
      Services1 =
          ServicesModel.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return Services1;
    }
    return Services1;
  }

  Future<List<ServicesModel>> fetchAllServicesInHospital() async {
    // if(!is_volunteer){
    //
    //   AppData.ListServices.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListServices.removeWhere((element) => element.isConform!);
    // }

    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/request";
    Map<String, String>? queryParameters = {
      "format": "json",
      // "hospital__created_by":AppData.UserAccountData!.id.toString(),
      "category__servise__created_by": AppData.UserAccountData!.id.toString(),
    };
    if (kDebugMode) {
      print("http://" +
          PathAPI.PATH_MAIN_API_local.replaceAll("10.0.2.2", "127.0.0.1") +
          unencodedPath +
          "?" +
          queryParameters.entries
              .toString()
              .replaceAll(':', '=')
              .replaceAll("MapEntry(", '')
              .replaceAll(")", '')
              .replaceAll("(", '')
              .replaceAll(" ", '')
              .replaceAll(",", '&'));
    }

    var url =
        Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath, queryParameters);
    if (kDebugMode) {
      print(url.scheme +
          "://" +
          url.host +
          ":" +
          url.port.toString() +
          url.path +
          "?" +
          url.query);
    }

    final response = await http.get(url, headers: PathAPI.Header);
    if (kDebugMode) {
      print(response.body);
    }
    if (response != null) {
      if (response.statusCode == 200) {
        var datamap = json.decode(utf8.decode(response.bodyBytes));
        print(datamap);

        List data = datamap["results"] as List;

        print(data);

        data.forEach((_ap) async {
          print(_ap);
          AppData.ListServices.add(ServicesModel.fromMap(_ap));

          var set = <int>{};
          AppData.ListServices =
              AppData.ListServices.where((element) => set.add(element.id!))
                  .toList();
        });
        var set = <int>{};
        AppData.ListServices =
            AppData.ListServices.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListServices;
      } else {
        return AppData.ListServices;
      }
    }
    return AppData.ListServices;
  }

  Future<List<ServicesModel>> fetchAllServices() async {
    // if(!is_volunteer){
    //
    //   AppData.ListServices.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListServices.removeWhere((element) => element.isConform!);
    // }
    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/request";
    Map<String, String>? queryParameters = {
      "format": "json",
      "created_by": AppData.UserAccountData!.id.toString(),
    };
    var url =
        Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath, queryParameters);
    print(url.scheme +
        "://" +
        url.host +
        ":" +
        url.port.toString() +
        url.path +
        "?" +
        url.query);

    final response = await http.get(url, headers: PathAPI.Header);

    if (response != null) {
      if (response.statusCode == 200) {
        var datamap = json.decode(utf8.decode(response.bodyBytes));
        print(datamap);

        List data = datamap["results"] as List;

        print(data);

        data.forEach((_ap) async {
          print(_ap);
          AppData.ListServices.add(ServicesModel.fromMap(_ap));

          var set = <int>{};
          AppData.ListServices =
              AppData.ListServices.where((element) => set.add(element.id!))
                  .toList();
        });
        var set = <int>{};
        AppData.ListServices =
            AppData.ListServices.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListServices;
      } else {
        return AppData.ListServices;
      }
    }
    return AppData.ListServices;
  }

  Future<ServicesModel> fetchOneServices(int id) async {
    var unencodedPath = "/api/Services/${id}/?format=json";
    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response = await http.get(url, headers: PathAPI.Header);

    ServicesModel Services = ServicesModel(id: id);

    if (response != null) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);

        Services =
            ServicesModel.fromMap(json.decode(utf8.decode(response.bodyBytes)));
        _todos = data
            .map<ServicesModel>((json) => ServicesModel.fromMap(json))
            .toList();

        return Services;
      }
    }
    return Services;
  }

}
