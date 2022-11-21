// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/foundation.dart' show kDebugMode, ChangeNotifier;
import 'package:untitled3/config/data.dart';
import 'package:untitled3/config/path.dart';
import 'package:untitled3/services/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  List<Category> _todos = [];

  List<Category> get() {
    return [..._todos];
  }

  // Future<CategoryModel?> addIsConfirmCategory( Category Category) async{
  //
  //
  //   int id =Category.id!;
  //   var unencodedPath =
  //       '/api/Categoryave/${id}/';
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
  //       body: jsonEncode(Category.isConform())
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
  //   // // if(Category.images_main !=null&& Category.images_main!.isNotEmpty){
  //   // //   request.files.add(await http.MultipartFile.fromPath('images_main', Category.images_main??""));
  //   // // }
  //   // request.fields['Name']=Category.Name??"";
  //   // request.fields["Phone_Number1"]=Category.Phone_Number1??"";
  //   // request.fields["phone_Number2"]=Category.phone_Number2??"";
  //   // request.fields["city"]=Category.city??"";
  //   // request.fields["directorat"]=Category.directorate??"";
  //   // request.fields["Category_Type"]=Category.Category_Type??"";
  //   // request.fields["is_Male"]=Category.is_Male?.toString()??"";
  //   // request.fields["is_Famle"]=Category.is_Famle?.toString()??"";
  //   // request.fields["is_Data_for_all"]=Category.is_Data_for_all?.toString()??"";
  //   // request.fields["is_Data_Hospital"]=Category.is_Data_Hospital?.toString()??"";
  //   // request.fields["is_Volunteer_befor"]=Category.is_Volunteer_befor?.toString()??"";
  //   // request.fields["last_volunted_date"]=Category.last_volunted_date??"";
  //   // request.fields["is_Volunteer_first_time"]=Category.is_Volunteer_first_time?.toString()??"";
  //   // request.fields["is_Category_volunteer"]=Category.is_Category_volunteer?.toString()??"";
  //   // request.fields["is_needer_Category"]=Category.is_needer_Category?.toString()??"";
  //   // request.fields["Detial_AR"]=Category.Detial_AR??"";
  //   // request.fields["created_by"]=  Category.created_by?.id.toString()??"";
  //
  //
  //   print(url.scheme+"://"+url.host+url.path+"?"+url.query);
  //   print(Category.id);
  //   print(Category.Name);
  //
  //
  //   // var streamedResponse=await request.send();
  //
  //   // var response=await http.Response.fromStream(streamedResponse);
  //
  //   print(utf8.decode(response.bodyBytes));
  //
  //   Category ?Category1;
  //   if(response.statusCode==201){
  //     Category1=Category.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     return Category1;
  //   }
  //   return Category1;
  //
  // }

  Future<Category?> addIsEventCategory(
      Category category, Map<String, dynamic> map) async {
    int id = category.id!;
    var unencodedPath = '/api/Category/${id}/';

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
    // // if(Category.images_main !=null&& Category.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Category.images_main??""));
    // // }
    // request.fields['Name']=Category.Name??"";
    // request.fields["Phone_Number1"]=Category.Phone_Number1??"";
    // request.fields["phone_Number2"]=Category.phone_Number2??"";
    // request.fields["city"]=Category.city??"";
    // request.fields["directorat"]=Category.directorate??"";
    // request.fields["Category_Type"]=Category.Category_Type??"";
    // request.fields["is_Male"]=Category.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Category.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Category.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Category.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Category.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Category.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Category.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Category_volunteer"]=Category.is_Category_volunteer?.toString()??"";
    // request.fields["is_needer_Category"]=Category.is_needer_Category?.toString()??"";
    // request.fields["Detial_AR"]=Category.Detial_AR??"";
    // request.fields["created_by"]=  Category.created_by?.id.toString()??"";

    if (kDebugMode) {
      print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    }
    if (kDebugMode) {
      print(category.id);
    }
    if (kDebugMode) {
      print(category.Name);
    }

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    if (kDebugMode) {
      print(utf8.decode(response.bodyBytes));
    }

    // Category? Category1;
    if (response.statusCode == 201) {
      category =
          Category.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return category;
    }
    return category;
  }

  Future<Category?> addNewCategory(Category category) async {
    const urlencodedPath = '/api/CategorySave/';

    var url = Uri.http(
      PathAPI.PATH_MAIN_API_local,
      urlencodedPath,
    );

    var response = await http.post(url,
        // final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          //'Authorization': '9054f7aa9305e012b3c2300408c3dfdf390fcddf'
        },
        body: jsonEncode(category.toJson()));
    //
    // var request =http.post(
    //
    //   'POST',
    //   url
    // );

    // request.headers.addAll((PathAPI.Header));
    //
    // // if(Category.images_main !=null&& Category.images_main!.isNotEmpty){
    // //   request.files.add(await http.MultipartFile.fromPath('images_main', Category.images_main??""));
    // // }
    // request.fields['Name']=Category.Name??"";
    // request.fields["Phone_Number1"]=Category.Phone_Number1??"";
    // request.fields["phone_Number2"]=Category.phone_Number2??"";
    // request.fields["city"]=Category.city??"";
    // request.fields["directorat"]=Category.directorate??"";
    // request.fields["Category_Type"]=Category.Category_Type??"";
    // request.fields["is_Male"]=Category.is_Male?.toString()??"";
    // request.fields["is_Famle"]=Category.is_Famle?.toString()??"";
    // request.fields["is_Data_for_all"]=Category.is_Data_for_all?.toString()??"";
    // request.fields["is_Data_Hospital"]=Category.is_Data_Hospital?.toString()??"";
    // request.fields["is_Volunteer_befor"]=Category.is_Volunteer_befor?.toString()??"";
    // request.fields["last_volunted_date"]=Category.last_volunted_date??"";
    // request.fields["is_Volunteer_first_time"]=Category.is_Volunteer_first_time?.toString()??"";
    // request.fields["is_Category_volunteer"]=Category.is_Category_volunteer?.toString()??"";
    // request.fields["is_needer_Category"]=Category.is_needer_Category?.toString()??"";
    // request.fields["Detial_AR"]=Category.Detial_AR??"";
    // request.fields["created_by"]=  Category.created_by?.id.toString()??"";

    if (kDebugMode) {
      print(url.scheme + "://" + url.host + url.path + "?" + url.query);
    }
    if (kDebugMode) {
      print(category.id);
    }
    if (kDebugMode) {
      print(category.Name);
    }

    // var streamedResponse=await request.send();

    // var response=await http.Response.fromStream(streamedResponse);

    print(utf8.decode(response.bodyBytes));

    Category? category1;
    if (response.statusCode == 201) {
      category1 =
          Category.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return category1;
    }
    return category1;
  }

  Future<List<Category>> fetchAllCategoryInHospital(
      ) async {
    // if(!is_volunteer){
    //
    //   AppData.ListCategory.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListCategory.removeWhere((element) => element.isConform!);
    // }

    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Category";
    Map<String, String>? queryParameters = {
      "format": "json",
      // "servicesModel__created_by":AppData.UserAccountData!.id.toString(),
      "category__servise__created_by": AppData.UserAccountData!.id.toString(),
    };
    if (kDebugMode) {
      print("https://" +
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
        Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath, queryParameters);
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

        for (var ap in data) {
          if (kDebugMode) {
            print(ap);
          }
          AppData.ListCategory.add(Category.fromJson(ap));

          var set = <int>{};
          AppData.ListCategory =
              AppData.ListCategory.where((element) => set.add(element.id!))
                  .toList();
        }
        var set = <int>{};
        AppData.ListCategory =
            AppData.ListCategory.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListCategory;
      } else {
        return AppData.ListCategory;
      }
    }
    return AppData.ListCategory;
  }

  Future<List<Category>> fetchAllCategory() async {
    // if(!is_volunteer){
    //
    //   AppData.ListCategory.removeWhere((element) => element.isCancel!);
    // }
    // if(!is_needer){
    //   AppData.ListCategory.removeWhere((element) => element.isConform!);
    // }
    print(AppData.UserAccountData!.id);
    var unencodedPath = "/api/Category";
    Map<String, String>? queryParameters = {
      "format": "json",
    };
    var url =
        Uri.https(PathAPI.PATH_MAIN_API_local, unencodedPath, queryParameters);
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

        for (var ap in data) {
          if (kDebugMode) {
            print(ap);
          }
          AppData.ListCategory.add(Category.fromJson(ap));

          var set = <int>{};
          AppData.ListCategory =
              AppData.ListCategory.where((element) => set.add(element.id!))
                  .toList();
        }
        var set = <int>{};
        AppData.ListCategory =
            AppData.ListCategory.where((element) => set.add(element.id!))
                .toList();
        return AppData.ListCategory;
      } else {
        return AppData.ListCategory;
      }
    }
    return AppData.ListCategory;
  }

  Future<Category> fetchOneCategory(int id) async {
    var unencodedPath = "/api/Category/${id}/?format=json";
    var url = Uri.http(PathAPI.PATH_MAIN_API_local, unencodedPath);

    final response = await http.get(url, headers: PathAPI.Header);

    Category category = Category(id: id);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);

      category =
          Category.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      _todos = data.map<Category>((json) => Category.fromJson(json)).toList();

      return category;
    }
    return category;
  }
}
