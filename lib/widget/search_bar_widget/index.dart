import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    //  double paddingWidth = MediaQuery.of(context).size.width * 0.05;
    //     double paddingHeight = MediaQuery.of(context).size.width *0.55;
    return Scaffold(
      body: Row(
        children: [
          Image.asset(UIImage.search),
          const Padding(
            padding: EdgeInsets.all(100),
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
