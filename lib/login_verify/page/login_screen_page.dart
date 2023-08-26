// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flights_app/login_verify/model/user_details_req.dart';
import 'package:flights_app/login_verify/service/auth.dart';
import 'package:flights_app/login_verify/service/localdb.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController(text: "");



  void checkUserLog() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser;
    if (user != null) {
      // Constant.name = (await LocalDataSaver.getName())!;
      // Constant.email = (await LocalDataSaver.getEmail())!;
      // Constant.img = (await LocalDataSaver.getImg())!;

      Navigator.pushNamed(context, AppRoutes.AccountPage);
      // Navigator.pushNamed(context, AppRoutes.AccountPage, arguments: Constant);
    } else {
      signInMethod(context);
    }
  }

  signInMethod(context) async {
    await signInWithGoogle();
    await fetchUserDetails();
    Navigator.pushNamed(context, AppRoutes.AccountPage);
  }

  phoneNoVerify(context) async {
    fetchOTP(phoneController.text.toString(), context);

    await Navigator.pushNamed(context, AppRoutes.VerifyPage);
  }

  String formattedDate = '20-07-2022';

  Future dateFormat() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
  }

  List<UserSaveDetailsRequest> userSaveDetailsRequestList = [];

  Future fetchUserDetails() async {
    http.Response response = await http.get(Uri.parse(
        "${NetworkUtil.saveLoginDetailsUrl}date=$formattedDate&email=${Constant.email}&name=${Constant.name}"));
    print("${NetworkUtil.saveLoginDetailsUrl} *********99*--**666****");
    if (response.statusCode == 200) {
      debugPrint("fetchUserDetails Status Code: ${response.statusCode}");
      debugPrint("fetchUserDetails Response Body: ${response.body}");

      List<dynamic> values = <dynamic>[];
      values = jsonDecode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            userSaveDetailsRequestList
                .add(UserSaveDetailsRequest.fromJson(map));
            userSaveDetailsRequestList;
            setState(() {});
          }
        }
      }
    }
  }

  @override
  void initState() {
    dateFormat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange.shade100,
      backgroundColor: Constant.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.orange.shade100,
            color: Constant.primaryColor,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // SizedBox(height: 120),
                  Image(
                      height: MediaQuery.of(context).size.width / 1.6,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      image: AssetImage("assets/images/flight.jpg")),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.CitySearchPage);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: appName,
                              style: TextStyle(
                                  color: Constant.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "  Login/Signup",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                )
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 16),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 30),
                        //   child: Container(
                        //       width: MediaQuery.of(context).size.width,
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(4),
                        //         // border: Border.all(color: Constant.primaryColor),
                        //         border: Border.all(color: Colors.black54),
                        //       ),
                        //       child: SignInButton(
                        //         Buttons.Google,
                        //         onPressed: () {
                        //           checkUserLog();
                        //           // signInMethod(context);
                        //           // signInWithGoogle();
                        //
                        //           // Navigator.pushNamed(context, AppRoutes.AccountPage);
                        //         },
                        //       )),
                        // ),
                        // SizedBox(height: 16),
                        // Text(
                        //   "Use Mobile No. to Login/Signup",
                        //   style: TextStyle(
                        //       color: Colors.black45,
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 13),
                        // ),
                        SizedBox(height: 46),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                              controller: phoneController,
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  hintText: 'Enter Mobile No.',
                                  helperMaxLines: 2,
                                  hintMaxLines: 2,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Constant.primaryColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constant.primaryColor))
                                  // border: InputBorder.none
                                  ),
                              validator: (String? value) {
                                return GetUtils.isLengthGreaterOrEqual(
                                        value!, 10)
                                    ? null
                                    : "Please Enter valid Mobile No.";
                              }),
                        ),
                        SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                LocalDataSaver.saveResendPhone(
                                    phoneController.text.toString());
                                Constant.resendPhone =
                                    (await LocalDataSaver.getResendPhone())!;

                                (Constant.phone == null ||
                                        Constant.phone == "" ||
                                        Constant.phone == "null")
                                    ? phoneNoVerify(context)
                                    : Navigator.pushNamed(
                                        context, AppRoutes.WelcomeAboardPage);
                              }
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Center(child: Text("Continue"))),
                          ),
                        ),
                        SizedBox(height: 140),
                        // Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.RewardScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Have a ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Referral Code?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Constant.primaryColor,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 28),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: RichText(
                      text: TextSpan(
                        text: "By proceeding, you agree to $appName's ",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Privacy Policy User Agreement T&Cs ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          ),
                          TextSpan(
                            text: "as well as Mobile Connect's ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.normal),
                          ),
                          TextSpan(
                            text: "T&Cs",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
