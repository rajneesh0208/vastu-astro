import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vastu/screen/login_screen.dart';
import 'package:vastu/utils/appUtils.dart';

import '../constants/color_file.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> types = [
    "Vedic",
    "Vastu",
    "Prashana",
    "Numerology",
    "Palm reading"
  ];

  var availableDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ColorFile.lightBlue,
      //   leading: Text("Hello, User"),
      // ),
      body: SafeArea(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: screenHeight(context) * 0.2,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.05),
                decoration: BoxDecoration(color: ColorFile.deepPeriwinkle),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Hello, ', // Base text
                          style: TextStyle(
                            fontSize: 18, // Font size for base text
                            color: Colors.white70, // Base text color
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Demo User', // First styled text
                              style: TextStyle(
                                  color: Colors.white, // Color of "World"
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20 // Bold style
                                  ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                                size: 20,
                              )))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150,
                child: Container(
                  height: screenHeight(context) * 0.8,
                  width: screenWidth(context),
                  padding:
                      EdgeInsets.only(bottom: screenHeight(context) * 0.04),
                  decoration: BoxDecoration(
                      // gradient: screenGradient(),
                      color: ColorFile.softItalic,
                      borderRadius: BorderRadius.circular(25)),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, item) {
                      return Container(
                        height: screenHeight(context) * 0.28,
                          margin: EdgeInsets.only(
                            top: screenHeight(context) * 0.02,
                            left: screenHeight(context) * 0.02,
                            right: screenHeight(context) * 0.02,
                          ),
                          child: astroProfile());
                    },
                    itemCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget astroProfile() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context) * 0.42,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: ColorFile.seaformGreen,
                        borderRadius: BorderRadius.circular(25)),
                    // width:screenWidth(context) * 0.4,
                    height: screenHeight(context) * 0.20,
                    child: Stack(
                      children: [
                        Image.asset(
                          "asset/image/vastu_shikhar.png",
                        ),
                        Positioned(
                            right: 10,
                            top: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "4.2",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  )
                                ],
                              ),
                            ))
                      ],
                    )),
                SizedBox(
                  height: screenHeight(context) * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    callWidget(ColorFile.seaformGreen, Icons.call, "Call"),
                    callWidget(
                        ColorFile.darkReddishBrown, Icons.message, "Chat"),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: screenWidth(context) * 0.42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * 0.04,
                vertical: screenWidth(context) * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: screenWidth(context) * 0.4,
                    child: Text(
                      "Vastu Shikhar",
                      style: TextStyle(
                          color: ColorFile.darkReddishBrown,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: screenHeight(context) * 0.015,
                ),
                Container(
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: ColorFile.softItalic.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Wrap(
                      children: types
                          .map((e) => Container(
                                margin: EdgeInsets.only(
                                    top: screenWidth(context) * 0.01,
                                    left: screenWidth(context) * 0.01,
                                    bottom: screenWidth(context) * 0.01),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(context) * 0.02,
                                    vertical: screenWidth(context) * 0.01),
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(
                                //         screenWidth(context) * 0.05),
                                //     color: ColorFile.lightBlue.withOpacity(0.4)),
                                child: Text(
                                  "* $e",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorFile.darkReddishBrown
                                          .withOpacity(0.5)),
                                ),
                              ))
                          .toList()),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.015,
                ),
                Row(
                  children: List.generate(6, (index) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? ColorFile.seaformGreen
                              : ColorFile.seaformGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            availableDays[index][0], // Display first letter
                            style: TextStyle(
                                color:
                                    index % 2 == 0 ? Colors.white : Colors.red,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  }),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }

  callWidget(Color seaformGreen, IconData call, String text) {
    return Container(
      decoration: BoxDecoration(
          color: seaformGreen, borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.02,
          vertical: screenHeight(context) * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              call,
              color: Colors.white70,
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
