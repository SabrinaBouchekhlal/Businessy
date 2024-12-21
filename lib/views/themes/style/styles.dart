import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class AppStyles {
  // Box Decorations
  static final BoxDecoration basicCardDecoration = BoxDecoration(
    color: whiteColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: basicCardBorderColor,
      width: 1.0, // Border width
    ),
  );

  static final BoxDecoration inventoryCardDecoration = BoxDecoration(
    color: whiteColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: basicCardBorderColor,
      width: 1.0, // Border width
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2), // Subtle shadow color
        blurRadius: 4, // Softens the shadow
        offset: Offset(0, 2), // Moves shadow downwards slightly
      ),
    ],
  );

  static final BoxDecoration plusCardDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(0),
    border: const Border(
      left: BorderSide(
        color: basicCardBorderColor, // Left border color
        width: 1.0, // Left border width
      ),
    ),
  );

  static final BoxDecoration minusCardDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(0),
    border: const Border(
      right: BorderSide(
        color: basicCardBorderColor, // Right border color
        width: 1.0, // Right border width
      ),
    ),
  );

  // Border Radius Styles
  static final OutlinedBorder standardRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  // Login Button Icons
  static const Icon backButtonIcon = Icon(
    Icons.arrow_back,
    size: 24,
    color: Colors.black,
  );

  static const Icon visibilityOn = Icon(
    Icons.visibility,
    color: Colors.grey,
  );

  static const Icon visibilityOff = Icon(
    Icons.visibility_off,
    color: Colors.grey,
  );
}
