import 'package:coffee_shop_app/controller/detail_page_controller/index.dart';
import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    // MediaQuery değerlerini optimize edin
    final double horizontalPadding = MediaQuery.of(context).size.width * 0.05;
    final double verticalPadding = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: AppBar(title: Text('Favorite Page')),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return Center(child: Text("Henüz favori eklenmedi."));
        }
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return ListTile(
              leading: Image.asset(item['imagePath']),
              title: Text(item['text']),
              subtitle: Text('Price: ${item['price'].toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  controller.favorites.removeAt(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
