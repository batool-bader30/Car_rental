import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectPaymentMethod(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<String> paymentMethods = [
    "Pay Now",
    "Pay Later",
  ];
  
}
