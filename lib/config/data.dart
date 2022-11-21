import 'package:flutter/material.dart';
import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/services/models/services_model.dart';
import 'package:untitled3/services/models/services_models.dart';
import 'package:untitled3/users/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static Users? UserAccountData;
  static List<ServicesModel> ListServices = [];
  static List<RequestModel> ListRequest = [];
  static List<Category> ListCategory = [];
}

late Users _users;

Future<SharedPreferences> prefsMain = SharedPreferences.getInstance();
SharedPreferences? prefs;
bool FristInstallApp = false;

String CodeCountry = '+967';

void sharedPrefInit(
  bool HaveAccount,
  String Email,
  String Full_Name,
  String password,
  String PhoneNo,
  int id,
) async {
  prefs = await prefsMain;

  if (prefs != null && id != 0) {
    //FristInstallApp = prefs?.getBool("FristInstallApp");

    try {
      prefs?.setBool("HaveAccount", true);
      prefs?.setBool(UserTextTable.IS_VERIFYText, true);
      prefs?.setString(UserTextTable.EMAILEText, Email);

      prefs?.setString(UserTextTable.FULL_NAMEText, Full_Name);
      prefs?.setString(UserTextTable.PASSWORDText, password);
      prefs?.setString(UserTextTable.PHONE_NOText, PhoneNo);

      prefs?.setInt(UserTextTable.idText, id);

      prefs?.getBool("HaveAccount");
      prefs?.getBool("FristInstallApp");
      /* if(prefs?.getBool("HaveAccount")==null)
      prefs?.setBool("HaveAccount", false);*/
      ////"HaveAccount HaveAccount HaveAccount2${prefs?.getBool("HaveAccount")}");

      ////"HaveAccount HaveAccount HaveAccount3${prefs?.getBool("HaveAccount")}");
    } catch (e, s) {
      /// setMockInitialValues initiates shared preference
      /// Adds app-name
      prefs?.setBool("FristInstallApp", true);

      ////"HaveAccount HaveAccount HaveAccount${prefs?.getBool("HaveAccount")}");

      ////"HaveAccount HaveAccount HaveAccount${prefs?.getBool("HaveAccount")}");

      ////"HaveAccount HaveAccount HaveAccount${prefs?.getBool("HaveAccount")}");

    }
  }
}

class AccountConfig {
  static bool? HaveAccount;
  static bool? isVeryEmile;

  double longitudeMyLocation = 44.1926;

  // static getLocationUser(){
  //
  //
  //
  //   location.onLocationChanged.listen((lcation.LocationData currentLocation) {
  //     latLast=latitudeMyLocation;
  //     longLast=longitudeMyLocation;
  //     latitudeMyLocation = currentLocation.latitude;
  //     longitudeMyLocation = currentLocation.longitude;
  //     if(latLast!=latitudeMyLocation || longLast!=longitudeMyLocation)
  //
  //       setState(() {
  //         latitudeMyLocation = currentLocation.latitude;
  //         longitudeMyLocation = currentLocation.longitude;
  //
  //       });
  //
  //   },cancelOnError: true,onError:(err){
  //   });
  //
  // };

  static Logout() async {
    //AppData.UserAccountData = [];
    // AppData.DataLogInPrent=[];
    //
    // AppData.dataSchool=[];
    // AppData.dataProplem=[];
    // AppData.dataLocationDriver=[];
    // AppData.dataDriverBusesinSchool=[];
    prefs = await prefsMain;
    try {
      prefs?.clear();
      // sharedPrefInit(
      //   false,
      //   "",
      //   "",
      //   "",
      //
      //   "",
      //   0,
      // );

      isVeryEmile = false;
      //AppData.UserAccountData = [];
      isVeryEmile = false;
    } catch (e) {
      prefs?.clear();
      // sharedPrefInit(
      //   false,
      //   "",
      //   "",
      //   "",
      //
      //   "",
      //   0,
      // );

      // DriverAccountData = [];

      isVeryEmile = false;
      //AppData.UserAccountData = [];
      isVeryEmile = false;
    }

    try {
      // sharedPrefInit(
      //   false,
      //   "",
      //   "",
      //   "",
      //
      //   "",
      //   0,
      // );
      prefs?.clear();
      isVeryEmile = false;
      //AppData.UserAccountData = [];
      isVeryEmile = false;
    } catch (e) {
      //AppData.UserAccountData = [];
      // sharedPrefInit(
      //   false,
      //   "",
      //   "",
      //   "",
      //
      //   "",
      //   0,
      // );

      isVeryEmile = false;
      //AppData.UserAccountData = [];
      isVeryEmile = false;
    }
  }

