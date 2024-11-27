/*class Dimensions {
  static const double loginArrowSize = 48.0;
  static const double loginArrowWidth = 30.0;
  static const double loginArrowHeight = 28.0;
  static const double loginArrowTop = 74.0;
  static const double loginArrowLeft = 38.0;

  static const double logoImageWidth = 210.0;
  static const double logoImageHeight = 58.0;
  static const double logoImageTop = 138.0;
  static const double logoImageLeft = 115.0;
  static const double logoImageGap = 0.0;
  static const double logoImageOpacity = 0.0;

  static const double welcomeTextWidth = 323.0;
  static const double welcomeTextHeight = 62.0;
  static const double welcomeTextTop = 204.0;
  static const double welcomeTextLeft = 58.0;
  static const double welcomeTextGap = 0.0;
  static const double welcomeTextOpacity = 0.0;

  static const double emailFieldWidth = 324.0;
  static const double emailFieldHeight = 56.0;
  static const double emailFieldTop = 305.0;
  static const double emailFieldLeft = 59.0;
  static const double emailFieldGap = 0.0;
  static const double emailFieldBorderRadius = 8.0;
  static const double emailFieldBorderWidth = 1.0;
  static const double emailFieldOpacity = 0.0;

  static const double passwordFieldWidth = 324.0;
  static const double passwordFieldHeight = 56.0;
  static const double passwordFieldTop = 375.0;
  static const double passwordFieldLeft = 59.0;
  static const double passwordFieldGap = 0.0;
  static const double passwordFieldBorderWidth = 1.0;
  static const double passwordFieldOpacity = 0.0;

  static const double forgetPasswordWidth = 95.0;
  static const double forgetPasswordHeight = 14.0;
  static const double forgetPasswordTop = 444.0;
  static const double forgetPasswordLeft = 288.0;
  static const double forgetPasswordGap = 0.0;
  static const double forgetPasswordOpacity = 0.0;

  static const double emailInputWidth = 183.0;
  static const double emailInputHeight = 20.0;
  static const double emailInputTop = 324.0;
  static const double emailInputLeft = 78.0;
  static const double emailInputGap = 0.0;
  static const double emailInputOpacity = 0.0;

  static const double keepLoggedInWidth = 148.0;
  static const double keepLoggedInHeight = 17.0;
  static const double keepLoggedInTop = 471.0;
  static const double keepLoggedInLeft = 59.0;
  static const double keepLoggedInGap = 12.0;
  static const double keepLoggedInOpacity = 0.0;

  static const double loginButtonWidth = 324.0;
  static const double loginButtonHeight = 59.0;
  static const double loginButtonTop = 507.0;
  static const double loginButtonLeft = 59.0;
  static const double loginButtonPadding = 19.0;
  static const double loginButtonGap = 0.0;
  static const double loginButtonBorderRadius = 8.0;
  static const double loginButtonOpacity = 0.0;

  static const double orTextWidth = 325.0;
  static const double orTextHeight = 14.0;
  static const double orTextTop = 585.0;
  static const double orTextLeft = 58.0;
  static const double orTextGap = 0.0;
  static const double orTextOpacity = 0.0;

  static const double googleButtonWidth = 250.0;
  static const double googleButtonHeight = 44.0;
  static const double googleButtonTop = 614.0;
  static const double googleButtonLeft = 95.0;
  static const double googleButtonPadding = 4.0;
  static const double googleButtonGap = 10.0;
  static const double googleButtonBorderRadius = 10.0;
  static const double googleButtonBorderWidth = 1.0;
  static const double googleButtonOpacity = 0.0;

  static const double signUpTextWidth = 269.0;
  static const double signUpTextHeight = 22.0;
  static const double signUpTextTop = 728.0;
  static const double signUpTextLeft = 86.0;
  static const double signUpTextGap = 4.0;
  static const double signUpTextOpacity = 0.0;
}*/

import 'package:flutter/material.dart';

class Dimensions {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleFactor;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    scaleFactor = screenWidth / 375; // Use 375 as the baseline screen width
  }

  static double responsive(double value) => value * scaleFactor;

  // Responsive dimensions
  static double get loginArrowSize => responsive(48.0);
  static double get loginArrowTop => responsive(74.0);
  static double get logoImageWidth => responsive(210.0);
  static double get logoImageHeight => responsive(58.0);
  static double get emailFieldWidth => responsive(324.0);
  static double get emailFieldHeight => responsive(56.0);
  static double get loginButtonWidth => responsive(324.0);
  static double get loginButtonHeight => responsive(59.0);
}
