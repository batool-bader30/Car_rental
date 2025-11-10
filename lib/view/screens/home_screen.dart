import 'package:carrental/controllers/car_provider.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/view/widgets/car_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarProvider>(context);
    List<CarModel> cars =carProvider.cars;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carProvider.fetchCars();
});


    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.4),
                        width: 2,
                      ),
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                    child: Center(child: Icon(Icons.menu)),
                  ),

                  Spacer(),

                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/Blue_Car.png"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Browse Cars",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // SEARCH FIELD
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 18),
                    suffixIcon: Icon(Icons.search),
                    //border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Available Cars",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12,),
              
              Expanded(
                child:ListView.builder(
                  itemCount:cars.length ,
                  itemBuilder: (context, index) {
                    var car =carProvider.cars[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: CarItem(car:cars[index]),

                      );
                  },
                )
                 )
            ],
          ),
        ),
      ),
    );
  }
}
