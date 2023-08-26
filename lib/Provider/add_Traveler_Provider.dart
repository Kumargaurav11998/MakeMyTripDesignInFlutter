import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Add_Travelar_Provider with ChangeNotifier {
  bool Gender_MAle=true;

  void male_Click (){
    Gender_MAle=true;
    notifyListeners();
  }
  void female_Click (){
    Gender_MAle=false;
    notifyListeners();
  }
}