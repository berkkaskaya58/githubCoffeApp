import 'package:coffee_shop_app/bottom_navigation_bar.dart';
import 'package:coffee_shop_app/controller/login_controller/index.dart';
import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/widget/button_widget/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // LoginController'ı GetX ile bağla
    final LoginController loginController = Get.put(LoginController());

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              CustomButton(
                width: double.infinity,
                height: height * 2.5,
                backgroundColor: UIColor.loginButtonColor,
                text: 'Giriş Yap',
                function: () async {
                  try {
                    // Google ile giriş yap
                    User? user = await loginController.signInWithGoogle();

                    // Kullanıcı giriş yaparsa navigasyonu değiştir
                    if (user != null) {
                      Get.to(
                        () => const CustomBottomNavigationBar(price: 0.0),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 200),
                      );
                    } else {
                      // Kullanıcı giriş yapmayı iptal etti
                      Get.snackbar(
                        "Hata",
                        "Google ile giriş yapılamadı!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  } catch (e) {
                    // Hata durumunda kullanıcıya mesaj göster
                    Get.snackbar(
                      "Hata",
                      "Bir hata oluştu: $e",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
