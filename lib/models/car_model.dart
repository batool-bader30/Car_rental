class CarModel {
 
  final String name;
  final String imageUrl;
  final double price;
  final String id;

  final String description;
  final int rangekm;
  final String transmission;
  final String fuel;
  final int seats;


  CarModel({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.price,

    required this.description,
    required this.fuel,
    required this.transmission,
    required this.seats,
    required this.rangekm,
  });

  factory CarModel.fromMap(Map<String, dynamic> data, String id){
    return CarModel(

      id: id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      fuel: data['fuel'] ?? '',
      seats: data['seats'] ?? 0,
      rangekm: data['rangekm'] ?? 0,
      transmission: data['transmission'] ?? '',
      
      
        
        );
  }

  Map<String,dynamic>toMap(){
    return {
      "name":name,
      "imageUrl":imageUrl,
      "price":price,
      "description":description,
      "fuel":fuel,
      "seats":seats,
      "rangekm":rangekm,





    };
  }
}
