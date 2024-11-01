import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/view/detail_page_view/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ContainerCoffee extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;

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
                child: Image.asset(
                  width: width * 8,
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                BasicText(text: widget.title),
                BasicText(text: widget.subTitle, textColor: UIColor.grey),
              ],
            ),
            Row(
              children: [
                BasicText(text: widget.price),
                SizedBox(width: width * 4.5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Container(
                    color: UIColor.loginButtonColor,
                    child: const Icon(
                      Icons.add,
                      color: UIColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
