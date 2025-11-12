import 'package:carrental/models/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';

class BookingProvider with ChangeNotifier {
  bool isLoading =false;

  Future<void> addBooking(BookingModel booking) async {
    try {
      var isLoading=true;
      notifyListeners();

      await FirebaseFirestore.instance.collection("bookings").add(booking.toMap());

      notifyListeners();
      isLoading=false;
    } catch (e) {
      isLoading=false;
      notifyListeners();
      throw Exception("Error adding booking:$e");
    }
  }
}
