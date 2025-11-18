import 'package:flutter/material.dart';
import 'package:carrental/view/screens/favorites_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
          Icon(Icons.home,
              color: selectedIndex == 0 ? Colors.amber : Colors.white,
              size: 30),
          SizedBox(width: 55,),

          // Favorite
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesScreen()),
              );
            },
            child: Icon(Icons.favorite,
                color: selectedIndex == 1 ? Colors.amber : Colors.white,
                size: 30),
          ),
          SizedBox(width: 55,),

          // Profile
          Icon(Icons.person,
              color: selectedIndex == 2 ? Colors.amber : Colors.white,
              size: 30),
          SizedBox(width: 55,),
            
          
          // History
          Icon(Icons.history_outlined,
              color: selectedIndex == 2 ? Colors.amber : Colors.white,
              size: 30),
          
        ],
      ),
    );
  }
}
