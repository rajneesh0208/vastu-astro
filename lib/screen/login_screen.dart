import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vastu/screen/dashboard_screen.dart';

import '../constants/color_file.dart';
import '../utils/appUtils.dart';
import 'forgot_screen.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool visibilityBool = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(gradient: screenGradient()),
        padding: horizontalPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vastu-Astro",
              style: TextStyle(
                color: ColorFile.darkReddishBrown,
                fontSize: screenWidth(context) * 0.08,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
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
            TextFormField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              obscureText: visibilityBool,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  // Adjust padding
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
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorFile.darkReddishBrown.withOpacity(0.4)),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorFile.darkReddishBrown.withOpacity(0.4)),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: "**********",
                  labelText: "Password",
                  hintStyle: TextStyle(
                      color: ColorFile.darkReddishBrown.withOpacity(0.3)),
                  labelStyle: TextStyle(color: ColorFile.darkReddishBrown),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        visibilityBool = !visibilityBool;
                      });
                    },
                    icon: visibilityBool
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  )),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // If the form is valid, perform the action
                  print('Valid email: ${emailController.text}');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoardScreen()));
                } else {
                  // If the form is invalid, show a Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid email address'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const DashBoardScreen()));
              },
              child: Container(
                width: screenWidth(context) * 0.40,
                height: screenHeight(context) * 0.06,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  "LogIn",
                  style: TextStyle(
                      color: ColorFile.darkReddishBrown.withOpacity(0.9),
                      fontSize: 16),
                )),
              ),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
            const Text(
              "Doesn't have account yet ? ",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: widgetPadding(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()));
              },
              child: Container(
                width: screenWidth(context) * 0.40,
                height: screenHeight(context) * 0.06,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  "Register",
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
