// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flights_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Constant.primaryColor,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: Text(
                          "Travel Insurance | Buy Online With COVID-19 Covered For Ov...",
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: Icon(Icons.ac_unit_outlined, size: 50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: Icon(
                            Icons.view_headline,
                            size: 40,
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    child: Text(
                      "Secure Your Travel With Our Travel Insurance Plan!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text("Curated Plans to suit your needs"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage("assets/images/flight.jpg")),
                  ),
                  Row(
                    children: [
                      Text("Travelling To"),
                      Text("Multiple Countries")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Trip Start Date"),
                              Icon(Icons.airplanemode_active_rounded)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/3,
                                child: buildStack(),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Trip End Date"),
                              Icon(Icons.airplanemode_active_rounded),
                            ],
                          ),
                          Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      buildStack();
                                    },
                                    child: Icon(Icons.calendar_today_outlined))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      children: <Widget>[
        DateTimePicker(
          initialValue: '',
          dateMask: 'd MMM, yyyy',
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
          // dateLabelText: 'mmm dd,yyyy',
          onChanged: (val) => print(val),
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        )
      ],
    );
  }
}