  static checkHaveAndVeryAccount() async {
    // try {
    //   AppData.UserAccountData = await DB.fetchUserAccount();
    // } catch (exption) {
    //   //AppData.UserAccountData = [];
    // }
    //
    // try {
    //   AppData.UserAccountData = await DB.fetchUserAccount();
    // } catch (exption) {
    //   //AppData.UserAccountData = [];
    // }

    if (AppData.UserAccountData != null) {
      //   if ( AppData.UserAccountData!.isVerify) {
      //
      //     AccountConfig.isVeryEmile = true;
      //
      //   }else{
      //
      //     AccountConfig.isVeryEmile = false;
      //
      //   }

      AccountConfig.HaveAccount = true;
      AccountConfig.HaveAccount = true;
    } else if (AppData.UserAccountData != null) {
      AccountConfig.HaveAccount = true;
      AccountConfig.HaveAccount = true;
    } else {
      AccountConfig.isVeryEmile = false;
      AccountConfig.HaveAccount = false;
      AccountConfig.HaveAccount = false;

      getFromRefrence();
    }
  }

  static Future<Users> getFromRefrence() async {
    WidgetsFlutterBinding.ensureInitialized();

    prefs = await prefsMain;

    try {
      print(prefs!.getString(UserTextTable.EMAILEText));
      print(prefs!.getString(UserTextTable.PASSWORDText));
      print(prefs!.getString(UserTextTable.PHONE_NOText));
      print(prefs?.getString(UserTextTable.EMAILEText));
      print(prefs?.getString(UserTextTable.PASSWORDText));
      print(prefs?.getString(UserTextTable.PHONE_NOText));
      AppData.UserAccountData = Users(
          // prefs?.getBool("HaveAccount")??false,
          Email: prefs!.getString(UserTextTable.EMAILEText) ?? "",
          Full_Name: prefs!.getString(UserTextTable.FULL_NAMEText) ?? "",
          password: prefs!.getString(UserTextTable.PASSWORDText) ?? "",
          PhoneNo: prefs!.getString(UserTextTable.PHONE_NOText) ?? "",
          id: prefs!.getInt(UserTextTable.idText) ?? 0);
      // AppData.UserAccountData = await DB.fetchUserAccount();
    } catch (e, s) {
      print(e.toString());
      print(s.toString());

      // AppData.UserAccountData = _users;
    }
    // checkHaveAndVeryAccount();
    // if (AppData.UserAccountData == null ) {
    // if ( AppData.UserAccountData!.isVerify) {
    //
    //   AccountConfig.isVeryEmile = true;
    //
    // }else{
    //
    //   AccountConfig.isVeryEmile = false;
    //
    // }

    // AccountConfig.HaveAccount = true;
    // AccountConfig.HaveAccount = true;

    return AppData.UserAccountData!;

    // prefs?.setString(UserTextTable.FULL_NAMEText,
    //     AppData.UserAccountData!.full_name);
    // prefs?.setString(
    //     UserTextTable.PASSWORDText, AppData.UserAccountData!.password??"");
    // prefs?.setString(
    //     UserTextTable.PHONE_NOText, AppData.UserAccountData!.PhoneNo??"");
    // prefs?.setString(
    //     UserTextTable.KEY_VERIFYText, 'AppData.UserAccountData!.keyVerify');
    // prefs?.setString(UserTextTable.KEY_VERIFYText,
    //     AppData.UserAccountData!.keyVerify);
    // prefs?.setString(
    //     UserTextTable.USERNAMEText, AppData.UserAccountData!.username);
    // prefs?.setInt(UserTextTable.idText, AppData.UserAccountData!.id??0);
    //
    // sharedPrefInit(
    //     prefs?.getBool("HaveAccount")??false,
    //     prefs?.getString(UserTextTable.EMAILEText)??"",
    //     prefs?.getString(UserTextTable.FULL_NAMEText)??"",
    //     prefs?.getString(UserTextTable.PASSWORDText)??"",
    //     prefs?.getString(UserTextTable.PHONE_NOText)??"",
    //     prefs?.getInt(UserTextTable.idText)??0);
    // } else {
    //   AccountConfig.HaveAccount = true;
    //   AccountConfig.HaveAccount = true;
    //   await prefs?.setBool("HaveAccount", false);
    //
    //   if (prefs != null) prefs?.setBool("HaveAccount", false);
    //   sharedPrefInit(false, "", "", "", "",  0);
    // }
  }

