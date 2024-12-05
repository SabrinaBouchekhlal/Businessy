
import 'package:flutter/material.dart';
const double defaultPadding = 24.0;
const double fieldSpacing = 16.0;
const double buttonHeight = 50.0;

// Responsive widget scaling
double responsiveWidth(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}

double responsiveHeight(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}