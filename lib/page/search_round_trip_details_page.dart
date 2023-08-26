// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const, prefer_final_fields

import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';

class SearchRoundTripDetailsPage extends StatefulWidget {
  const SearchRoundTripDetailsPage({Key? key}) : super(key: key);

  @override
  State<SearchRoundTripDetailsPage> createState() =>
      _SearchRoundTripDetailsPageState();
}

class _SearchRoundTripDetailsPageState extends State<SearchRoundTripDetailsPage>
    with TickerProviderStateMixin {
  int index = 1;

  Widget? tabWidget() {
    if (index == 1) {
      return Expanded(
          child: Stack(
        children: [
          departWidget(),
          positioned(),
        ],
      ));
    } else {
      return Expanded(
          child: Stack(
        children: [returnWidget(), positioned()],
      ));
    }
  }

  Widget positioned() {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.3135,
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            children: [
              SizedBox(width: 6),
              Container(
                height: 40,
                width: 70,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Center(
                    child: Text("Non Stop",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              SizedBox(width: 6),
              Container(
                height: 40,
                width: 70,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Center(
                    child: Text("Morning Departures",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              SizedBox(width: 6),
              Container(
                height: 60,
                color: Constant.primaryColor,
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

  int bottomIndex = 1;

  Widget? bottomTabWidget() {
    if (bottomIndex == 1) {
      return bottomOnWardWidget();
    } else {
      return bottomReturnListWidget();
    }
  }

  List titleList = [
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
    "Alliance",
  ];
  List startTime = [
    "20.30",
    "17.25",
    "18.55",
    "20.30",
    "17.25",
    "18.55",
    "20.30",
    "17.25",
    "18.55",
  ];
  List endTime = [
    "20.30",
    "17.25",
    "18.55",
    "20.30",
    "17.25",
    "18.55",
    "20.30",
    "17.25",
    "18.55",
  ];
  List fareLIst = [
    "2030",
    "1725",
    "1855",
    "2030",
    "1725",
    "1855",
    "2030",
    "1725",
    "1855",
  ];
  List timeList = [
    "1h 00m",
    "1h 05 m",
    "1h 10m",
    "1h 00m",
    "1h 05 m",
    "1h 10m",
    "1h 00m",
    "1h 05 m",
    "1h 10m",
  ];
  static const List<Tab> _tabs = [
    const Tab(text: 'ONWARD'),
    const Tab(text: 'RETURN'),
  ];

  // static List<Widget> _views = [
  //   bottomOnWardWidget(),
  //   bottomReturnListWidget(),
  //   //onWardTab(),
  // ];

  Future sheet(context) {
    return buildShowModalBottomSheet(context);
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_outlined)),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chandigarh to New Delhi",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "04 Jun-05 Jun|1 Adult|",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Column(
                      children: [Icon(Icons.edit), Text("Edit")],
                    ),
                    SizedBox(width: 14),
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
                            Icon(Icons.notification_important_rounded,
                                color: Colors.white),
                            Text(
                              "Price\nAlert",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Departure", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.add_to_drive),
                          SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("20.30-21.30",
                                  style: TextStyle(fontSize: 10)),
                              Text("\u{20B9} 4,552",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Return", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.add_to_drive),
                          SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("19.00-19.55",
                                  style: TextStyle(fontSize: 10)),
                              Text("\u{20B9} 3,908",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "\u{20B9} 8460",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            // color: Constant.primaryColor,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Constant.primaryColor,
                            )),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              "LOCK PRICE",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          buildShowModalBottomSheet(context);
                          // sheet(context);
                        },
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: Constant.primaryColor,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Constant.primaryColor,
                              )),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                "BOOK",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                color: Constant.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          index = 1;
                          setState(() {});
                        },
                        child: index == 1
                            ? Row(
                                children: [
                                  Text(
                                    "DEPART",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "IXC-DEL,",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Sat, 4 Jun",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  // Text(
                                  //   "RETURN",
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w700,
                                  //       color: Colors.white60),
                                  // ),
                                ],
                              )
                            : Text(
                                "DEPART",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          index = 2;
                          setState(() {});
                        },
                        child: index == 2
                            ? Row(
                                children: [
                                  Text(
                                    "RETURN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "DEL-IXL,",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Sat, 4 Jun",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  // Text(
                                  //   "RETURN",
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w700,
                                  //       color: Colors.white60),
                                  // ),
                                ],
                              )
                            : Text(
                                "RETURN",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(itemCount: 5,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   // physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context,index){
            //     return  Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: buildContainer(),
            //     );
            //   },),
            // )

            SizedBox(height: 10),
            tabWidget()!,
          ],
        ),
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        // backgroundColor: Constant.primaryColor,
        // shape: Border.all(color: Colors.black),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Flight Details",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                ),
                // SizedBox(
                //     height: 30,
                //     child: TabBar(
                //       controller: _tabController,
                //       physics: NeverScrollableScrollPhysics(),
                //       tabs: _tabs,
                //     )),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            bottomIndex = 1;
                            setState(() {
                              print(bottomIndex);
                              Navigator.pop(context);
                              buildShowModalBottomSheet(context);
                            });
                          },
                          child: Column(
                            children: [
                              Text("ON WARD",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              Container(
                                  height: 2,
                                  color: bottomIndex == 1
                                      ? Constant.primaryColor
                                      : Colors.white,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          8)
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            bottomIndex = 2;
                            setState(() {
                              print(bottomIndex);
                              Navigator.pop(context);
                              buildShowModalBottomSheet(context);
                            });
                          },
                          child: Column(
                            children: [
                              Text("RETURN",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              Container(
                                  height: 2,
                                  color: bottomIndex == 2
                                      ? Constant.primaryColor
                                      : Colors.white,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          8)
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                bottomTabWidget()!,
                // Expanded(
                //   child: SizedBox(
                //       // height: MediaQuery.of(context).size.height,
                //       height: MediaQuery.of(context).size.width+20,
                //       // height: double.infinity,
                //       child: Container(
                //         // color: Constant.primaryColor,
                //         child: TabBarView(
                //           controller: _tabController,
                //           // physics: NeverScrollableScrollPhysics(),
                //           children: _views,
                //         ),
                //       )),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "\u{20B9} 8460",
                //               style: TextStyle(fontWeight: FontWeight.bold),
                //             ),
                //             Text("FOR 1 ADULT"),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.pushNamed(
                //                 context, AppRoutes.BookTripPage);
                //           },
                //           child: Container(
                //             decoration: BoxDecoration(
                //                 color: Constant.primaryColor,
                //                 borderRadius: BorderRadius.circular(18),
                //                 border: Border.all(
                //                   color: Constant.primaryColor,
                //                 )),
                //             child: Center(
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 18),
                //                 child: Text(
                //                   "CONTINUE",
                //                   style: TextStyle(
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.w800),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          );
        });
  }

  Widget buildContainer(
      iconData, title, startTime, endTime, fare, totalTime, stop, width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: MediaQuery.of(context).size.width / 2,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          // border: Border.all(
          //   color: Constant.primaryColor,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(children: [
                    Icon(iconData),
                    SizedBox(width: 6),
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startTime,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    endTime,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\u{20B9} $fare",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    totalTime,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    stop,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text("          "),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget departWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: timeList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Card(
                    child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: buildContainer(
                      Icons.airplanemode_active_rounded,
                      titleList[index],
                      startTime[index],
                      endTime[index],
                      fareLIst[index],
                      timeList[index],
                      "Non Stop",
                      MediaQuery.of(context).size.width / 2),
                )),
              );
            },
          )
        ],
      ),
    );
  }

  Widget returnWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: timeList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: buildContainer(
                    Icons.airline_seat_flat,
                    titleList[index],
                    startTime[index],
                    endTime[index],
                    fareLIst[index],
                    timeList[index],
                    "Non Stop",
                    MediaQuery.of(context).size.width / 2),
              );
            },
          )
        ],
      ),
    );
  }

  Widget bottomReturnListWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Constant.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("DEL - IXC",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("Non stop | 55 mins | Economy"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.add_to_drive),
                        SizedBox(width: 4),
                        Text("Alliance Air|",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        Text(" 91831"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("19.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(
                              "Sun, 5 Jun 22",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("New Delhi",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            Text("Indira Gandhi",
                                style: TextStyle(fontSize: 14)),
                            Text("International Airport",
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("55 mins",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Icon(
                              Icons.lock_clock,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("19.55",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(
                              "Sun, 5 Jun 22",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text("Chandigarh",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            Text("Chandigarh Airport",
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Services",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("valid for your return journey",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Radio(
                                    activeColor: Constant.primaryColor,

                                    onChanged: (value) {}, groupValue: 1,
                                    value: 1,
                                    // value: FavoriteMethod.highPrice,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Alliance Super Saver",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text("Fare offered by airlines",
                                        style: TextStyle(fontSize: 12)),

                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.card_travel, size: 16),
                                        SizedBox(width: 10),
                                        Expanded(child: Text("Cabin bag")),
                                        Text("5 Kgs"),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.card_travel, size: 16),
                                        SizedBox(width: 10),
                                        Expanded(child: Text("Check in")),
                                        Text("15 Kgs"),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Icon(Icons.card_travel, size: 16),
                                    //     SizedBox(width: 10),
                                    // Expanded(child: Text("Cancellation")),
                                    // Text("Cancellation fee\nstarting 3675"),
                                    // ],
                                    // ),
                                    Row(
                                      children: [
                                        Text("Show more"),
                                        Icon(Icons.keyboard_arrow_down_outlined)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("\u{20B9} 3435",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomOnWardWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width + 94,
                child: Card(
                  elevation: 8,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Constant.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("IXC - DEL",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text("Non stop | 1 hr | Economy"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 3),
                        child: Row(
                          children: [
                            Icon(Icons.add_to_drive),
                            SizedBox(width: 4),
                            Text("Alliance Air|",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            Text(" 91832"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20.30",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text("Sat, 4 Jun 22",
                                    style: TextStyle(fontSize: 12)),
                                Text("Chandigarh",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("Chandigarh Airport",
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("1 hr",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                Icon(
                                  Icons.lock_clock,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("21.30",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text("Sat, 4 Jun 22",
                                    style: TextStyle(fontSize: 12)),
                                Text("New Delhi",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("Indira Gandhi",
                                    style: TextStyle(fontSize: 14)),
                                Text("International Airport",
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select Services",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("valid for your onward journey",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Radio(
                                        activeColor: Constant.primaryColor,

                                        onChanged: (value) {}, groupValue: 1,
                                        value: 1,
                                        // value: FavoriteMethod.highPrice,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Alliance Super Saver",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Text("Fare offered by airlines",
                                            style: TextStyle(fontSize: 12)),

                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.card_travel, size: 16),
                                            SizedBox(width: 10),
                                            Expanded(child: Text("Cabin bag")),
                                            Text("5 Kgs"),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.card_travel, size: 16),
                                            SizedBox(width: 10),
                                            Expanded(child: Text("Check in")),
                                            Text("15 Kgs"),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Icon(Icons.card_travel, size: 16),
                                        //     SizedBox(width: 10),
                                        // Expanded(child: Text("Cancellation")),
                                        // Text("Cancellation fee\nstarting 3675"),
                                        // ],
                                        // ),
                                        Row(
                                          children: [
                                            Text("Show more"),
                                            Icon(Icons
                                                .keyboard_arrow_down_outlined)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text("4552",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(width: 10)
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\u{20B9} 8460",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("FOR 1 ADULT"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.BookTripPage);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Constant.primaryColor,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Constant.primaryColor,
                            )),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
