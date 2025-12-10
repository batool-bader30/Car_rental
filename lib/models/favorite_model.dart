class FavoriteModel {
  final String carId;
  final String userId;
  final String id;

  FavoriteModel({required this.id, required this.carId,required this.userId});

  factory FavoriteModel.fromMap(Map<String, dynamic> data, String id) {
    return FavoriteModel(id: id, carId: data['carId'] ?? '',userId:data['userId']);
  }

  Map<String, dynamic> toMap() {
    return {"carId": carId,"userId":userId};
  }
}
