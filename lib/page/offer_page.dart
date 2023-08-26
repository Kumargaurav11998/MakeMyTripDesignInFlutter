// ignore_for_file: prefer_const_constructors

import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  List offerList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeTqD9f71UlJRpkaIGOqGGKlu29viXhemMQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaIzF7ZkRoGIkoKKI0Bt4gFZWqGv-g8Eseg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeTqD9f71UlJRpkaIGOqGGKlu29viXhemMQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaIzF7ZkRoGIkoKKI0Bt4gFZWqGv-g8Eseg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeTqD9f71UlJRpkaIGOqGGKlu29viXhemMQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaIzF7ZkRoGIkoKKI0Bt4gFZWqGv-g8Eseg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeTqD9f71UlJRpkaIGOqGGKlu29viXhemMQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaIzF7ZkRoGIkoKKI0Bt4gFZWqGv-g8Eseg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjD-dtycubpgyCZq_hXJQtN72es6diAXsWaA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeTqD9f71UlJRpkaIGOqGGKlu29viXhemMQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaIzF7ZkRoGIkoKKI0Bt4gFZWqGv-g8Eseg&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.primaryColor,
        title: Text("Offer"),
        actions: const [Icon(Icons.share), SizedBox(width: 14)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: offerList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.InsurancePage);
                    },
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 1.5,
                      image: NetworkImage(offerList[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
