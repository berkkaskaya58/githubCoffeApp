import 'package:coffee_shop_app/bottom_navigation_bar.dart';
import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/widget/button_widget/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.05;
    

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIImage.loginCoffee),
            fit: BoxFit.cover,
          ),
        ),
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [Spacer(), CustomButton(
            width: double.infinity,
            height: height*2.5,
            backgroundColor: UIColor.loginButtonColor,
            text: 'Giriş Yap',
            function: () => Get.to(() =>  const CustomBottomNavigationBar(price: 0.0,)),
          ),],),
        )
      ),
    );
  }
}
