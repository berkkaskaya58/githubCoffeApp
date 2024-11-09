import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/view/login_page_view/index.dart';
import 'package:coffee_shop_app/view/order_page_view/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final double price;
  final String imagePath;

  // Constructor
  CustomNavigationBar({super.key, required this.price, required this.imagePath});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
 

  // Sayfaların listesi
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
   
    // Sayfaları initState içinde oluşturuyoruz
    pages = [
      OrderPage(price: widget.price,imagePath: widget.imagePath,), // price'ı OrderPage'e iletiyoruz
      const LoginPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.55;

    return Scaffold(
      body: Stack(
        children: [
          // Sayfa içeriği
          pages[currentIndex],

          // Gezinme çubuğu
          Positioned(
            bottom: height*2.8,
            left: width,
            right: width,
            child: Container(
              decoration: BoxDecoration(
                color: UIColor.loginButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Deliver butonu
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0; // Deliver sayfasına geç
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BasicText(
                          text: 'Deliver',
                          textColor: currentIndex == 0
                              ? UIColor.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  // Pick Up butonu
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1; // Pick Up sayfasına geç
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BasicText(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          text: 'Pick Up',
                          textColor: currentIndex == 1
                              ? UIColor.white
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
