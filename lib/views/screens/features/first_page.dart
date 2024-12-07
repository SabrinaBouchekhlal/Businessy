import 'package:businessy/views/screens/features/welcome_page.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  // Declare the opacity values to animate the text
  double logoOpacity = 0.0;
  double textOpacity1 = 0.0;
  double textOpacity2 = 0.0;
  double textOpacity3 = 0.0;

  @override
  void initState() {
    super.initState();

    // Delay for logo and text animations
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        logoOpacity = 1.0; // Make the logo visible
      });
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        textOpacity1 = 1.0; // Make the "Manage" text visible
      });
    });

    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        textOpacity2 = 1.0; // Make the "Grow" text visible
      });
    });

    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        textOpacity3 = 1.0; // Make the "Succeed" text visible
      });
    });

    // Navigate to the next screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with fade-in effect
            AnimatedOpacity(
              opacity: logoOpacity,
              duration: const Duration(milliseconds: 1000),
              child: Image.asset(
                'assets/img/logo-white.png',
                height: 59, // Set height
                width: 219, // Set width
                fit: BoxFit.contain, // Maintain aspect ratio
              ),
            ),

            // Row for "Manage", "Grow", and "Succeed" text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // "Manage" text with fall-down animation
                AnimatedOpacity(
                  opacity: textOpacity1,
                  duration: const Duration(milliseconds: 500),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      '"Manage,',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                // "Grow" text with fall-down animation
                AnimatedOpacity(
                  opacity: textOpacity2,
                  duration: const Duration(milliseconds: 500),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ' Grow,',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), // Space between "Grow" and "Succeed"
                // "Succeed" text with fall-down animation
                AnimatedOpacity(
                  opacity: textOpacity3,
                  duration: const Duration(milliseconds: 500),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ' Succeed"',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
