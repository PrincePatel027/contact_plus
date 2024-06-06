// import 'package:flutter/material.dart';

// class DialPadProvider with ChangeNotifier {
//   //
//   // ContactDetails contactDetails = ContactDetails();
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   List contactData = [];
//   String _number = '';

//   String get number => _number;

//   void addDigit(String digit) {
//     if (_number.length < 10) {
//       _number += digit;
//       notifyListeners();
//     }
//   }

//   void clear() {
//     _number = '';
//     // contactDetails.contactNum = _number;
//     notifyListeners();
//   }

//   void backspace() {
//     if (_number.isNotEmpty) {
//       _number = _number.substring(0, _number.length - 1);
//       notifyListeners();
//     }
//   }

//   void save() {
//     contactDetails.name = nameController.text;
//     contactDetails.contactNum = _number;
//     contactDetails.email = emailController.text;

//     Map data = {
//       'name': contactDetails.name,
//       'contactNum': contactDetails.contactNum,
//       'email': contactDetails.email,
//     };

//     contactData.add(data);

//     notifyListeners();
//   }
// }
