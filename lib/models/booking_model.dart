import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String id;
  final String carId;
  final String carName;
  final String date;

  final String time;
  final String amPm;
  final String hours;
  final double pricePerDay;
  final DateTime createAt;

  BookingModel({
    required this.carId,
    required this.id,
    required this.carName,
    required this.date,

    required this.time,
    required this.amPm,
    required this.hours,
    required this.pricePerDay,
    required this.createAt,
  });

  factory BookingModel.fromMap(Map<String, dynamic> data, String id) {
    return BookingModel(
      id: id,
      carId: data['carId'] ?? '',
      carName: data['carName'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      amPm: data['amPm'] ?? '',
      hours: data['hours'] ?? 0,
      pricePerDay: data['pricePerDay'] != null
          ? data['pricePerDay'].toDouble()
          : 0.0,
      createAt: (data['createAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "carId": carId,
      "carName": carName,
      "date": date,
      "time": time,
      "amPm": amPm,
      "hours": hours,
      "pricePerDay": pricePerDay,
      "createAt":createAt,
    };
  }
}
