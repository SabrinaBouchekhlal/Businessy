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
  static String firstName = 'Nada';
  static String lastName = 'Zanoun';
  static String birthDate = '22/03/2005';
  static String phoneNumber = '07796562442';
  static String email = 'nada.zanoun@ensia.edu.dz';
  static String password = 'nada,zanoun';
  static String businessName = 'Serine Crochet';
  static String launchDate = '27/07/2024';
  static String actualBalance = '61000';
  static String sellingType = 'Products';
  static String logo = '';
}
