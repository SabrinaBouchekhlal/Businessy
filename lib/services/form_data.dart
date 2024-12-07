import 'package:flutter/material.dart';


class FormData {
  // Singleton implementation
  FormData._privateConstructor();
  static final FormData _instance = FormData._privateConstructor();
  factory FormData() => _instance;

  // Controllers for text fields
  static final TextEditingController businessNameController = TextEditingController();
  static final TextEditingController launchDateController = TextEditingController();
  static final TextEditingController actualBalanceController = TextEditingController();
  static final TextEditingController sellingTypeController = TextEditingController();

  // Selected dropdown value
  static String selectedSellingType = 'Products';

  // Utility method to clear form data (if needed later)
  static void clearData() {
    businessNameController.clear();
    launchDateController.clear();
    actualBalanceController.clear();
    sellingTypeController.clear();
    selectedSellingType = 'Products';
  }
}

class UserData {
  static String firstName = '';
  static String lastName = '';
  static String birthDate = '';
  static String phoneNumber = '';
  static String email = '';
  static String password = '';
  static String businessName = '';
  static String launchDate = '';
  static String actualBalance = '';
  static String sellingType = '';
  static String logo = '';
}
