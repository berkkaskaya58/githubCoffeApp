import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/widget/basic_text_widget/index.dart';
import 'package:flutter/material.dart';

class ContainerSize extends StatefulWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor; 
  final String text;
  final bool onPressed;
  final Function? function;

  const ContainerSize({
    super.key,
    this.function,
    this.onPressed = false,
    this.backgroundColor,
    this.borderColor,
    required this.text,
    this.textColor = UIColor.black,
  });

  @override
  State<ContainerSize> createState() => _ContainerSizeState();
}

class _ContainerSizeState extends State<ContainerSize> {
  late bool _isPressed;

  @override
  void initState() {
    super.initState();
    _isPressed = widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.width * 0.05;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
       onTap: () {
  if (widget.function != null) {
    widget.function!(); // Eğer bu null değilse, işlev çalışır
    setState(() {
      _isPressed = !_isPressed; // Burada durumu güncelliyoruz
    });
  }
},

        child: Container(
          width: width * 3,
          height: height * 1.3,
          color: _isPressed ? UIColor.loginButtonColor : UIColor.white,
          child: Center( // Merkezde yerleştirmek için
            child: BasicText(
              textAlign: TextAlign.center,
              text: widget.text,
              textColor: _isPressed ? UIColor.white : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
