import 'package:coffee_shop_app/ui/ui_image/index.dart';
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
       int amount=0;

   void addAmont(){
    setState(() {
      amount++;
    });
  }
  void removeAmount(){
setState(() {
  amount--;
  if(amount <0){
    amount=0;
  }
});
  }
  @override
  Widget build(BuildContext context) {
 
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.15;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          widget.function();
        },
        child: Container(
          width: double.infinity,
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  UIImage.coffee2,
                  width: width * 5,
                  height: height, // Görsel yüksekliği
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width / 2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicText(text: widget.title),
                    BasicText(text: widget.subTitle),
                  ],
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                 
                  children: [
                    GestureDetector(
                      onTap:() => removeAmount(),
                      child: const Icon(Icons.remove)),
                    SizedBox(width: width / 2),
                    BasicText(text: '$amount'),
                    SizedBox(width: width / 2),
                    GestureDetector(
                      onTap: () => addAmont(),
                      child: const Icon(Icons.add)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