  static addToRefrence(Users user) async {
    final Future<SharedPreferences> prefses = SharedPreferences.getInstance();

    // AppData.UserAccountData .add(await db.fetchUserAccount());
    prefs = await prefses;

    try {
      // AppData.UserAccountData = await DB.fetchUserAccount();
    } catch (exption) {
      //AppData.UserAccountData = [];
    }
    checkHaveAndVeryAccount();
    if (AppData.UserAccountData != null) {
      // if ( AppData.UserAccountData!.isVerify) {
      //
      //   AccountConfig.isVeryEmile = true;
      //
      // }else{
      //
      //   AccountConfig.isVeryEmile = false;
      //
      // }

      AccountConfig.HaveAccount = true;
      AccountConfig.HaveAccount = true;
      sharedPrefInit(true, user.Email ?? "", user.Full_Name ?? "",
          user.password ?? "", user.PhoneNo ?? "", user.id ?? 0);
      // prefs?.setBool("HaveAccount", true);
      // prefs?.setBool(UserTextTable.IS_VERIFYText, true);
      // prefs?.setString(
      //     UserTextTable.EMAILEText,user.Email!=null&&
      //    user.Email!=null&& user.Email!.isNotEmpty
      //     ?AppData.UserAccountData!.Email??"":'');

      // prefs?.setString(UserTextTable.FULL_NAMEText,
      //    user.full_name);
      // prefs?.setString(
      //     UserTextTable.PASSWORDText,user.password??"");
      // prefs?.setString(
      //     UserTextTable.PHONE_NOText,user.PhoneNo??"");
      // prefs?.setString(
      //     UserTextTable.KEY_VERIFYText, 'AppData.UserAccountData!.keyVerify');
      // prefs?.setString(UserTextTable.KEY_VERIFYText,
      //    user.keyVerify);
      // prefs?.setString(
      //     UserTextTable.USERNAMEText,user.username);
      // prefs?.setInt(UserTextTable.idText,user.id??0);

      // sharedPrefInit(
      //     prefs?.getBool("HaveAccount")??false,
      //     prefs?.getString(UserTextTable.EMAILEText)??"",
      //     prefs?.getString(UserTextTable.FULL_NAMEText)??"",
      //     prefs?.getString(UserTextTable.PASSWORDText)??"",
      //     prefs?.getString(UserTextTable.PHONE_NOText)??"",
      //     prefs?.getInt(UserTextTable.idText)??0);
    } else {
      AccountConfig.HaveAccount = true;
      AccountConfig.HaveAccount = true;
      await prefs?.setBool("HaveAccount", false);

      if (prefs != null) prefs?.setBool("HaveAccount", false);
      // sharedPrefInit(false, "", "", "", "",  0);
    }
  }
}

class UserTextTable {
  static final String tableName = "User";

  // static final String TABLE_USER_NAME="User";
  static final String idText = "id";
  static final String FULL_NAMEText = "Full_Name";
  // static final String FRIST_NAMEText="Frist_Name";
  // static final String ID_USERText = "idUserLocal";
  static final String ID_USER_APIText = "id_api";
  static final String FIRST_NAMEText = "Frist_Name";
  static final String LAST_NAMEText = "last_Name";
  static final String USERNAMEText = "UserName";
  static final String PASSWORDText = "password";

  static final String ISBlockText = "isBlock";
  static final String ISAdminText = "isAdmin";
  static final String EMAILEText = "Email";
  static final String KEY_VERIFYText = "keyVerify";
  static final String IS_VERIFYText = "isVerify";
  static final String SEESIONText = "session_no";
  static final String PHONE_NOText = "PhoneNo";
  static final String IMEI_deviceText = "IMEI_device";
  static final String KEY_ACTIVE_STATUSText = "KeyActiveStatus";
  // static final String sort_no="sort_no";

  static final String dateUpdateText = "Date_Update";
  static final String dateAddedText = "Date_Added";
  //
  // static final String DATE_UPDATEText="Date_Update";
  // static final String DATE_ADDEDText="Date_Added";
  static final String IMAGES_USERText = "images_user";
}
