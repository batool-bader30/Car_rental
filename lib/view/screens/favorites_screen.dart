import 'package:carrental/controllers/car_provider.dart';
import 'package:carrental/controllers/favorite_provider.dart';

import 'package:carrental/view/screens/car_details_screen.dart';
import 'package:carrental/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    final carProv = Provider.of<CarProvider>(context);

    final favList=fav.favorite;

    return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),

      appBar: AppBar(
        title: Text("Favorite Cars"),
        centerTitle: true,
      ),
      body: fav.favorite.isEmpty
          ? Center(child: Text("No Favorite cars yet"))
          : ListView.builder(
              itemCount: favList.length,
              itemBuilder: (ctx, i) {
                final favItem = fav.favorite[i];
                final matchingCars = carProv.cars.where((c) => c.id == favItem.carId).toList();
                    

                if (matchingCars.isEmpty) {
                  return SizedBox.shrink();
                }
                final car =matchingCars.first;

                return ListTile(
                  leading: Image.network(car.imageUrl, width: 80),
                  title: Text(car.name),
                  subtitle: Text("\$${car.price}/day"),
                  trailing: Icon(Icons.favorite, color: Colors.red),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CarDetailsScreen(car: car)),
                    );
                  },
                );
              },
            ),
    );
  }
}
