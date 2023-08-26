// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flights_app/login_verify/page/login_screen_page.dart';
import 'package:flights_app/login_verify/service/auth.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  signOutMethod(context) async {
    await signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreenPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My Personal Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Constant.primaryColor,
                    radius: 30,
                    // backgroundImage: (Constant.img != null ||
                    //         Constant.img != "")
                    //     ? NetworkImage(Constant.img)
                    //     : NetworkImage(
                    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV5U3OaHjf9fC7FRBIRqKyVP-OkTS9BFtusQ&usqp=CAU"),
                    child: (Constant.name != null || Constant.name != "")
                        ? Text(
                            Constant.name.characters.first,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white),
                          )
                        : Text(
                            "K",
                            style: TextStyle(
                                fontWeight:FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white),
                          ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (Constant.name != null || Constant.name != '')
                          ? Text(Constant.name,
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Text(appName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: Colors.grey[400],
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          (Constant.phone == null ||
                                  Constant.phone == '' ||
                                  Constant.phone == 'null')
                              ? Text("+91 XXXXXXXXXX",
                                  style: TextStyle(color: Colors.grey[400]))
                              : Text("+91 ${Constant.phone}",
                                  style: TextStyle(color: Colors.grey[400]))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please complete your profile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                                "Share your email address to receive booking related communication & offers"),
                            SizedBox(height: 8),
                            Text("+ Add Email ID",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Constant.primaryColor))
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularPercentIndicator(
                                radius: 32,
                                lineWidth: 8,
                                animation: true,
                                percent: 0.25,
                                // circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Constant.primaryColor,
                                backgroundColor: Colors.grey,
                                center: Text(
                                  "25%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                // footer: new Text(
                                //   "Sales this week",
                                //   style:
                                //   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                              ),
                            ),
                          ),
                          // circularStrokeCap: CircularStrokeCap.round,

                          Text("Complete",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Constant.dividerColor),
            ListTile(
              leading: Icon(Icons.trip_origin),
              title: Text("My Trips"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border_outlined),
              title: Text("Wishlist"),
              subtitle: Text("Check your saved properties & destination here"),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("My Wallet"),
            ),
            Divider(color: Constant.dividerColor),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Reset Password"),
            ),
            GestureDetector(
              onTap: () {
                signOutMethod(context);
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
