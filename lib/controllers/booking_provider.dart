import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/booking_model.dart';

class BookingProvider with ChangeNotifier {
  bool isLoading = false;

  Future<void> addBooking(BookingModel booking) async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseFirestore.instance
          .collection('bookings')
          .add(booking.toMap());
    } catch (e, st) {
      debugPrint('addBooking error: $e\n$st');
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
