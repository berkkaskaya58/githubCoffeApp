import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 1.5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Geri gitmek için
                      },
                      child: Image.asset(UIImage.arrowLeft), // Resmi burada uygun şekilde ekleyin
                    ),
                  ),
                  const Text(
                    'Favoriler', // Başlık metni
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.add,color: Colors.transparent,)
                ],
              ),

                  
            ],

          ),
        ),
      ),
    );
  }
}
