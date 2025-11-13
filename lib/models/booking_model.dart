import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String? id;
  //final String carId;
  final String carName;
  final String date;       // 'yyyy-MM-dd'
  final String time;       // 'hh:mm'
  //final String amPm;       // 'AM' or 'PM'
  final int hours;
  //final double pricePerDay;

  BookingModel({
    this.id,
    //required this.carId,
    required this.carName,
    required this.date,
    required this.time,
    
    required this.hours,
    //required this.pricePerDay,
  });

  factory BookingModel.fromMap(Map<String, dynamic> data, String id) {
    return BookingModel(
      id: id,
      //carId: data['carId'] ?? '',
      carName: data['carName'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      //amPm: data['amPm'] ?? '',
      hours: (data['hours'] ?? 0) is int ? (data['hours'] ?? 0) : int.tryParse('${data['hours']}') ?? 0,
      //pricePerDay: (data['pricePerDay'] is num) ? (data['pricePerDay'] as num).toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      //'carId': carId,
      'carName': carName,
      'date': date,
      'time': time,
      //'amPm': amPm,
      'hours': hours,
      
      
    };
  }
}
