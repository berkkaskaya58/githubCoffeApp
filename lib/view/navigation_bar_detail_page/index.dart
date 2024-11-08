import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/view/login_page_view/index.dart';
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
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.55;
    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex], // İçerik sayfası

          // Yukarıdaki gezinme çubuğu
          Positioned(
            top: height,
            left: width,
            right: width,
            child: Container(
              decoration: BoxDecoration(
                color: UIColor.loginButtonColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color:
                              currentIndex == 0 ? UIColor.white : Colors.black,
                        ),
                        Text(
                          'Deliver',
                          style: TextStyle(
                            color: currentIndex == 0
                                ? UIColor.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.store,
                          color:
                              currentIndex == 1 ? UIColor.white : Colors.black,
                        ),
                        Text(
                          'Pick Up',
                          style: TextStyle(
                            color: currentIndex == 1
                                ? UIColor.white
                                : Colors.black,
                          ),
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
