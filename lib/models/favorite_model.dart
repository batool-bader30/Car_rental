class FavoriteModel {
  final String carId;

  final String id;

  FavoriteModel({required this.id, required this.carId});

  factory FavoriteModel.fromMap(Map<String, dynamic> data, String id) {
    return FavoriteModel(id: id, carId: data['carId'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {"carId": carId};
  }
}
