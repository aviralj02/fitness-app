import 'package:fitness/widgets/category_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // we may also replace the Map generic with a Class object.
  List<Map<String, dynamic>> _categories = [];

  Future<void> _getCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _categories = [
        {
          'name': 'Salad',
          'iconPath': 'assets/icons/plate.svg',
          'boxColor': Color(0xff9DCEFF)
        },
        {
          'name': 'Cake',
          'iconPath': 'assets/icons/pancakes.svg',
          'boxColor': Color(0xffEEA4CE)
        },
        {
          'name': 'Pie',
          'iconPath': 'assets/icons/pie.svg',
          'boxColor': Color(0xff9DCEFF)
        },
        {
          'name': 'Smoothies',
          'iconPath': 'assets/icons/orange-snacks.svg',
          'boxColor': Color(0xffEEA4CE)
        }
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }
  // just like useEffect in React

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 140,
          child: ListView.separated(
            itemCount: _categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              Map<String, dynamic> category = _categories[index];

              return CategoryItem(
                name: category['name'],
                iconPath: category['iconPath'],
                boxColor: category['boxColor'],
              );
            },
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }
}
