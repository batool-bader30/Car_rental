class UserModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? image;

  // Constructor with named optional parameters
  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
  });

  // Create an instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      image: json['image'] as String?,
    );
  }

  // Convert instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }
}
