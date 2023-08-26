// ignore_for_file: constant_identifier_names

import 'package:flights_app/login_verify/page/login_screen_page.dart';
import 'package:flights_app/page/book_trip_page.dart';
import 'package:flights_app/page/insurance_page.dart';
import 'package:flights_app/page/offer_page.dart';
import 'package:flights_app/page/search_one_way_details_page.dart';
import 'package:flights_app/page/search_round_trip_details_page.dart';
import 'package:flights_app/page/search_flight_page.dart';
import 'package:flights_app/screens/account_page.dart';
import 'package:flights_app/screens/reward_screen.dart';
import 'package:flights_app/login_verify/page/verify_page.dart';
import 'package:flights_app/screens/welcome_aboard_page.dart';
import 'package:flights_app/shared/splash_page.dart';
import 'package:flights_app/widget/city_search.dart';
import 'package:flutter/material.dart';

import '../page/flight_details.dart';

class AppRoutes {
  static const String SplashPage = "Splash Page";
  static const String LoginScreenPage = "Login Screen Page";
  static const String VerifyPage = "Verify Page";
  static const String WelcomeAboardPage = "Welcome Aboard Page";
  static const String SearchFlightPage = "Search Flight Page";
  static const String OfferPage = "Offer Page";
  static const String AccountPage = "Account Page";
  static const String SearchRoundTripDetailsPage = "Search Flight Details Page";
  static const String SearchOneWayDetailsPage = "Search One Way Details Page";
  static const String BookTripPage = "Book Trip Page";
  static const String InsurancePage = "Insurance Page";
  static const String RewardScreen = "Reward Screen";
  static const String CitySearchPage = "CitySearchPage";
  static const String FlightDetails = "FlightDetails";
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.SplashPage: (context) => const SplashPage(),
  AppRoutes.LoginScreenPage: (context) => const LoginScreenPage(),
  AppRoutes.VerifyPage: (context) => const VerifyPage(),
  AppRoutes.WelcomeAboardPage: (context) => const WelcomeAboardPage(),
  AppRoutes.SearchFlightPage: (context) => const SearchFlightPage(),
  AppRoutes.OfferPage: (context) => const OfferPage(),
  AppRoutes.AccountPage: (context) => const AccountPage(),
  AppRoutes.SearchRoundTripDetailsPage: (context) => const SearchRoundTripDetailsPage(),
  AppRoutes.SearchOneWayDetailsPage: (context) => const SearchOneWayDetailsPage(),
  AppRoutes.BookTripPage: (context) => const BookTripPage(),
  AppRoutes.InsurancePage: (context) => const InsurancePage(),
  AppRoutes.RewardScreen: (context) => const RewardScreen(),
  AppRoutes.CitySearchPage: (context) => const CitySearchPage(),
  AppRoutes.FlightDetails: (context) => const FlightDetails(),
};
