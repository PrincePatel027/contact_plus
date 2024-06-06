import 'package:contact_plus/model/phone_or_contact.dart';
import 'package:flutter/material.dart';

class PhoneOrContact extends ChangeNotifier {
  IsPhone selected = IsPhone(isPhone: false);

  phoneSelected() {
    selected.isPhone = true;
    notifyListeners();
  }

  contactSelected() {
    selected.isPhone = false;
    notifyListeners();
  }
}
