// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flights_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Provider/add_Traveler_Provider.dart';

class BookTripPage extends StatefulWidget {
  const BookTripPage({Key? key}) : super(key: key);

  @override
  State<BookTripPage> createState() => _BookTripPageState();
}

class _BookTripPageState extends State<BookTripPage> {
  bool gender_Male = true;
  _showModalBottomSheet(index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.05,
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: DefaultTabController(
            length: 2,
            initialIndex: index,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Constant.primaryColor,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.red,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          Text("Baggage Policy",
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          Text(
                            "Cancel Policy",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                title: Center(
                    child: Text(
                  'Policies',
                  style: TextStyle(),
                )),
                automaticallyImplyLeading: false,
              ),
              body: TabBarView(
                children: [
                  Text("Baggage policy "),
                  Text("Cancel policy"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //  Add new Adult

  _AddNewAdult(index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final provider = Provider.of<Add_Travelar_Provider>(context);
        return Container(
          height: MediaQuery.of(context).size.height / 1.05,
          width: double.infinity,
          color: Colors.white,
          child: Scaffold(

              body: SingleChildScrollView(
                child: Column(children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        GestureDetector( onTap: () {
                          Navigator.pop(context);
                        },child: Icon(Icons.clear)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Add Traveler",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        )
                      ]),
                    ),
                  ),

                  // important message
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Constant.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Important : ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                              TextSpan(
                                  text:
                                      "Enter your name as it mentioned on your passport. For International Travel. Passport should  be valid for minimum 6 months for date of travel.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                  ))
                            ])),
                      ),
                    ),
                  ),

                  // Gender text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        "Gender : ",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
// Gender select card

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            provider.male_Click();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Card(
                              color: provider.Gender_MAle == true
                                  ? Constant.primaryColor
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Male",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            provider.female_Click();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Card(
                              color: provider.Gender_MAle == false
                                  ? Constant.primaryColor
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Female",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  // first and second name

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(decoration: InputDecoration( hintText: 'Enter First & Middle Name',     focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Constant.primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constant.primaryColor))),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(decoration: InputDecoration( hintText: 'Enter last Name',     focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Constant.primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constant.primaryColor))),),
                  ),
// wheel chair drop down
                  Padding(
                    padding: const EdgeInsets.all(8.0),


                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color:Colors.white, //background color of dropdown button
                              border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                              borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button

                          ),
child:  Padding(
  padding: const EdgeInsets.all(5.0),
  child:   DropdownButton(
    //  value: selectedValue,
dropdownColor: Constant.primaryColor,

      underline: Container(),
      hint: Text("WheelChair"),
      isExpanded: true,
      items: [

          DropdownMenuItem(

            child: Text("Wheelchair Required"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Wheelchair Not  Required"),
            value: 2,
          ),
      ],
      onChanged: (value) {
          setState(() {
            // selectedValue = value;
            // selectedValue = value;
          });
      }),
),

                      )
                    ),


                  // confirm  button

                ]),
              ), bottomSheet: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(decoration: BoxDecoration( color:Constant.primaryColor, //background color of dropdown button
            //border of dropdown button
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,

          ),

          child: SizedBox( width: MediaQuery.of(context).size.width -0, child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Text("Confirm",style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w600,color: Colors.white), textAlign: TextAlign.center),
          )),),
              )),
        );
      },
    );
  }

  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 4),
                    Column(
                      children: [
                        Text(
                          "Trip To",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Mombasa",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              detailDepartContainer(Icons.add_to_drive, "NBO-DEL", "Sat,4 Jun",
                  "20.30-21.30", "1h", "ALLIANCE SUPER SAVER", "Non Stop"),
              Divider(
                color: Colors.white,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Constant.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Text("VIEW FLIGHT DETAILS"),
                    ),
                  ),
                ),
              ),

              // Baggagw details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showModalBottomSheet(0);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Baggage Policy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19)),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.black)
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Icon(Icons.shopping_bag_outlined,
                                        color: Colors.black, size: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Icon(Icons.shopping_bag_outlined,
                                        color: Colors.black, size: 18),
                                  ),
                                ]),
                            SizedBox(
                              width: 10,
                              height: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text("Cabin Bag"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text("Check-in bag"),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text("5 Kgs(1 piece only)"),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text("5 Kgs(1 piece only)"),
                                )
                              ],
                            ),
                            SizedBox(width: 30)
                          ],
                        ),
                        Container(
                          color: Colors.black12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Icon(
                                  Icons.leave_bags_at_home,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Secure your baggage at just  KSH 500 ",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Text(
                                      "Claim upto KSH 32000",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: () => {}, child: Text("+ Add"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //Cancelattion and  refund policy

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showModalBottomSheet(1);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cancellation Refund  Policy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19)),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.black)
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cancel Between (IST):",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              Text(
                                "Cancellation Penalty",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                // Controls visual overflow

                                // Controls how the text should be aligned horizontally

                                // Control the text direction

                                // Whether the text should break at soft line breaks

                                // Maximum number of lines for the text to span

                                // The number of font pixels for each logical pixel

                                text: TextSpan(
                                  text: 'Now -28 Sep, ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: '20:15',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "KSH 5000",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                // Controls visual overflow

                                // Controls how the text should be aligned horizontally

                                // Control the text direction

                                // Whether the text should break at soft line breaks

                                // Maximum number of lines for the text to span

                                // The number of font pixels for each logical pixel

                                text: TextSpan(
                                  text: '28 Sep. ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: '20:15',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(text: "  -  "),
                                    TextSpan(
                                      text: '28 Sep. ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: '20:15',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "KSH 5000",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.pinkAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.white60,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 5, 0),
                                child: Text(
                                  "The time is mention above is in Indian Standerd Time (IST)",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white60),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Continue and move
                      ],
                    ),
                  ),
                ),
              ),
