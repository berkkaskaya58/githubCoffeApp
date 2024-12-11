import 'package:coffee_shop_app/ui/ui_color/index.dart';
import 'package:coffee_shop_app/ui/ui_image/index.dart';
import 'package:coffee_shop_app/view/detail_page_view/index.dart';
import 'package:coffee_shop_app/widget/container_coffee_widget/index.dart';
import 'package:coffee_shop_app/widget/container_text_widget/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  final List<String> duplicateItems = [
    'Caffe Mocha',
    'Flat White',
    'Americano',
    'Caramel Macchiato',
    'Latte',
  ];

  List<String> items = [];

  @override
  void initState() {
    super.initState();
    items = List.from(duplicateItems);
  }

  void showAllCoffees() {
    setState(() {
      items = List.from(duplicateItems);
    });
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        items = duplicateItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      showAllCoffees();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.05;
    double height = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          // Background color setup
          Column(
            children: [
              Expanded(flex: 2, child: Container(color: UIColor.black)),
              Expanded(flex: 3, child: Container(color: UIColor.white)),
            ],
          ),
          // Search TextField
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.17, // Yüksekliği daha esnek hale getirin
            left: width,
            right: width,
            child: TextField(
              controller: controller,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                hintText: 'Ara',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          // Coffee Shop Image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28, // Dinamik yükseklik
            left: width,
            right: width,
            child: Image.asset(
              UIImage.onFree,
              fit: BoxFit.cover,
            ),
          ),
          // Coffee Type Filter Buttons
          Positioned(
            top: height * 9.5, // Dinamik yükseklik
            left: width,
            right: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCoffeeTypeButton('All Coffee', showAllCoffees),
                  _buildCoffeeTypeButton('Macchiato',
                      () => _updateCoffeeList(['Caramel Macchiato'])),
                  _buildCoffeeTypeButton(
                      'Latte', () => _updateCoffeeList(['Latte'])),
                  _buildCoffeeTypeButton(
                      'Americano', () => _updateCoffeeList(['Americano'])),
                ],
              ),
            ),
          ),
          // Coffee Grid View
          Positioned(
            top: MediaQuery.of(context).size.height * 0.53, // Dinamik yükseklik
            left: width,
            right: width,
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0, // Daha küçük boşluk (yükseklik boşluğu)
                  crossAxisSpacing:
                      width, // Daha küçük boşluk (genişlik boşluğu)
                  mainAxisExtent:
                      360, // Öğelerin yüksekliğini biraz daha düşük tutuyoruz
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildCoffeeItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeTypeButton(String text, VoidCallback function) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0), // Spacing between buttons
      child: ContainerText(
        text: text,
        // backgroundColor: UIColor.white,
        // textColor: UIColor.black,
        function: function,
      ),
    );
  }

  void _updateCoffeeList(List<String> coffeeList) {
    setState(() {
      items = coffeeList;
    });
  }

  Widget _buildCoffeeItem(int index) {
    String coffeeTitle = items[index];
    String imagePath = '';
    String subTitle = 'Deep Form';
    double price = 0.00;

    switch (coffeeTitle) {
      case 'Caffe Mocha':
        imagePath = UIImage.coffee4;
        price = 4.53;
        break;
      case 'Flat White':
        imagePath = UIImage.coffee3;
        price = 3.53;
        break;
      case 'Americano':
        imagePath = UIImage.coffee2;
        price = 4.53;
        break;
      case 'Caramel Macchiato':
        imagePath = UIImage.coffee1;
        price = 4.53;
        break;
      case 'Latte':
        imagePath = UIImage.coffee3;
        price = 8.53;
        break;
      default:
        break;
    }

    return ContainerCoffee(
      title: coffeeTitle,
      subTitle: subTitle,
      price: price,
      image: imagePath,
      function: () {
        Get.to(
          () => DetailPage(
            imagePath: imagePath,
            text: coffeeTitle,
            price: price,
            index: index,
          ),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 200),
        );
      },
    );
  }
}
