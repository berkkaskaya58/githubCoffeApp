import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_icon/index.dart';
import 'package:coffee_shop_app/view/favorite_page_view/index.dart';
import 'package:coffee_shop_app/view/home_page_view/index.dart';
import 'package:coffee_shop_app/view/login_page_view/index.dart';
import 'package:coffee_shop_app/view/notification_page/index.dart';
import 'package:coffee_shop_app/view/order_page_view/index.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  

  final List<Widget> pages = [
    const OrderPage(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(),
            label: 'Deliver',
          ),
          BottomNavigationBarItem(
            icon: Container(),
            label: 'Pick Up',
          ),
        ],
        selectedItemColor:  UIColor.white ,  // Change color based on isClicked state
        unselectedItemColor: Colors.black,  // Color for unselected items
        backgroundColor:  UIColor.loginButtonColor,  // Toggle background color
      ),
    );
  }
}
