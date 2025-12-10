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
  Future<void> updateBookingPayment(String? bookingId) async {
  try {
    isLoading = true;

    await FirebaseFirestore.instance
        .collection('bookings')
        .doc(bookingId)
        .update({
      "ispaid": true,
    });

  } catch (e, st) {
    debugPrint("updateBookingPayment error: $e\n$st");
    rethrow;
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
Stream<List<BookingModel>> getBookingsStream(String uid) {
    return FirebaseFirestore.instance
        .collection('bookings')
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BookingModel.fromMap(doc.data(), doc.id))
            .toList());
  }
}
