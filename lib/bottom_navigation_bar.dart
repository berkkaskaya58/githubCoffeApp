import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_icon/index.dart';
import 'package:coffee_shop_app/view/favorite_page_view/index.dart';
import 'package:coffee_shop_app/view/home_page_view/index.dart';
import 'package:coffee_shop_app/view/notification_page/index.dart';
import 'package:coffee_shop_app/view/order_page_view/index.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0; 

  final List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
     OrderPage(),
    const NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[currentIndex], // Seçilen sayfayı göster
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Seçili sayfanın index'i
        onTap: (index) {
          setState(() {
            currentIndex = index; // Tıklanan sayfayı seç
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: UIColor.white,
            icon: ImageIcon(AssetImage(UIIcon.home,),color: UIColor.black,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage(UIIcon.heart,),color: UIColor.black,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage(UIIcon.bag,),color: UIColor.black,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage(UIIcon.notification,),color: UIColor.black,),
            label: '',
          ),
        ],
      ),
    );
  }
}
