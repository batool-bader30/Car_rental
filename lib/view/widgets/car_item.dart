import 'package:carrental/view/screens/car_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/car_model.dart';

class CarItem extends StatelessWidget {
  final CarModel car;

  const CarItem({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>CarDetailsScreen(car: car),
         ),
        );
        
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(car.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      
            const SizedBox(width: 14),
      
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
      
                const SizedBox(height: 10),
      
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "\$${car.price} / day",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
