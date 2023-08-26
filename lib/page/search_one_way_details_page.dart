// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flights_app/Modal/Searchflight.dart';
import 'package:flights_app/Provider/search_provider.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Arguments/OneWayArgemnts.dart';

class SearchOneWayDetailsPage extends StatefulWidget {
  const SearchOneWayDetailsPage({Key? key}) : super(key: key);

  @override
  State<SearchOneWayDetailsPage> createState() =>
      _SearchOneWayDetailsPageState();
}

class _SearchOneWayDetailsPageState extends State<SearchOneWayDetailsPage> {
  Object? searchList = '';
  List dateList = [
    "Tue, 14 Jun",
    "Wed, 15 Jun",
    "Thu, 16 Jun",
    "Fri, 17 Jun",
    "Sat, 18 Jun",
    "Sun, 19 Jun",
    "Mon, 20 Jun",
    "Mon, 20 Jun",
    "Mon, 20 Jun",
    "Mon, 20 Jun",
    "Mon, 20 Jun",
  ];

  List amountList = [
    "4132",
    "1432",
    "4182",
    "9132",
    "9132",
    "9132",
    "9132",
    "9132",
    "5132",
    "8932",
    "7032",
  ];

  List amount = [
    "4132",
    "1432",
    "4182",
    "9132",
    "9132",
    "9132",
    "9132",
    "9132",
    "5132",
    "8932",
    "7032",
  ];

  List timeList = [
    "1h 5m",
    "1h",
    "1h",
    "1h",
    "1h 5m",
    "1h 5m",
    "1h 5m",
    "1h",
    "1h",
  ];

  List codeList = [
    "MMTSUPER",
    "MONSOONSALE",
    "MMTSUPER",
    "MONSOONSALE",
    "MMTSUPER",
    "MONSOONSALE",
    "MMTSUPER",
    "MONSOONSALE",
    "MMTSUPER",
  ];
  List iconList = [
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
    Icons.airplanemode_active,
  ];
  List titleList = [
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
    "Alliance Air",
  ];
  List titleBList = [
    "Go First",
    "Go First",
    "Go First",
    "Go First",
    "Go First",
    "Go First",
    "Go First",
    "Go First",
    "Go First",
  ];
  List titleCList = [
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
    "IndiGo",
  ];

  List startTimeList = [
    "17.35",
    "17.35",
    "17.35",
    "17.35",
    "17.35",
    "17.35",
    "17.35",
    "17.35",
    "17.35",
  ];
  List startCityList = [
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
    "Chandigarh",
  ];
  List endCityList = [
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
    "Delhi",
  ];
  List endTimeList = [
    "18.40",
    "18.40",
    "18.40",
    "18.40",
    "18.40",
    "18.40",
    "18.40",
    "18.40",
    "18.40",
  ];
  List stopList = [
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
    "Non stop",
  ];
  List plansList = [
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
    "View Prices",
  ];

  List seatList = [
    "1",
    "4",
    "5",
    "3",
    "9",
    "7",
    "2",
    "8",
    "6",
  ];

  List bottomList = [
    "Non Stop",
    "Morning Departure",
    "Indigo",
    "Vistara",
    "Go First",
    "Late Departure",
  ];

  int tabIndex = 1;

  Widget? fareListTabWidget() {
    if (tabIndex == 1) {
      return buildCenterList();
    } else if (tabIndex == 2) {
      return buildCenterList();
    } else {
      return buildCenterList();
    }
  }

  List searchFlightsdateLis = [];

