import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<FavoriteModel> _favorite = [];
  List<FavoriteModel> get favorite => _favorite;

  /// تحميل المفضلة
  Future<void> loadFavorites() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("favorite")
        .get();

    _favorite = snapshot.docs
        .map((doc) => FavoriteModel.fromMap(doc.data(), doc.id))
        .toList();

    notifyListeners();
  }

  /// إضافة أو إزالة من المفضلة
  Future<void> toggleFavorites(String carId) async {
    final existing =
        _favorite.where((f) => f.carId == carId).toList();

    if (existing.isNotEmpty) {
      // احذف الموجود
      await FirebaseFirestore.instance
          .collection("favorite")
          .doc(existing.first.id)
          .delete();

      _favorite.remove(existing.first);
    } else {
      // أضف جديد
      final doc = await FirebaseFirestore.instance
          .collection("favorite")
          .add({"carId": carId});
      _favorite.add(FavoriteModel(id: doc.id, carId: carId));
    }

    notifyListeners();
  }

  /// معرفة إذا السيارة مفضلة أو لا
  bool isFavorite(String carId) {
    return _favorite.any((f) => f.carId == carId);
  }
}
