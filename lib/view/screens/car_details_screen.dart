import 'package:carrental/controllers/favorite_provider.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/overview_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarModel car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          //padding: EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: IconWidget(icon: Icons.arrow_back),
                  ),
                  Text(
                    "Car Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      fav.toggleFavorites(car.id); // <<< مهم جداً
                    },
                    child: Icon(
                      fav.isFavorite(car.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: fav.isFavorite(car.id) ? Colors.red : Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //image
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(car.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            //name
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                car.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),

            //desecrption
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                car.description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,

                padding: EdgeInsets.all(10),
                //margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overview",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OverviewWidget(icon: Icons.speed, text: "350 km"),
                          OverviewWidget(
                            icon: Icons.swap_vert,
                            text: " Automatic",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OverviewWidget(
                            icon: Icons.local_gas_station,
                            text: "Diesel",
                          ),
                          OverviewWidget(
                            icon: Icons.event_seat,
                            text: " 4 Seats",
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${car.price}/Day",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              NavigatorUtils.navigateToDateTimeScreen(
                                context,
                                car,
                              );
                            },
                            child: Text(
                              "Book Car",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
