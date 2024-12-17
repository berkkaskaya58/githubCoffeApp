import 'package:firebase_core/firebase_core.dart';
import 'package:coffee_shop_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:coffee_shop_app/view/login_page_view/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Firebase'in zaten başlatılıp başlatılmadığını kontrol et
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase zaten başlatıldı: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
