// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flights_app/login_verify/model/user_details_req.dart';
import 'package:flights_app/login_verify/service/auth.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController otpController = TextEditingController(text: "123456");
  final _formKey = GlobalKey<FormState>();
  String formattedDate = '';

  Future verifyOtp() async {
    verifyOTP(otpController.text.toString(), context);
    await fetchUserDetails();
    // await Navigator.pushReplacementNamed(context, AppRoutes.WelcomeAboardPage);
  }

  Future dateFormat() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
  }

  List<UserSaveDetailsRequest> userSaveDetailsRequestList = [];

  Future fetchUserDetails() async {
    http.Response response = await http.get(Uri.parse(
        "${NetworkUtil.saveLoginDetailsUrl}mobile=${Constant.phone}&date=$formattedDate"));

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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_outlined,
                            color: Colors.grey[700])),
                     GestureDetector( onTap: () {
                       Navigator.pushReplacementNamed(context, AppRoutes.WelcomeAboardPage);
                     }, child:  Text(
                      "SKIP",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),)
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Verify your Mobile Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "OTP has been sent to MOBILE",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30),
                TextFormField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.close),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Enter OTP',
                        labelText: "Enter OTP",
                        labelStyle: TextStyle(color: Constant.primaryColor),
                        helperMaxLines: 2,
                        hintMaxLines: 2,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1, color: Constant.primaryColor)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constant.primaryColor))
                        // border: InputBorder.none
                        ),
                    validator: (String? value) {
                      return GetUtils.isLengthGreaterOrEqual(value!, 6)
                          ? null
                          : "Please Enter an OTP";
                    }),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("12s", textAlign: TextAlign.end)],
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            fetchOTP(Constant.resendPhone,context);
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(color: Constant.primaryColor,fontSize: 18),
                          )),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              verifyOtp();
                              // fetchOTP(context,context);
                              // verifyOTP(otpController.text.toString(), context);
                              // Navigator.pushNamed(
                              //     context, AppRoutes.WelcomeAboardPage);
                            }
                          },
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(color: Constant.primaryColor,fontSize: 18),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                    "By pressing this, I agree to receiving critical messages such as OTP booking details on WhatsApp"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
