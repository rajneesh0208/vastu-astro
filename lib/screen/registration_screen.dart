import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/color_file.dart';
import '../utils/appUtils.dart';
import 'dashboard_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNController = TextEditingController();
  var lNController = TextEditingController();
  var mobileController = TextEditingController();
  var dob = TextEditingController();
  final RegExp _mobileNumberPattern = RegExp(r'^[6-9]\d{9}$');

  String genderNameText = "Gender";
  int genNumber = 0;
  String dobText = "Date of Birth";
  String dayOB = '', moB = '', yoB = '';

  final _formKey = GlobalKey<FormState>();

  bool isMobileNumberValid(String input) {
    return _mobileNumberPattern.hasMatch(input);
  }

  bool visibilityBool = true;

  bool isValidEmail(String email) {
    // Regular expression for validating email addresses
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // Check if the email matches the regular expression
    return emailRegExp.hasMatch(email);
  }

  bool isValidMobileNumber(String value) {
    // Check if the value is exactly 10 digits and contains only numbers
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  bool isValidate() {
    // Mobile number validation pattern (starts with 6-9 and has 10 digits)
    String mobilePattern = r'^[6-9]\d{9}$';
    RegExp mobileRegExp = RegExp(mobilePattern);

    // Email validation pattern
    String emailPattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp emailRegExp = RegExp(emailPattern);

    // Check if the entered value is a valid email
    if (emailController.text.isEmpty) {
      displayToast("Please Enter your Email Address");
      return false;
    } else if (!emailRegExp.hasMatch(emailController.text)) {
      displayToast("Invalid Email Address");
      return false;
    }

    // Check if the entered value is a valid mobile number
    if (mobileController.text.isEmpty) {
      displayToast("Enter your Mobile Number");
      return false;
    } else if (!mobileRegExp.hasMatch(mobileController.text)) {
      displayToast(
          "Please provide valid Mobile Number,Mobile Number should be start from 5 to 9");
      return false;
    }

    return true;
  }

  displayToast(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        fontSize: 14,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: ColorFile.darkReddishBrown,
        timeInSecForIosWeb: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(gradient: screenGradient()),
        padding: horizontalPadding(context),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: widgetPadding(context),
              ),
              Text(
                "Vastu-Astro ",
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
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Enter your email address",
                            labelText: "Email Address",
                            hintStyle: TextStyle(
                                color: ColorFile.darkReddishBrown
                                    .withOpacity(0.3)),
                            labelStyle:
                                TextStyle(color: ColorFile.darkReddishBrown)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: widgetPadding(context),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: fNController,
                        decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Enter your first name",
                            labelText: "First Name",
                            hintStyle: TextStyle(
                                color: ColorFile.darkReddishBrown
                                    .withOpacity(0.3)),
                            labelStyle:
                                TextStyle(color: ColorFile.darkReddishBrown)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: widgetPadding(context),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: lNController,
                        decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Enter your last name",
                            labelText: "Last Name",
                            hintStyle: TextStyle(
                                color: ColorFile.darkReddishBrown
                                    .withOpacity(0.3)),
                            labelStyle:
                                TextStyle(color: ColorFile.darkReddishBrown)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                        },
                      ),

                      SizedBox(
                        height: widgetPadding(context),
                      ),

                      dobWidget(),

                      SizedBox(
                        height: widgetPadding(context),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: mobileController,
                        maxLength: 10,
                        decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Enter your mobile number",
                            labelText: "Mobile Number",
                            hintStyle: TextStyle(
                                color: ColorFile.darkReddishBrown
                                    .withOpacity(0.3)),
                            labelStyle:
                                TextStyle(color: ColorFile.darkReddishBrown)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: widgetPadding(context),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: visibilityBool,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            // Adjust padding
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorFile.darkReddishBrown
                                      .withOpacity(0.4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "**********",
                            labelText: "Password",
                            hintStyle: TextStyle(
                                color: ColorFile.darkReddishBrown
                                    .withOpacity(0.3)),
                            labelStyle:
                                TextStyle(color: ColorFile.darkReddishBrown),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password ';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: widgetPadding(context),
              ),
              GestureDetector(
                onTap: () {
                  if (isValidate()) {}
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate() &&
                      dayOB.isNotEmpty &&
                      isValidate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashBoardScreen()));
                  }
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
        ),
      )),
    );
  }

  Widget dobWidget() {
    return InkWell(
      onTap: () {
        pickDate(
          context,
        );
      },
      child: Container(
        width: screenWidth(context),
        // margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth(context) * 0.04),
            border:
                Border.all(color: ColorFile.darkReddishBrown.withOpacity(0.4))),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          dobText,
          style: TextStyle(
            fontSize: 18,
            color: ColorFile.darkReddishBrown,
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorFile.darkReddishBrown.withOpacity(0.4),
              onPrimary: Colors.white, // header text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: ColorFile.darkReddishBrown),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
    // if (dateTime == null) return;
    if (dateTime != null) {
      setState(() {
        DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
        dobText = formattedDate(date);
        yoB = dateTime.year.toString();
        moB = dateTime.month.toString();
        dayOB = dateTime.day.toString();
      });
    }
    return dateTime;
  }
}