//Doneta

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Expanded(
                                child: Text(
                              "Donete KSH 500 to support responsible tousiism initiatives ",
                              style: TextStyle(fontSize: 12),
                            )),
                            Text("T&Cs")
                          ],
                        ),
                        SizedBox(height: 5),

                        Container(
                          color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white60,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(3, 10, 5, 5),
                                  child: Text(
                                    "Support Community empowerment and preservation of heritage",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white60),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Continue and move
                      ],
                    ),
                  ),
                ),
              ),
// Book now and pay latter
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.credit_card, color:Colors.white),
                            Expanded(
                                child: Text(
                                  "Book Now And Pay Later",
                                  style: TextStyle(fontSize: 18 ,color:Colors.white),
                                  textAlign: TextAlign.center,
                                )),

                          ],
                        ),
                        Text("Book your flight today and pay back later !", style: TextStyle(fontSize: 13 ,color:Colors.white),
                          textAlign: TextAlign.center,),
                        SizedBox(height: 10),

                        TextFormField(decoration:
                        InputDecoration( hintText: 'Enter your mobile number', hintStyle: TextStyle(color: Colors.white),    focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white))),),
                        SizedBox(height: 10),
                        GestureDetector(

                            child:
                        Align(alignment: Alignment.centerRight,

                          child: Container(

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Check Eligibility",style: TextStyle( fontSize: 18),),
                              )),))

                        // Continue and move
                      ],
                    ),
                  ),
                ),
              ),
// Traverller Details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Traveler Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 19),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.person_rounded, color: Colors.black),
                            Text("ADULT (12 yrs+)", style: TextStyle()),
                            Text("(1/1)", style: TextStyle()),
                          ],
                        ),
                        SizedBox(height: 15),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text(
                                  "Kumar Gaurav",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.edit)
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          child: Text(
                            "+ Add New Adult",
                          ),
                          onPressed: () {
                            _AddNewAdult("k");
                          },
                        ),
                        Divider(
                          height: 5,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Booking Details Will be sent to ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.email),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "gauravojha085@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.message),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "+254745489179",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        )
                        // Continue and move
                      ],
                    ),
                  ),
                ),
              ),

              //Term and  condition
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              // Controls visual overflow
                              overflow: TextOverflow.clip,

                              // Controls how the text should be aligned horizontally
                              textAlign: TextAlign.start,

                              // Control the text direction

                              // Whether the text should break at soft line breaks
                              softWrap: true,

                              // Maximum number of lines for the text to span

                              // The number of font pixels for each logical pixel
                              textScaleFactor: 1,
                              text: TextSpan(
                                text:
                                    'By clicking on the Continue button below to proceed with the booking, I confirm that I have read and I accept the   ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'Fare Rules ',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 13)),
                                  TextSpan(
                                      text: ' ,the ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: 'Privacy Policy  ',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 13)),
                                  TextSpan(
                                      text: ' , the',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: ' , User Agreement',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 13)),
                                  TextSpan(
                                      text: ' , and ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  TextSpan(
                                      text: ' , Terms of Service  ',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 13)),
                                  TextSpan(
                                      text: ' , Flight App   ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ],
                              ),
                            )),

                        // Continue and move
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // Cancelation And refund policy
      bottomNavigationBar: amountAndContinue("500"),
    );
  }

  Widget detailDepartContainer(
      iconData, title, returnD, date, time, economy, stop) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(iconData, color: Colors.black),
          ))),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DEPART $title",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text("$returnD| $date| $time| $stop",
                  style: TextStyle(color: Colors.black, fontSize: 14)),
              Text("Economy > $economy",
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget detailReturnContainer(
      iconData, title, returnD, date, time, economy, stop) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(iconData, color: Colors.black),
          ))),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Return $title",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              Text("$returnD| $date| $time| $stop",
                  style: TextStyle(color: Colors.black, fontSize: 14)),
              Text("Economy > $economy",
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}

Widget amountAndContinue(amount) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child:
            (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: GestureDetector(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("KSH 50000",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                )),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: GestureDetector(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Continue",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(3),
                ),
              )),
        ])),
      ));
}

// amount amount cantinute button
