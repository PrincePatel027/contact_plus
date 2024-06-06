// // import 'package:contact_plus/model/contact_details.dart';
// // import 'package:flutter/material.dart';

// // class StepperProvieder extends ChangeNotifier {
// //   List contacts = [];

// //   ///
// //   var nameController = TextEditingController();
// //   var contactController = TextEditingController();
// //   var emailController = TextEditingController();

// //   ContactDetails contactDetails = ContactDetails();

// //   void save() {
// //     // contactDetails.name = nameController.text;
// //     // contactDetails.contactNum = contactController.text;
// //     // contactDetails.email = emailController.text;

// //     Map data = {
// //       'name': nameController.text,
// //       'contact': contactController.text,
// //       'email': emailController.text,
// //     };

// //     contacts.add(data);
// //   }
// // }

// import 'package:contact_plus/model/contact_details.dart';
// import 'package:flutter/material.dart';

// class StepperProvider extends ChangeNotifier {
//   List<Map<String, String>> contacts = [];
//   List<Map<String, String>> hiddenContacts = [];

//   var nameController = TextEditingController();
//   var contactController = TextEditingController();
//   var emailController = TextEditingController();

//   ContactDetails contactDetails = ContactDetails();

//   void save() {
//     Map<String, String> data = {
//       'name': nameController.text,
//       'contact': contactController.text,
//       'email': emailController.text,
//     };

//     contacts.add(data);
//     notifyListeners();
//   }

//   void reset() {
//     nameController.clear();
//     contactController.clear();
//     emailController.clear();
//   }

//   void hideContact(int index) {
//     hiddenContacts.add(contacts[index]);
//     contacts.removeAt(index);
//     notifyListeners();
//   }

//   void unhideContact(int index) {
//     contacts.add(hiddenContacts[index]);
//     hiddenContacts.removeAt(index);
//     notifyListeners();
//   }

//   void clean() {
//     nameController.clear();
//     contactController.clear();
//     emailController.clear();
//   }
// }

import 'package:contact_plus/model/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StepperProvider extends ChangeNotifier {
  List<Map<String, String>> contacts = [];
  List<Map<String, String>> hiddenContacts = [];

  var nameController = TextEditingController();
  var contactController = TextEditingController();
  var emailController = TextEditingController();

  ContactDetails contactDetails = ContactDetails();

  StepperProvider() {
    initialize();
  }

  Future<void> initialize() async {
    await loadContacts();
    notifyListeners();
  }

  void save() {
    Map<String, String> data = {
      'name': nameController.text,
      'contact': contactController.text,
      'email': emailController.text,
    };

    contacts.add(data);
    saveContacts();
    notifyListeners();
  }

  void reset() {
    nameController.clear();
    contactController.clear();
    emailController.clear();
  }

  void hideContact(int index) {
    hiddenContacts.add(contacts[index]);
    contacts.removeAt(index);
    saveContacts();
    notifyListeners();
  }

  void unhideContact(int index) {
    contacts.add(hiddenContacts[index]);
    hiddenContacts.removeAt(index);
    saveContacts();
    notifyListeners();
  }

  void clean() {
    nameController.clear();
    contactController.clear();
    emailController.clear();
  }

  Future<void> saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsString = jsonEncode(contacts);
    final hiddenContactsString = jsonEncode(hiddenContacts);

    await prefs.setString('contacts', contactsString);
    await prefs.setString('hiddenContacts', hiddenContactsString);
  }

  Future<void> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsString = prefs.getString('contacts');
    final hiddenContactsString = prefs.getString('hiddenContacts');

    if (contactsString != null) {
      contacts = List<Map<String, String>>.from(jsonDecode(contactsString));
    }
    if (hiddenContactsString != null) {
      hiddenContacts =
          List<Map<String, String>>.from(jsonDecode(hiddenContactsString));
    }
  }
}
