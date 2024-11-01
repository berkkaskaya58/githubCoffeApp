import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Function function;
final double? width;
final double? height;
final double? fontSize;
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      required this.function});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: GestureDetector(
            onTap: () {
              widget.function!();
            },
            child: Container(
              color: widget.backgroundColor ?? UIColor.grey,
              alignment: Alignment.center,
              child: BasicText(
                fontSize: widget.fontSize??18,
                fontWeight: widget.fontWeight ?? FontWeight.normal,
                backgroundColor: widget.backgroundColor,
                textColor: widget.textColor ?? UIColor.white,
                text: widget.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
