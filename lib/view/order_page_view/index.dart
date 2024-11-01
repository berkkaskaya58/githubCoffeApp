import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:coffee_shop_app/widget/container_text_widget/index.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width * 0.05;
    double paddingHeight = MediaQuery.of(context).size.width * 0.55;

    return Scaffold(
      backgroundColor: UIColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: paddingWidth,
              right: paddingWidth,
              bottom: paddingHeight / 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: paddingWidth * 1.5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(UIImage.arrowLeft),
                    ),
                  ),
                  const BasicText(
                    text: 'Sipariş',
                    fontSize: 20,
                  ),
                  const Icon(
                    Icons.heart_broken_outlined,
                    color: Colors.transparent,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: UIColor.grey,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerText(
                        width: paddingHeight,
                        text: 'Deliver',
                        function: () {},
                      ),
                      ContainerText(
                        width: paddingWidth,
                        backgroundColor: UIColor.grey,
                        text: 'Pick Up',
                        function: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  BasicText(text: 'Sipariş Adresi'),
                ],
              ),
              const Row(
                children: [
                  BasicText(text: 'Elazığ Merkez'),
                ],
              ),
              Row(
                children: [
                  ContainerText(
                    borderRadius: BorderRadius.circular(20),
                    borderColor: UIColor.grey,
                    width: paddingWidth * 7,
                    text: 'Adresi Düzenle',
                    function: () {},
                    prefixIcon: Icon(Icons.edit),
                  ),
                  ContainerText(
                    borderColor: UIColor.grey,
                    text: 'Not Ekle',
                    function: () {},
                    prefixIcon: Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
