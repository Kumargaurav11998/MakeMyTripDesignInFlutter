import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class SearchProvider with ChangeNotifier {
  int Adult = 1;
  int Child = 0;
  int Infant = 0;
  bool SEconomyPrimimum = true;
  bool primium = false;
  bool Bussion = false;
  bool FirstClass = false;
String fromCity="Nairobi";
String fromCityCode="NBO";
String toCity="Mombasa";
String toCityCode="HKMO";
bool updateUI=false;
  void addAddult() {
    Adult = Adult + 1;

    notifyListeners();
  }

  void removeAddult() {
    if (Adult >= 1) {
      Adult = Adult - 1;
    }

    notifyListeners();
  }

  void addChild() {
    Child = Child + 1;
    notifyListeners();
  }

  void removeChild() {
    if (Child >= 1) Child = Child - 1;
    notifyListeners();
  }

  void addInfant() {
    if (Infant >= 0) {
      Infant = Infant + 1;
    }

    notifyListeners();
  }

  void removeInfant() {
    if (Infant >= 1) {
      Infant = Infant - 1;
    }

    notifyListeners();
  }

  void firstClick() {
    SEconomyPrimimum = false;
    primium = false;
    Bussion = false;
    FirstClass = true;
    notifyListeners();
  }

  void economyPremClass() {
    SEconomyPrimimum = true;
    primium = false;
    Bussion = false;
    FirstClass = false;
    notifyListeners();
  }

  void premiumClass() {
    SEconomyPrimimum = false;
    primium = true;
    Bussion = false;
    FirstClass = false;
    notifyListeners();
  }

  void bussClass() {
    SEconomyPrimimum = false;
    primium = false;
    primium = false;
    Bussion = true;
    FirstClass = false;
    notifyListeners();
  }

  void firstClass() {
    SEconomyPrimimum = false;
    primium = false;
    primium = false;
    Bussion = false;
    FirstClass = true;
    notifyListeners();
  }

  //----------------Set from Search city  code and -----------------------//

  void searchOriginCityCode(code){
    fromCityCode=code;
    notifyListeners();
  }

  void searchOriginCityName(code){
    fromCity=code;
    notifyListeners();
  }

  void searchDestinationCityCode (code){
    toCityCode=code;
    notifyListeners();
  }
  void searchDestinationCityName (code){
    toCity=code;
    notifyListeners();
  }
  //------------------- search flight data --------------------//

void searchFlightData (date)async{
  Uri myUri = Uri.parse("http://bbflightappapi.pythonanywhere.com/api/v1/flight/search_offers/?originCode=${fromCityCode}&destinationCode=${toCityCode}&departureDate=${date}");
print(myUri);
  http.Response response = await http.get(
    myUri,
  );

  print("fetchOneWayFlight Status code: ${response.statusCode}");
  if (response.statusCode == 200) {
    debugPrint("fetchOneWayFlight Response Body: ${response.body}");
    debugPrint("fetchOneWayFlight Status Code: ${response.statusCode}");
  } else {
    print('Request failed with status: ${response.statusCode}');

  }
}

}
