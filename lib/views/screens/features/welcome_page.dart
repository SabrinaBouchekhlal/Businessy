
import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/BG.jpeg'), // Your image path
                fit: BoxFit.cover, // Make the image cover the entire screen
              ),
            ),
          ),
          // Linear Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2), // 20% opacity on one side
                  mainGreen.withOpacity(0.8), // 80% opacity on the other side
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          // Your content (centered text)
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 36, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to', style: TextStyle(fontFamily: 'Montserrat', fontSize: 28, fontWeight: FontWeight.w800, color: whiteColor)),
                    Text('Businessy!', style: TextStyle(fontFamily: 'Montserrat', fontSize: 28, fontWeight: FontWeight.w800, color: whiteColor))
                  ],
                ),
                const SizedBox(height:19),
                const Text('Track your income, expenses, and watch your business grow.', style: TextStyle(fontFamily: 'Urbanist', fontSize: 18, color: whiteColor)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,50,0,80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Let's get started!", style: TextStyle(fontFamily: 'Urbanist', fontSize: 18, fontWeight: FontWeight.w600, color: whiteColor)),
                      const SizedBox(width: 14),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/LoginScreen');
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            color: Color(0xB8FFFFFF), // Background color
                            shape: BoxShape.circle, // Makes the background circular
                          ),
                          padding: const EdgeInsets.all(0), // Adjusts the size of the circle
                          child: const Icon(
                            Icons.arrow_forward_rounded, // Forward arrow icon
                            size: 32, //icon size
                            color: Color(0xC1229799), // Icon color
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

