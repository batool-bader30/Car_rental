import 'dart:io';
import 'package:carrental/controllers/car_provider.dart';
import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/view/widgets/bottom_nav.dart';
import 'package:carrental/view/widgets/car_item.dart';
import 'package:carrental/view/widgets/drawer.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All", "BMW", "Toyota", "Tesla"];

  @override
  void initState() {
    super.initState();

    // Fetch cars once when the screen is initialized
    Future.microtask(() async {
      await Provider.of<CarProvider>(context, listen: false).fetchCars();
     
    });
  }

  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarProvider>(context);
    var cars = carProvider.Fcars;
    var myuser = Provider.of<UserController>(context).userModel;

    String? imagePath = myuser?.image;
    ImageProvider profileImage;

    if (imagePath != null &&
        imagePath.isNotEmpty &&
        File(imagePath).existsSync()) {
      profileImage = FileImage(File(imagePath));
    } else {
      profileImage = AssetImage("assets/images/profileimag.png");
    }

    return Scaffold(
drawer: AppDrawer(),
  appBar: AppBar(
    backgroundColor: AppColor.primary,
    elevation: 0,
    leading: Builder(
      builder: (context) => InkWell(
       child:  Padding(
         padding: const EdgeInsets.all(8.0),
         child: IconWidget(icon: Icons.menu),
       ),
        onTap: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    actions: [
      CircleAvatar(radius: 20, backgroundImage: profileImage),
      SizedBox(width: 16),
    ],
  ),      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
      backgroundColor: AppColor.primary,
      body: SafeArea(
        
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              

              const SizedBox(height: 10),

              const Text(
                "Browse Cars",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              /// CATEGORIES
              SizedBox(
                height: 38,
                child: Consumer<CarProvider>(
                  builder: (context, ctrl, child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = ctrl.selectedIndex == index;
                        return InkWell(
                          onTap: () {
                            ctrl.changeSelectedIndex(index);

                            if (categories[index] == "All") {
                              ctrl.fetchCars();
                            } else {
                              ctrl.fetchCarsByName(categories[index]);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF1C2A3A)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? Color(0xffEBB739)
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              /// HEADER + FILTER BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Cars",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
            carProvider.sort();

                    },
                    icon: Row(
                      children: [
                        Text("price"),
                       Icon(
        carProvider.isAscending 
          ? Icons.arrow_upward 
          : Icons.arrow_downward,
        color: Colors.black,
        size: 18,
      ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              /// CAR LIST
              Expanded(
                child: ListView.builder(
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: CarItem(car: cars[index]),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
