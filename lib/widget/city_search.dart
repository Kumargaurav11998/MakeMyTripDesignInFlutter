// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flights_app/Modal/search_destination_modal.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Provider/search_provider.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({Key? key}) : super(key: key);

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  TextEditingController fromCityController = TextEditingController();
  TextEditingController fromCityCodeController = TextEditingController();
  TextEditingController fromCityCodeControllerShow = TextEditingController();
  TextEditingController toCityController = TextEditingController();
  TextEditingController toCityControllershow = TextEditingController();
  TextEditingController toCityCodeController = TextEditingController();
  bool isLoading = false;

  late List<Data> autoCompleteData = [];
  late List<Data> SuggestlistToCity = [];

  late TextEditingController controller;

  Future fetchAutoCompleteData(value) async {
    autoCompleteData.clear();
    SuggestlistToCity.clear();
    Uri myURI = Uri.parse(NetworkUtil.baseUrl +
        NetworkUtil.EndPoint +
        "select_destination/$value");

   // print(myURI);

    http.Response response = await http.get(
      myURI,
    );
    print("fetchOneWayFlight value:$value Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      autoCompleteData.clear();
      debugPrint("fetchOneWayFlight Response Body: ${response.body}");
      debugPrint("fetchOneWayFlight Status Code: ${response.statusCode}");
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      SearchDestinationModal destinationModal =
          SearchDestinationModal.fromJson(jsonResponse);
      List<Data> list = destinationModal.data!;

      autoCompleteData.addAll(list);
      setState(() {});
    } else if (response.statusCode == 500) {
      Fluttertoast.showToast(msg: "Error: ${response.statusCode}");
    //  print('Request failed with status: ${response.statusCode}');
    } else {
     // print('Request failed with status: ${response.statusCode}');
    }
  }

  //--To city ---------------

  Future fetchAutoCompleteToCityData(value) async {
    autoCompleteData.clear();
    SuggestlistToCity.clear();


    Uri myURI = Uri.parse(NetworkUtil.baseUrl +
        NetworkUtil.EndPoint +
        "select_destination/$value");

   // print(myURI);

    http.Response response = await http.get(
      myURI,
    );
 //   print("fetchOneWayFlight value:$value Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      SuggestlistToCity.clear();
      debugPrint("fetchOneWayFlight Response Body: ${response.body}");
      debugPrint("fetchOneWayFlight Status Code: ${response.statusCode}");
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      SearchDestinationModal destinationModal =
          SearchDestinationModal.fromJson(jsonResponse);
      List<Data> list = destinationModal.data!;

      SuggestlistToCity.addAll(list);
      setState(() {
        autoCompleteData.clear();
      });
    } else if (response.statusCode == 500) {

      Fluttertoast.showToast(msg: "Error: ${response.statusCode}");
     // print('Request failed with status: ${response.statusCode}');
    } else {
     // print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider providersearch = Provider.of<SearchProvider>(context);
    return SafeArea(
      child: Scaffold(body: SafeArea(
        child: Consumer<SearchProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                if(fromCityCodeController.text==''&&toCityCodeController.text==""){
                                  provider.searchOriginCityCode("NBO");
                                  provider.searchOriginCityName("Nairobi");
                                  provider.searchDestinationCityCode("Patna");
                                  provider.searchDestinationCityName("Patna");
                                  Navigator.pop(context);
                                }
                              else if(fromCityCodeController.text==''){
                                  provider.searchOriginCityCode("NBO");
                                  provider.searchOriginCityName("Nairobi");
                                  provider.searchDestinationCityCode(toCityCodeController.text);
                                  provider.searchDestinationCityName(toCityController.text);
                                  Navigator.pop(context);
                                }else if(toCityCodeController.text==""){
                                  provider.searchDestinationCityCode("PAT");
                                  provider.searchDestinationCityName("Patna");
                                  provider.searchOriginCityCode(fromCityCodeController.text);
                                  provider.searchOriginCityName(fromCityController.text);
                                  Navigator.pop(context);
                                }else {
                                  provider.searchOriginCityCode(fromCityCodeController.text);
                                  provider.searchOriginCityName(fromCityController.text);
                                  provider.searchDestinationCityCode(toCityCodeController.text);
                                  provider.searchDestinationCityName(toCityController.text);
                                  Navigator.pop(context);
                                }


                              },
                              child: Icon(Icons.arrow_back_outlined,
                                  color: Colors.black87)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FROM",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                buildTextFormField(
                                  fromCityCodeControllerShow,
                                  'Enter any City/Airport Name',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.airplanemode_active, color: Colors.black87),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TO",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                buildTextFormFieldToCity(toCityControllershow,
                                    'Enter any City/Airport Name')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Text("Recent Searches"),
                autoCompleteData.length > 0 &&
                        SuggestlistToCity.length == 0
                    ? fromCityController.text != '' &&
                            autoCompleteData.length == 0
                        ? SizedBox(
                  child: CircularProgressIndicator(),
                  height: 50,
                  width: 50,
                )
                        : Expanded(
                          child
                              : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: autoCompleteData.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return GestureDetector(
                                    onTap: () {

                                      setState(() {
                                        fromCityController.text =
                                            autoCompleteData[index]
                                                .name
                                                .toString();
                                        fromCityCodeController.text =
                                            autoCompleteData[index]
                                                .iataCode
                                                .toString();
                                        fromCityCodeControllerShow.text =
                                        "${autoCompleteData[index]
                                            .name
                                            .toString()
                                        }/${ autoCompleteData[index]
                                            .iataCode
                                            .toString()}" ;

                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          autoCompleteData[index].name.toString(), textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                    ));
                              },
                            ),
                        )
                    : toCityController.text != '' &&
                    toCityCodeController == ''
                        ? SizedBox(
                            child: CircularProgressIndicator(),
                            height: 50,
                            width: 50,
                          )
                        : Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: SuggestlistToCity.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        toCityController.text =
                                            SuggestlistToCity[index]
                                                .name
                                                .toString();
                                        toCityCodeController.text =
                                            SuggestlistToCity[index]
                                                .iataCode
                                                .toString();
                                        toCityControllershow.text =
                                            "${SuggestlistToCity[index]
                                                .name
                                                .toString()
                                               }/${ SuggestlistToCity[index]
                                                .iataCode
                                                .toString()}";
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(SuggestlistToCity[index]
                                          .name
                                          .toString(), textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                    ));
                              },
                            ),
                        ),
              ],
            );
          },
        ),
      )),
    );
  }

  Widget buildTextFormField(controller, text) {
    return TextFormField(
      scrollPadding: EdgeInsets.all(0),
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: text,
      ),
      onChanged: (text) {
        setState(() {
          fetchAutoCompleteData(text);
        });
      },
    );
  }

  //---------------- to city

  Widget buildTextFormFieldToCity(controller, text) {
    return TextFormField(
      scrollPadding: EdgeInsets.all(0),
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: text,
      ),
      onChanged: (text) {
        setState(() {
          fetchAutoCompleteToCityData(text);
        });
      },
    );
  }
}
