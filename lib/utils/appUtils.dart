import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color_file.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
EdgeInsetsGeometry horizontalPadding(context){
  return EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05);
}
double widgetPadding(context){
  return screenHeight(context) * 0.02;
}

String formattedDate(DateTime date) {
  return DateFormat('dd-MMMM-yyyy').format(date);
}
LinearGradient screenGradient(){
  return LinearGradient(colors: [
    ColorFile.seaformGreen,
    ColorFile.lightBlue
  ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
  );
}
LinearGradient dashGradient(){
  return LinearGradient(colors: [
    ColorFile.seaformGreen,
    ColorFile.lightBlue
  ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight
  );
}

bool isValidEmail(String email) {
  // Regular expression for validating email addresses
  final emailRegExp =
  RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Check if the email matches the regular expression
  return emailRegExp.hasMatch(email);
}