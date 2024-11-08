import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class ContainerCoffeeOrder extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String image;
  final Function function;

  const ContainerCoffeeOrder({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.function,
  });

  @override
  State<ContainerCoffeeOrder> createState() => _ContainerCoffeeOrderState();
}

class _ContainerCoffeeOrderState extends State<ContainerCoffeeOrder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
         
         widget.function();
        },
        child: Container(
          child: Row(
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
              Column(children: [BasicText(text: widget.title),BasicText(text: widget.subTitle),],),
              SizedBox(width: width,),
              Icon(Icons.remove),
              BasicText(text: '1'),
              Icon(Icons.add)
            
            ],
          ),
        ),
      ),
    );
  }
}
