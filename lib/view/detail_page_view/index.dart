import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_description/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/view/order_page_view/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:coffee_shop_app/widget/button_widget/index.dart';
import 'package:coffee_shop_app/widget/container_size/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String text;
  final String price;
  final int index;
  // final String description;
  const DetailPage(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.price,
      required this.index});

  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width * 0.05;
    double paddingHeight = MediaQuery.of(context).size.width * 0.55;
    return Scaffold(
      backgroundColor: UIColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
               left: paddingWidth, right: paddingWidth,bottom: paddingHeight/10),
          child: Column(
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
                          child: Image.asset(UIImage.arrowLeft))),
                  const BasicText(
                    text: 'Detay',
                    fontSize: 20,
                  ),
                  const Icon(Icons.heart_broken_outlined),
                ],
              ),
              SizedBox(
                height: paddingHeight / 10,
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(
                    width: double.infinity,
                    height: 202,
                    imagePath,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: paddingHeight / 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicText(
                    text: text,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ],
              ),
              const Row(
                children: [
                  BasicText(
                    text: 'Ice/Hot',
                    textColor: UIColor.grey,
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(UIImage.star),
                  const SizedBox(
                    width: 5,
                  ),
                  const BasicText(text: '4.8'),
                  const SizedBox(
                    width: 5,
                  ),
                  const BasicText(
                    text: '(230)',
                    textColor: UIColor.grey,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: paddingHeight / 15,
                    left: paddingWidth,
                    right: paddingWidth),
                child: const Divider(),
              ),
              SizedBox(
                height: paddingHeight / 20,
              ),
              const Row(
                children: [
                  BasicText(
                    text: 'Description',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
               Row(
                children: [
                  Expanded(
                    child: BasicText(
                        textColor: UIColor.grey,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        text:
                          UIDescription.description[index]),
                  )
                ],
              ),
              SizedBox(
                height: paddingHeight / 20,
              ),
              const Row(
                children: [
                  BasicText(
                    text: 'Size',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: paddingHeight / 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerSize(
                    text: 'S',
                  ),
                  ContainerSize(text: 'M'),
                  ContainerSize(text: 'L')
                ],
              ),
             const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const BasicText(
                        text: 'Price',
                        fontSize: 20,
                        textColor: UIColor.grey,
                      ),
                      BasicText(
                        text: price,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: UIColor.loginButtonColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: paddingWidth,
                  ),
                  Expanded(
                    // Bu Expanded eklendi
                    child: CustomButton(
                      function: ()=>Get.to(()=> const OrderPage()),
                      height: paddingHeight / 4,
                      width: paddingWidth * 12,
                      text: 'Buy Now',
                      fontWeight: FontWeight.bold,
                      textColor: UIColor.white,
                      backgroundColor: UIColor.loginButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
