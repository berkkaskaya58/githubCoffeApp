import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerCoffee extends StatefulWidget {
  final String title;
  final String subTitle;
  final double price;
  final String image;
  final Function function;

  const ContainerCoffee({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.function,
  });

  @override
  State<ContainerCoffee> createState() => _ContainerCoffeeState();
}

class _ContainerCoffeeState extends State<ContainerCoffee> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double imageWidth = MediaQuery.of(context).size.width * 0.35;  // Resmin genişliğini dinamik hale getirdik
    double imageHeight = MediaQuery.of(context).size.height * 0.2; // Resmin yüksekliğini de dinamik yaptık

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          widget.function();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: imageWidth*2,  // Resmin genişliğini dinamik yapıyoruz
                height: imageHeight,  // Resmin yüksekliğini dinamik yapıyoruz
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,  // Resmin orantılı şekilde yerleşmesini sağlıyoruz
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  BasicText(text: widget.title),
                  BasicText(text: widget.subTitle, textColor: UIColor.grey),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  BasicText(text: '${widget.price}'),
                  SizedBox(width: width * 4.5),
                  GestureDetector(
                    onTap: () => setState(() {
                      amount++;
                      Get.snackbar('BAŞARILI', 'Ürün Sepete Eklendi', snackPosition: SnackPosition.TOP);
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Container(
                        color: UIColor.loginButtonColor,
                        child: const Icon(
                          Icons.add,
                          color: UIColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
