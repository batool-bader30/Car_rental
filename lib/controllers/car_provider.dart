import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';

class CarProvider with ChangeNotifier {
  List<CarModel> _cars = [];
  List<CarModel> get cars => _cars;

  Future<void> fetchCars() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('cars').get();

      _cars = snapshot.docs.map((doc) {
        return CarModel.fromMap(doc.data(), doc.id);
      }).toList();

      notifyListeners();
    } catch (e) {
      print("Error fetching cars: $e");
    }
  }
}