  void searchFlightsdate(ScreenArguments argument) async {
    searchFlightsdateLis.clear();
    Uri myUri = Uri.parse(
        "http://bbflightappapi.pythonanywhere.com/api/v1/flight/search_offers/?originCode=MAA&destinationCode=DEL&departureDate=2022-12-09");
    print(myUri);
    http.Response response = await http.get(
      myUri,
    );

    print("fetchOneWayFlight Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      debugPrint(
          "fetchOneWayFlighttuytttttttttttttttttttttttttttttttttttttttt Response Body: ${response.body}");
      debugPrint(
          "fetchOneWayFlight1111111111 Status Code: ${response.statusCode}");

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      searchflight search = searchflight.fromJson(jsonResponse);
      List<Data> list = search.data!;
      print('list:${list.length}');
      searchFlightsdateLis.addAll(list);
      setState(() {});
      setState(() {
        print("searchFlightsdateLis.length:${searchFlightsdateLis[0]}");
        searchList = argument.depDate;
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (searchList == '') {
      ScreenArguments arguments =
          ModalRoute.of(context)?.settings.arguments as ScreenArguments;
      searchList = arguments.depDate;
      print(searchList);
      searchFlightsdate(arguments);
    }

    SearchProvider providersearch = Provider.of<SearchProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Consumer<SearchProvider>(builder: ((context, provider, child) {
        return searchFlightsdateLis.length == 0
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Constant.primaryColor,
              ))
            : Stack(
                children: [
                  Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Constant.primaryColor),
                                      border: Border.all(color: Colors.black54),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                  Icons.arrow_back_outlined)),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${providersearch.fromCity} to ${providersearch.toCity}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  " ${searchList} ${providersearch.Adult} Adult | Economy",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            children: [
                                              Icon(Icons.edit),
                                              Text("Edit")
                                            ],
                                          ),
                                          SizedBox(width: 12),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Constant.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Constant.primaryColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                              Icons
                                                  .notification_important_rounded,
                                              color: Colors.white),
                                          Text(
                                            "Price\nAlert",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: [
                                  RotationTransition(
                                    turns: AlwaysStoppedAnimation(-90 / 360),
                                    child: Card(
                                        color: Constant.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topRight: Radius.circular(6))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Text("JUN"),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 56,
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    child: ListView.builder(
                                      itemCount: searchFlightsdateLis.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        print(
                                            "searchFlightsdateLis[index].date.toString()${index}");
                                        print(
                                            "searchFlightsdateLis[index].date.toString()${searchFlightsdateLis[index].lastTicketingDate.toString()}");

                                        return buildDateCard(
                                          index,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  tabIndex = 1;
                                  setState(() {});
                                },
                                child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(),
                                    // width: MediaQuery.of(context).size.width - 44,
                                    child: buildFareCard(
                                        "Cheapest",
                                        "3425",
                                        "1 h",
                                        tabIndex == 1
                                            ? Constant.primaryColor
                                            : Colors.white))),
                            GestureDetector(
                                onTap: () {
                                  tabIndex = 2;
                                  setState(() {});
                                },
                                child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(),
                                    // width: MediaQuery.of(context).size.width - 44,
                                    child: buildFareCard(
                                        "Fastest",
                                        "3189",
                                        "1 h",
                                        tabIndex == 2
                                            ? Constant.primaryColor
                                            : Colors.white))),
                            GestureDetector(
                                onTap: () {
                                  tabIndex = 3;
                                  setState(() {});
                                },
                                child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(),
                                    // width: MediaQuery.of(context).size.width - 44,
                                    child: buildFareCard(
                                        "You May Prefer",
                                        "3815",
                                        "1 h",
                                        tabIndex == 3
                                            ? Constant.primaryColor
                                            : Colors.white))),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     height: 56,
                      //     decoration: BoxDecoration(),
                      //     width: MediaQuery.of(context).size.width - 44,
                      //     child: ListView.builder(
                      //       itemCount: fareList.length,
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return buildFareCard(fareList[index], amountList[index],
                      //             timeList[index]);
                      //       },
                      //     ),
                      //   ),
                      // ),
                      fareListTabWidget()!,
                    ],
                  ),
                  positionedWidget(),
                ],
              );
      }))),
    );
  }

  Widget buildCenterList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.health_and_safety_outlined),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Get 100% Refund on Flight Cancellation",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.keyboard_arrow_right_outlined,
                                    color: Colors.green),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                      "Now get full refund on domestic flight cancellation, for COVID+ cases. No questions asked. #MMTPromise",
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text("Know More",
                                style: TextStyle(
                                    fontSize: 12, color: Constant.primaryColor))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            tabIndex == 3
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border_outlined,
                            size: 18, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Text(
                          "Flight based on your past bookings",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500]),
                        )
                      ],
                    ),
                  )
                : SizedBox(width: 0),
            ListView.builder(
              itemCount: searchFlightsdateLis.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: buildCard(index),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Constant.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notification_important_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tracking flight prices for this trip",
                                  style: TextStyle(fontSize: 15)),
                              SizedBox(height: 6),
                              Text(
                                  "You will receive alerts on price hikes & drops",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 88),
          ],
        ),
      ),
    );
  }

  Widget buildCard(index) {
    var a = searchFlightsdateLis[index]
        .itineraries[0]
        .segments[0]
        .departure
        .at
        .toString();
    return GestureDetector(
      onTap: () {

      },
      child: Card(
          elevation: 6,
          shadowColor: Constant.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.airplanemode_active),
                    SizedBox(width: 10),
                    Text(
                      searchFlightsdateLis[index]
                          .itineraries[0]
                          .segments[0]
                          .carrierCode
                          .toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                              searchFlightsdateLis[index]
                                  .itineraries[0]
                                  .segments[0]
                                  .departure
                                  .at
                                  .substring(11, 16),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                              searchFlightsdateLis[index]
                                  .itineraries[0]
                                  .segments[0]
                                  .departure
                                  .iataCode
                                  .toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                              searchFlightsdateLis[index]
                                          .itineraries[0]
                                          .segments[0]
                                          .duration
                                          .toString()
                                          .length >
                                      6
                                  ? searchFlightsdateLis[index]
                                      .itineraries[0]
                                      .segments[0]
                                      .duration
                                      .substring(2, 7)
                                  : searchFlightsdateLis[index]
                                      .itineraries[0]
                                      .segments[0]
                                      .duration
                                      .substring(2, 4),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.green,
                          ),
                          SizedBox(height: 2),
                          Text(
                              searchFlightsdateLis[index]
                                          .itineraries[0]
                                          .segments[0]
                                          .numberOfStops
                                          .toString() ==
                                      "0"
                                  ? "Non-Stop"
                                  : searchFlightsdateLis[index]
                                          .itineraries[0]
                                          .segments[0]
                                          .numberOfStops
                                          .toString() +
                                      " stop",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                              searchFlightsdateLis[index]
                                  .itineraries[0]
                                  .segments[0]
                                  .arrival
                                  .at
                                  .substring(11, 16),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                              searchFlightsdateLis[index]
                                  .itineraries[0]
                                  .segments[0]
                                  .arrival
                                  .iataCode
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54))
                        ],
                      ),
                      Column(
                        children: [
                          Text("\u{20AC} ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            searchFlightsdateLis[index]
                                .price
                                .grandTotal
                                .toString(),
                            //   searchFlightsdateLis[index].price.total.toString(),
                            style: TextStyle(
                                fontSize: 12, color: Constant.primaryColor),
                          )
                        ],
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constant.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Constant.primaryColor),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(1),
                            border: Border.all(color: Constant.primaryColor),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              "Use  and get FLAT Rs.\u{20AC} instant discount on this flight",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "seat Seats left at this price",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    )
                  ],
                ),
                SizedBox(height: 4),
                SizedBox(height: 4),
                ExpansionTile(
                  title: Text(
                    "Flight Details",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  textColor: Constant.primaryColor,
                  trailing: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "Pay later is not active yet ");
                    },
                    child: Container(
                      width: 206,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(360),
                                  topLeft: Radius.circular(360),
                                ),
                                color: Constant.primaryColor,
                                border: Border.all(
                                  color: Constant.primaryColor,
                                )),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Constant.primaryColor,
                                        border: Border.all(
                                          color: Colors.white,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    "Lock Price and Pay Later",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.grey[600],
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  tilePadding: const EdgeInsets.all(0),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${searchFlightsdateLis[index].itineraries[0].segments[0].carrierCode.toString()} Super Saver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("Fare offered by airlines",
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.airplane_ticket, size: 16),
                            SizedBox(width: 10),
                            Expanded(child: Text("Departure")),
                            Text(
                                "Terminal  ${searchFlightsdateLis[index].itineraries[0].segments[0].departure.terminal.toString()}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.airplane_ticket_rounded, size: 16),
                            SizedBox(width: 10),
                            Expanded(child: Text("Arrival")),
                            Text(
                                "Terminal  ${searchFlightsdateLis[index].itineraries[0].segments[0].arrival.terminal.toString()}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.euro, size: 16),
                            SizedBox(width: 10),
                            Expanded(child: Text("Fare Option")),
                            Text(searchFlightsdateLis[index]
                                .travelerPricings[0]
                                .fareOption
                                .toString()),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.cabin_sharp, size: 16),
                            SizedBox(width: 10),
                            Expanded(child: Text("Cabin")),
                            Text(searchFlightsdateLis[index]
                                .travelerPricings[0]
                                .fareDetailsBySegment[0]
                                .cabin
                                .toString()),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.card_travel, size: 16),
                            SizedBox(width: 10),
                            Expanded(child: Text("Included Checked Bags")),
                            Text(
                                "${searchFlightsdateLis[index].travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.weight.toString()} ${searchFlightsdateLis[index].travelerPricings[0].fareDetailsBySegment[0].includedCheckedBags.weightUnit.toString()}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(alignment:Alignment.centerRight, child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.BookTripPage);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color:Constant.primaryColor,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              )),

                        ),),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget buildDateCard(index) {
    print("index$index");
    // print(
    //     "searchFlightsdateLis[index].date.toString()${searchFlightsdateLis[index].lastTicketingDate.toString()}");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              searchFlightsdateLis[index].lastTicketingDate.toString(),
              style: TextStyle(fontSize: 10),
            ),
            Text(
              "\u{20AC} ${searchFlightsdateLis[index].price.total.toString()}",
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFareCard(fare, amount, time, color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(fare),
            Text(
              "\u{20AC}$amount | $time",
              style: TextStyle(),
            )
          ],
        ),
      ),
    );
  }

  Widget positionedWidget() {
    return Positioned(
        bottom: 10,
        left: 10,
        right: 10,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black54),
          ),
          child: Row(
            children: [
              SizedBox(width: 6),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 40),
                      child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                            itemCount: bottomList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // scrollDirection: Axis.vertical,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  // height: 60,
                                  // width: 75,

                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Colors.black54),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Center(
                                      child: Text(
                                        bottomList[index],
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                ),
              ),
              SizedBox(width: 6),
              Container(
                height: 71,
                decoration: BoxDecoration(
                  color: Constant.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6)),
                  border: Border.all(color: Constant.primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.filter_list, color: Colors.white),
                        Text("Search & Filters",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
