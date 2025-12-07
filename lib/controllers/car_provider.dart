import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';

class CarProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<CarModel> _cars = [];
  List<CarModel> Fcars = [];
  List<CarModel> get cars => _cars;
  bool isAscending = true;
  Future<void> fetchCars() async {
    try {
      print("Fetching cars from Firestore...");

      var snapshot = await FirebaseFirestore.instance.collection('cars').get();

      print("Number of cars fetched: ${snapshot.docs.length}");

      _cars = snapshot.docs.map((doc) {
        print("Car doc data: ${doc.data()}"); // يطبع كل وثيقة
        return CarModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      Fcars = cars;
      print("Total cars in provider list: ${_cars.length}");

      notifyListeners();
    } catch (e) {
      print("Error fetching cars: $e");
    }
  }

  Future<void> fetchCarsByName(String? name) async {
    if (name == null || name.isEmpty || name == "All") {
      Fcars = cars;
      notifyListeners();
      return;
    }

    // فلترة السيارات الموجودة محليًا
    Fcars = _cars
        .where((car) => car.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void sort() async {
    Fcars.sort((a, b) {
      double priceA = a.price ?? 0;
      double priceB = b.price ?? 0;

      if (isAscending) {
        return priceA.compareTo(priceB);
      } else {
        return priceB.compareTo(priceA); 
      }
    });
    isAscending = !isAscending;
    notifyListeners();
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
