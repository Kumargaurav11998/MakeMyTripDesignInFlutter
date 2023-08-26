// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flights_app/shared/constant.dart';
import 'package:flutter/material.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Constant.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back_rounded,
                                      color: Colors.white)),
                              Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.share,
                                  size: 16,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "#RewardYoungMinds",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          CircleAvatar(
                            radius: 90,
                              backgroundImage: AssetImage("assets/images/flogo.jpg")),
                          SizedBox(height: 20),
                          Text(
                            "Refer a fellow student and share a special flight discount of up to \u{20B9}1500 with them.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 60),
                            Row(
                              children: [
                                SizedBox(width: 8),
                                Text(
                                  "How it Works",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildRow(
                                      Icons.share,
                                      "Share your referral link",
                                      "Send a discount lik to yur fellow student who have not booked with our Special Student Fare."),
                                  SizedBox(height: 20),
                                  buildRow(
                                      Icons.local_offer,
                                      "They book a flight",
                                      "They must use the link you shared to avail the discount and book a flight."),
                                  SizedBox(height: 20),
                                  buildRow(
                                      Icons.account_balance_wallet,
                                      "You receive referral credit",
                                      "Within 24 hours of them completing their travel, you will get \u{20B9}300 MyCash in your wallet. You can use this for your next flight booking."),
                                  SizedBox(height: 20),
                                  Text(
                                    "Important Things to Know",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10),
                                  knowRow(
                                      "You ca refer an unlimited numbers of friends."),
                                  SizedBox(height: 10),
                                  knowRow(
                                      "You will only be rewarded for the last 5 referrals every month."),
                                  SizedBox(height: 10),
                                  knowRow(
                                      "Once your friend clicks on the link, the discount will get added to their $appName account and they will be abl to use it within the next 3 months."),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "VIEW FULL TERMS AND CONDITIONS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Constant.primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 1,
                          right: 10,
                          left: 10,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: Constant.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: Colors.black,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Center(
                                            child: Text(
                                          "\u{20B9}",
                                          style: TextStyle(fontSize: 14),
                                        )),
                                      )),
                                  SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      text: "Earn MyCash up to ",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "\u{20B9}1500",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Constant.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " every month!",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 62)
                ],
              ),
            ),
            Positioned(
                bottom: 24,
                right: 12,
                left: 12,
                child: Card(
                  color: Constant.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        "GENERATE YOUR REFERRAL LINK",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget knowRow(title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(360),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(title),
        )
      ],
    );
  }

  Widget buildRow(icon, title, description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Constant.primaryColor,
              borderRadius: BorderRadius.circular(360),
              border: Border.all(
                color: Constant.primaryColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                description,
                softWrap: true,
                maxLines: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
