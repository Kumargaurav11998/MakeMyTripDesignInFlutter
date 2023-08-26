import 'package:flights_app/shared/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSaver {
  static String nameKey = "nameKey";
  static String emailKey = "emailKey";
  static String imgKey = "imgKey";
  static String phoneKey = "phoneKey";
  static String resendPhoneKey = "resendPhoneKey";
  static String logKey = "logKey";

  static Future<bool> saveName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, userName);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKey);
  }

  static Future<bool> saveEmail(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, userEmail);
  }

  static Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
  }

  static Future<bool> saveImg(String userImg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(imgKey, userImg);
  }

  static Future<String?> getImg() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(imgKey);
  }

  static Future<bool> savePhone(String userPhone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(phoneKey, userPhone);
  }

  static Future<String?> getPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(phoneKey);
  }

 static Future<bool> saveResendPhone(String userResendPhone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(resendPhoneKey, userResendPhone);
  }

  static Future<String?> getResendPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(resendPhoneKey);
  }

  static Future<bool> saveLoginData(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn);
  }

  static Future<bool?> getLogData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(logKey);
  }


  static removePreferences() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('nameKey');
    await preferences.remove('emailKey');
    await preferences.remove('imgKey');
    await preferences.remove('phoneKey');
    await preferences.remove('logKey');


    print("name ${Constant.name}");
    print("email ${Constant.email}");

  }
}
