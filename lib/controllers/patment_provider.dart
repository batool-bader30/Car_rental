import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  int _selectedIndex = 0; // افتراضيًا أول وحدة مختارة

  int get selectedIndex => _selectedIndex;

  void selectPaymentMethod(int index) {
    _selectedIndex = index;
    notifyListeners(); // لتحديث الواجهة عند تغيير القيمة
  }

  final List<String> paymentMethods = [
    "Credit / Debit Card",
    "Cash Payment",
  ];
}
