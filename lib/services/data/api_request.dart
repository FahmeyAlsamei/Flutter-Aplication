// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/config/path.dart';
import 'package:untitled3/services/models/services_model.dart';
import 'package:http/http.dart' as http;

class RequestProvider with ChangeNotifier {
  List<RequestModel> _todos = [];

  List<RequestModel> get() {
    return [..._todos];
  }

  // Future<RequestModel?> addIsConfirmRequest( RequestModel Request) async{
  //
  //
  //   int id =Request.id!;
  //   var unencodedPath =
  //       '/api/RequestSave/${id}/';
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
  //       body: jsonEncode(Request.isConform())
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
  //   // // if(Request.images_main !=null&& Request.images_main!.isNotEmpty){
  //   // //   request.files.add(await http.MultipartFile.fromPath('images_main', Request.images_main??""));
  //   // // }
  //   // request.fields['Name']=Request.Name??"";
  //   // request.fields["Phone_Number1"]=Request.Phone_Number1??"";
  //   // request.fields["phone_Number2"]=Request.phone_Number2??"";
  //   // request.fields["city"]=Request.city??"";
  //   // request.fields["directorat"]=Request.directorate??"";
  //   // request.fields["Request_Type"]=Request.Request_Type??"";
  //   // request.fields["is_Male"]=Request.is_Male?.toString()??"";
  //   // request.fields["is_Famle"]=Request.is_Famle?.toString()??"";
  //   // request.fields["is_Data_for_all"]=Request.is_Data_for_all?.toString()??"";
  //   // request.fields["is_Data_Hospital"]=Request.is_Data_Hospital?.toString()??"";
  //   // request.fields["is_Volunteer_befor"]=Request.is_Volunteer_befor?.toString()??"";
  //   // request.fields["last_volunted_date"]=Request.last_volunted_date??"";
  //   // request.fields["is_Volunteer_first_time"]=Request.is_Volunteer_first_time?.toString()??"";
  //   // request.fields["is_Request_volunteer"]=Request.is_Request_volunteer?.toString()??"";
  //   // request.fields["is_needer_Request"]=Request.is_needer_Request?.toString()??"";
  //   // request.fields["Detial_AR"]=Request.Detial_AR??"";
  //   // request.fields["created_by"]=  Request.created_by?.id.toString()??"";
  //
  //
  //   print(url.scheme+"://"+url.host+url.path+"?"+url.query);
  //   print(Request.id);
  //   print(Request.Name);
  //
  //
  //   // var streamedResponse=await request.send();
  //
  //   // var response=await http.Response.fromStream(streamedResponse);
  //
  //   print(utf8.decode(response.bodyBytes));
  //
  //   RequestModel ?Request1;
  //   if(response.statusCode==201){
  //     Request1=RequestModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     return Request1;
  //   }
  //   return Request1;
  //
  // }

  Future<RequestModel?> addIsEventRequest(
      RequestModel Request, Map<String, dynamic> map) async {
    int id = Request.id!;
    var unencodedPath = '/api/RequestSave/${id}/';

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
    // // if(Request.images_main !=null&& Request.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Request.images_main??""));
    // // }
    // request.fields['Name']=Request.Name??"";
    // request.fields["Phone_Number1"]=Request.Phone_Number1??"";
    // request.fields["phone_Number2"]=Request.phone_Number2??"";
    // request.fields["city"]=Request.city??"";
    // request.fields["directorat"]=Request.directorate??"";
    // request.fields["Request_Type"]=Request.Request_Type??"";
    // request.fields["is_Male"]=Request.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Request.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Request.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Request.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Request.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Request.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Request.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Request_volunteer"]=Request.is_Request_volunteer?.toString()??"";
    // request.fields["is_needer_Request"]=Request.is_needer_Request?.toString()??"";
    // request.fields["Detial_AR"]=Request.Detial_AR??"";
    // request.fields["created_by"]=  Request.created_by?.id.toString()??"";

    print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    print(Request.id);
    print(Request.Name);

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    RequestModel? Request1;
    if (response.statusCode == 201) {
      Request1 =
          RequestModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return Request1;
    }
    return Request1;
  }

  Future<RequestModel?> addNewRequest(RequestModel Request) async {
    const unencodedPath = '/api/RequestSave/';

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
        body: jsonEncode(Request.toJson()));
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Request.images_main !=null&& Request.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Request.images_main??""));
    // // }
    // request.fields['Name']=Request.Name??"";
    // request.fields["Phone_Number1"]=Request.Phone_Number1??"";
    // request.fields["phone_Number2"]=Request.phone_Number2??"";
    // request.fields["city"]=Request.city??"";
    // request.fields["directorat"]=Request.directorate??"";
    // request.fields["Request_Type"]=Request.Request_Type??"";
    // request.fields["is_Male"]=Request.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Request.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Request.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Request.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Request.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Request.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Request.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Request_volunteer"]=Request.is_Request_volunteer?.toString()??"";
    // request.fields["is_needer_Request"]=Request.is_needer_Request?.toString()??"";
    // request.fields["Detial_AR"]=Request.Detial_AR??"";
    // request.fields["created_by"]=  Request.created_by?.id.toString()??"";

    print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    print(Request.id);
    print(Request.Name);

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    RequestModel? Request1;
    if (response.statusCode == 201) {
      Request1 =
          RequestModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return Request1;
    }
    return Request1;
  }

  Future<List<RequestModel>> fetchAllRequestInHospital() async {
    // if(!is_volunteer){
    //
    //   AppData.ListRequest.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListRequest.removeWhere((element) => element.isConform!);
    // }

    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Request";
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
          AppData.ListRequest.add(RequestModel.fromJson(_ap));

          var set = <int>{};
          AppData.ListRequest =
              AppData.ListRequest.where((element) => set.add(element.id!))
                  .toList();
        });
        var set = <int>{};
        AppData.ListRequest =
            AppData.ListRequest.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListRequest;
      } else {
        return AppData.ListRequest;
      }
    }
    return AppData.ListRequest;
  }

  Future<List<RequestModel>> fetchAllRequest() async {
    // if(!is_volunteer){
    //
    //   AppData.ListRequest.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListRequest.removeWhere((element) => element.isConform!);
    // }
    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Request";
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
          AppData.ListRequest.add(RequestModel.fromJson(_ap));

          var set = <int>{};
          AppData.ListRequest =
              AppData.ListRequest.where((element) => set.add(element.id!))
                  .toList();
        });
        var set = <int>{};
        AppData.ListRequest =
            AppData.ListRequest.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListRequest;
      } else {
        return AppData.ListRequest;
      }
    }
    return AppData.ListRequest;
  }

  Future<RequestModel> fetchOneRequest(int id) async {
    var unencodedPath = "/api/Request/${id}/?format=json";
    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response = await http.get(url, headers: PathAPI.Header);

    RequestModel Request = RequestModel(id: id);

    if (response != null) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);

        Request =
            RequestModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        _todos = data
            .map<RequestModel>((json) => RequestModel.fromJson(json))
            .toList();

        return Request;
      }
    }
    return Request;
  }
}
