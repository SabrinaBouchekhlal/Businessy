import 'package:flutter/material.dart';

<<<<<<< HEAD
=======

>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
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

<<<<<<< HEAD
  // Utility method to clear form data
=======
  // Utility method to clear form data (if needed later)
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
  static void clearData() {
    businessNameController.clear();
    launchDateController.clear();
    actualBalanceController.clear();
    sellingTypeController.clear();
    selectedSellingType = 'Products';
  }
}

class UserData {
<<<<<<< HEAD
  static String? firstName;
  static String? lastName;
  static String? birthDate;
  static String? phoneNumber;
  static String? email;
  static String password = '';
  static String? businessName;
  static String? launchDate;
  static String? actualBalance;
  static String? sellingType;
  static String? logo;

  static void clear() {
    firstName = null;
    lastName = null;
    birthDate = null;
    phoneNumber = null;
    email = null;
    password = '';
    businessName = null;
    launchDate = null;
    actualBalance = null;
    sellingType = null;
    logo = null;
  }

  static bool isValid() {
    return firstName != null && 
           lastName != null && 
           birthDate != null && 
           phoneNumber != null && 
           email != null && 
           password.isNotEmpty;
  }
=======
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
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
}
