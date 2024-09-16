import 'package:flutter/material.dart';
import 'package:vastu/screen/login_screen.dart';
import 'package:vastu/utils/appUtils.dart';

import '../constants/color_file.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValidEmail(String email) {
    // Regular expression for validating email addresses
    final emailRegExp =
    RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // Check if the email matches the regular expression
    return emailRegExp.hasMatch(email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: BoxDecoration(gradient: screenGradient()),
        padding: horizontalPadding(context),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorFile.darkReddishBrown.withOpacity(0.4)),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorFile.darkReddishBrown.withOpacity(0.4)),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: "Enter your email address",
                    labelText: "Email Address",
                    hintStyle: TextStyle(
                        color: ColorFile.darkReddishBrown.withOpacity(0.3)),
                    labelStyle: TextStyle(color: ColorFile.darkReddishBrown)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!isValidEmail(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                width: screenWidth(context) * 0.40,
                height: screenHeight(context) * 0.06,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: ColorFile.darkReddishBrown.withOpacity(0.9),
                          fontSize: 16),
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
