// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flights_app/Arguments/OneWayArgemnts.dart';
import 'package:flights_app/Provider/search_provider.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import '../Modal/Searchflight.dart';

class SearchFlightPage extends StatefulWidget {
  const SearchFlightPage({Key? key}) : super(key: key);

  @override
  State<SearchFlightPage> createState() => _SearchFlightPageState();
}

class _SearchFlightPageState extends State<SearchFlightPage> {
  List fareList = [
    "Armed Forces",
    "Student",
    "Senior Citizen",
    "Double Seat",
  ];
  List referList = [
    "Refer & Earn",
    "Refer & Earn",
    "",
    "What is this?",
  ];

  List offerList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
  ];

  int tabIndex = 1;

  Widget? tabWidget() {
    if (tabIndex == 1) {
      return oneWay(context);
    } else if (tabIndex == 2) {
      return roundTrip(context);
    } else {
      return multiCity(context);
    }
  }

  List addContainerList = [];

  void tabCountWidget() {
    if (addContainerList.length != 5) {
      setState(() {
        addContainerList.add(buildAddContainerRow());
      });
    }
  }

  // Date picker Returning date by gaurav developer

  DateTime ReturningDate = DateTime.now();

  _ReturningDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        helpText: "Select Returning Date",
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                  primary: Constant.primaryColor, secondary: Colors.black),
            ),
            child: child ?? Text(""),
          );
        });
    if (selected != null && selected != selectedDate)
      setState(() {
        ReturningDate = selected;
        tabIndex = 2;
      });
  }

  // Date picker by gaurav developer

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      helpText: "Select Departure Date",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
                primary: Constant.primaryColor, secondary: Colors.black),
          ),
          child: child ?? Text(""),
        );
      },
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  //---------------- bottomsheet by gaurav---------------//

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height / 1.1,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            child: ChangeNotifierProvider<SearchProvider>(
              create: (context) => SearchProvider(),
              child: Consumer<SearchProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(0),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                              )),
                          Text(
                            "Select TravelLers & Class",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            textScaleFactor: 1.3,
                          )
                        ]),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text("ADD NUMBER OF TRAVELLERS",
                              textAlign: TextAlign.left),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Adult",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: " 12 yrs & above",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ])),
                                Text(
                                  "On the day of travel",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 13),
                                )
                              ],
                            ),
                            Card(
                              elevation: 5,
                              child: Row(children: [
                                IconButton(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    onPressed: () {
                                      provider.removeAddult();
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      color: Colors.black,
                                    )),
                                Text("${provider.Adult} ",
                                    textScaleFactor: 1.2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800)),
                                IconButton(
                                    onPressed: () {
                                      provider.addAddult();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Children",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: " 2 - 12 yrs",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ])),
                                Text(
                                  "On the day of travel",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 13),
                                )
                              ],
                            ),
                            Card(
                              elevation: 5,
                              child: Row(children: [
                                IconButton(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    onPressed: () {
                                      provider.removeChild();
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      color: Colors.black,
                                    )),
                                Text("${provider.Child} ",
                                    textScaleFactor: 1.2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800)),
                                IconButton(
                                    onPressed: () {
                                      provider.addChild();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Infant",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: " Under 2 yrs",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ])),
                                Text(
                                  "On the day of travel",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 13),
                                )
                              ],
                            ),
                            Card(
                              elevation: 5,
                              child: Row(children: [
                                IconButton(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    onPressed: () {
                                      provider.removeInfant();
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      color: Colors.black,
                                    )),
                                Text("${provider.Infant} ",
                                    textScaleFactor: 1.2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800)),
                                IconButton(
                                    onPressed: () {
                                      provider.addInfant();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.orangeAccent),
                          alignment: Alignment.center,
                          child: Expanded(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.people_alt,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            "Introducing Group Booking Now Book For ",
                                        style: TextStyle(),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "more than 9 travellers",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(text: " with ease.")
                                        ]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text("CHOOSE CABIN CLASS",
                              textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              provider.economyPremClass();
                            },
                            child: Text("Economy / Premium Economy"),
                            style: ElevatedButton.styleFrom(
                              onPrimary: provider.SEconomyPrimimum == true
                                  ? Colors.white
                                  : Colors.black38,
                              primary: provider.SEconomyPrimimum == true
                                  ? Constant.primaryColor
                                  : Colors.white,
                              minimumSize: Size(150, 40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  provider.premiumClass();
                                },
                                child: Text("Primium Economy"),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: provider.primium == true
                                      ? Colors.white
                                      : Colors.black38,
                                  primary: provider.primium == true
                                      ? Constant.primaryColor
                                      : Colors.white,
                                  minimumSize: Size(100, 40),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  provider.bussClass();
                                },
                                child: Text("Bussiness Class"),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: provider.Bussion == true
                                      ? Colors.white
                                      : Colors.black38,
                                  primary: provider.Bussion == true
                                      ? Constant.primaryColor
                                      : Colors.white,
                                  minimumSize: Size(100, 40),
                                ))
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              provider.firstClick();
                            },
                            child: Text("First Class"),
                            style: ElevatedButton.styleFrom(
                              onPrimary: provider.FirstClass == true
                                  ? Colors.white
                                  : Colors.black38,
                              primary: provider.FirstClass == true
                                  ? Constant.primaryColor
                                  : Colors.white,
                              minimumSize: Size(150, 40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Done"),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Constant.primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 28, 40),
                            )),
                      )
                    ],
                  );
                },
              ),
            ));
      },
    );
  }

  List searchFlightsdateLis = [];
  void searchFlightsdate() async {
    searchFlightsdateLis.clear();
    Uri myUri = Uri.parse(
        "http://bbflightappapi.pythonanywhere.com/api/v1/flight/search_offers/?originCode=${"NBO"}&destinationCode=${"JKIA"}&departureDate=${DateFormat.y().format(selectedDate) + "-" + DateFormat.M().format(selectedDate) + "-" + DateFormat.d().format(selectedDate)}");
    print(myUri);
    http.Response response = await http.get(
      myUri,
    );

    print("fetchOneWayFlight Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      debugPrint("fetchOneWayFlight Response Body: ${response.body}");
      debugPrint("fetchOneWayFlight Status Code: ${response.statusCode}");

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      searchflight search = searchflight.fromJson(jsonResponse);
      List<Data> list = search.data!;

      searchFlightsdateLis.addAll(list);
      setState(() {
        print("searchFlightsdateLis.length:${searchFlightsdateLis.length}");
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider providersearch = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchProvider>(
          builder: ((context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.grey[700],
                              size: 32,
                            )),
                        SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Flight ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Search",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        Icon(
                          Icons.g_translate_outlined,
                          color: Constant.primaryColor,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                          bottom: -10,
                          right: 15,
                          left: 15,
                          top: -10,
                          child: SizedBox(
                            height: 30,

                            child: Card(

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),


                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          tabIndex = 1;
                                          setState(() {});
                                        },
                                        child: Card(
                                            elevation: 0,
                                            color: tabIndex == 1
                                                ? Constant.primaryColor
                                                : Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 4),
                                              child: Text("ONE WAY",style: TextStyle(fontSize: 12),),
                                            ))),
                                    GestureDetector(
                                        onTap: () {
                                          tabIndex = 2;
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: tabIndex == 2
                                              ? Constant.primaryColor
                                              : Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 4),
                                            child: Text("ROUND TRIP",style: TextStyle(fontSize: 12)),
                                          ),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          tabIndex = 3;
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: tabIndex == 3
                                              ? Constant.primaryColor
                                              : Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 4),
                                            child: Text("MULTI CITY",style: TextStyle(fontSize: 12)),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  tabWidget()!,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SPECIAL FARES (OPTIONAL)",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      itemCount: fareList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    // color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(fareList[index]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  index == 3
                                      ? buildShowModalBottomSheet(context)
                                      : null;
                                },
                                child: Text(
                                  referList[index],
                                  style: TextStyle(
                                      color: Constant.primaryColor,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          // provider.searchFlightData(
                          //     DateFormat.y().format(selectedDate) +
                          //         "-" +
                          //         DateFormat.M().format(selectedDate) +
                          //         "-" +
                          //         DateFormat.d().format(selectedDate));

                          if (tabIndex == 1) {
                            searchFlightsdate();
                            searchFlightsdate();
                            print(searchFlightsdateLis.length);
                            Future.delayed(const Duration(seconds: 0))
                                .then((value) {
                              Navigator.pushNamed(
                                  context, AppRoutes.SearchOneWayDetailsPage,
                                  arguments:ScreenArguments(provider.fromCity,provider.fromCityCode,provider.toCity,provider.toCityCode,DateFormat.y().format(selectedDate) +
                                      "-" +
                                      DateFormat.M().format(selectedDate) +
                                      "-" +
                                      DateFormat.d().format(selectedDate)));

                            });
                          } else if (tabIndex == 2) {
                            Navigator.pushNamed(
                                context, AppRoutes.SearchRoundTripDetailsPage);
                          } else {
                            Navigator.pushNamed(
                                context, AppRoutes.SearchRoundTripDetailsPage);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Constant.primaryColor,
                            primary: Constant.primaryColor),
                        child: Center(
                          child: Text(
                            "SEARCH FLIGHTS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Divider(thickness: 1.5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.local_offer, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                            child: Text(
                          "OFFERS",
                          style: TextStyle(
                              fontSize: 18, color: Constant.primaryColor),
                        )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.OfferPage);
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 18, color: Constant.primaryColor),
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(Icons.arrow_forward_ios_outlined, size: 20),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: offerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Image(
                                image: NetworkImage(offerList[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(color: Constant.dividerColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        "EXCLUSIVE PARTNERS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: offerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Card(
                            child: Image(
                              image: NetworkImage(offerList[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(color: Constant.dividerColor),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.55,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "Fly Safer with",
                      style: TextStyle(
                          color: Constant.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Double-Seat!",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  SizedBox(height: 10),
                  Container(height: 2, width: 50, color: Constant.primaryColor),
                  SizedBox(height: 16),
                  Text(
                    "Step up physical distancing by booking two or three adjacent seats for one traveller. Opt from 'Double/Multi Seat' by Indigo or 'Go More' service by GoAir -available only for domestic one-way economy class bookings.",
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("OKAY, GOT IT",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Constant.primaryColor)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          );
        });
  }

  Widget oneWay(BuildContext context) {
    SearchProvider providersearch = Provider.of<SearchProvider>(context);
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.CitySearchPage);
              },
              child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<SearchProvider>(
                    builder: (context, provider, child) {
                      return detailContainer(
                        Icons.airplanemode_active_rounded,
                        "FROM",
                        providersearch.fromCity,
                        providersearch.fromCityCode,
                        "${providersearch.fromCity} Airport",

                      );
                    },
                  ),
                  SizedBox(height: 10),
                  detailContainer(
                      Icons.airplanemode_active_rounded,
                      "TO",
                      providersearch.toCity,
                      providersearch.toCityCode,
                      "${providersearch.toCity} Airport"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: detailContainer(
                              Icons.airplanemode_active_rounded,
                              "DEPARTURE DATE",
                              "${DateFormat.d().format(selectedDate)} ${DateFormat.MMM().format(selectedDate)}",
                              "${DateFormat.E().format(selectedDate)}, ${DateFormat.y().format(selectedDate)}",
                              "")),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          _ReturningDate(context);
                        },
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AutoSizeText(
                                        "+ADD RETURN DATE",
                                        minFontSize: 10,
                                        maxFontSize:14,
                                      //  stepGranularity: 10,
                                        maxLines: 4,
                                       overflow: TextOverflow.ellipsis,
   // maxFontSize:2,
                                        style: TextStyle(
                                            //fontSize: 12,
                                            color: Constant.primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      AutoSizeText(
                                        "Save more on round trips!",
                                        minFontSize: 10,
                                        maxFontSize:12,
                                         // stepGranularity: 10,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                           // fontSize: 8,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        _showModalBottomSheet();
                      },
                      child: detailContainer(Icons.person, "TRAVELLERS & CLASS",
                          "01,", "Economy/Premium Economy", "")),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
                right: 15,
                top: 55,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(Icons.arrow_downward_outlined,
                        size: 26, color: Constant.primaryColor),
                  ),
                ))
          ],
        ));
  }

  Widget roundTrip(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.CitySearchPage);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailContainer(Icons.airplanemode_active_rounded, "FROM",
                    "Chandigarh", "IXC", "Chandigarh Airport"),
                SizedBox(height: 10),
                detailContainer(Icons.airplanemode_active_rounded, "TO",
                    "New Delhi", "DEL", "Indira Gandhi International Airport"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   height: 70,
                    //   width: MediaQuery.of(context).size.width / 2 - 15,
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey[200],
                    //       borderRadius: BorderRadius.circular(4),
                    //       border: Border.all(color: Colors.grey)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment:
                    //           MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Icon(
                    //           Icons.departure_board_outlined,
                    //           color: Colors.black45,
                    //         ),
                    //         SizedBox(width: 6),
                    //         Column(
                    //           crossAxisAlignment:
                    //               CrossAxisAlignment.start,
                    //           mainAxisAlignment:
                    //               MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Text(
                    //               "DEPARTURE DATE",
                    //               style: TextStyle(
                    //                   color: Colors.grey[600],
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //             RichText(
                    //               text: TextSpan(
                    //                 text: "04 Jun ",
                    //                 style: TextStyle(
                    //                     color: Colors.black87,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold),
                    //                 children: <TextSpan>[
                    //                   TextSpan(
                    //                     text: "Sat, 2022",
                    //                     style: TextStyle(fontSize: 12),
                    //                   )
                    //                 ],
                    //               ),
                    //               maxLines: 2,
                    //               overflow: TextOverflow.ellipsis,
                    //               softWrap: true,
                    //             ),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    detailContainer(
                        Icons.airplanemode_active_rounded,
                        "DEPARTURE DATE",
                        "${DateFormat.d().format(selectedDate)} ${DateFormat.MMM().format(selectedDate)}",
                        "${DateFormat.E().format(selectedDate)}, ${DateFormat.y().format(selectedDate)}",
                        ""),

                    SizedBox(width: 10),
                    Stack(
                      children: [
                        detailContainer(
                            Icons.airplanemode_active_rounded,
                            "RETURN DATE",
                            "${DateFormat.d().format(ReturningDate)} ${DateFormat.MMM().format(ReturningDate)}",
                            "${DateFormat.E().format(ReturningDate)}, ${DateFormat.y().format(ReturningDate)}",
                            ""),
                        Positioned(
                            right: -2,
                            child: Icon(
                              Icons.close,
                              color: Colors.grey[400],
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                detailContainer(Icons.person, "TRAVELLERS & CLASS", "01,",
                    "Economy/Premium Economy", ""),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 55,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Icon(Icons.arrow_downward_outlined,
                      size: 26, color: Constant.primaryColor),
                ),
              ))
        ],
      ),
    );
  }

  Widget multiCity(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FROM', style: TextStyle(color: Colors.black45)),
              Text('T0                       ',
                  style: TextStyle(color: Colors.black45)),
              Text('DATE', style: TextStyle(color: Colors.black45)),
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.CitySearchPage);
              },
              child: buildContainerRow()),
          SizedBox(height: 8),
          ListView.builder(
              itemCount: addContainerList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    children: [
                      buildAddContainerRow(),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                addContainerList.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.close,
                              size: 20,
                              // Icons.close,
                              color: Colors.red,
                            )),
                      )
                    ],
                  ),
                );
              }),
          SizedBox(height: 12),
          DottedBorder(
            color: Constant.primaryColor,
            strokeWidth: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                onTap: () {
                  tabCountWidget();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      "+ADD CITY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constant.primaryColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          detailContainer(Icons.person, "TRAVELLERS & CLASS", "01,",
              "Economy/Premium Economy", ""),
        ],
      ),
    );
  }

  Widget buildContainerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildContainer("IXC", "Chandigarh"),
        buildContainer("BOM", "Mumbai"),
        buildContainer("16 Jun", "Thu 2022"),
      ],
    );
  }

  Widget buildAddContainerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildAddContainer("", ""),
        buildAddContainer("", ""),
        buildAddContainer("", ""),
      ],
    );
  }

  Widget buildContainer(title, details) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              details,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddContainer(title, details) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Constant.primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              details,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailContainer(iconData, initialText, dest, shortDest, location) {
    return Container(
      //height: 70,
        height:  MediaQuery.of(context).size.height/11.0,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black45,
            ),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  initialText,
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.w600,),
                ),
                RichText(
                  text: TextSpan(
                    text: "$dest ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: "$shortDest",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  "$location",
                  style: TextStyle(color: Colors.grey[600],),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
