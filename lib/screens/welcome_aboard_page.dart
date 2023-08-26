// ignore_for_file: prefer_const_constructors

import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeAboardPage extends StatefulWidget {
  const WelcomeAboardPage({Key? key}) : super(key: key);

  @override
  State<WelcomeAboardPage> createState() => _WelcomeAboardPageState();
}

class _WelcomeAboardPageState extends State<WelcomeAboardPage> {
  TextEditingController nameController = TextEditingController(text: "MCS  ");
  final _formKey = GlobalKey<FormState>();

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
                    GestureDetector(onTap: (){
                      setState(() {
                        Constant.phone='';
                        Navigator.pushReplacementNamed(context, AppRoutes.LoginScreenPage);
                      });
                    },
                      child: Text(
                        "SKIP",
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome Aboard!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Complete your profile to make your booking faster",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30),
                TextFormField(
                    controller: nameController,                                keyboardType: TextInputType.name,

                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Full Name',
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Constant.primaryColor),
                        helperMaxLines: 2,
                        hintMaxLines: 2,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1, color: Constant.primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Constant.primaryColor))
                        // border: InputBorder.none
                        ),
                    validator: (String? value) {
                      return GetUtils.isLengthGreaterOrEqual(value!,4)
                          ? null
                          : "Please Enter Name";
                    }),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child:  GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, AppRoutes.SearchFlightPage);
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
                        child: Center(child: Text("Save"))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
