import 'package:fitness/widgets/popular_item.dart';
import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  // we may also replace the Map generic with a Class object.
  List<Map<String, dynamic>> _popular = [];
  int _selectedItem = 0;

  Future<void> _getPopularItems() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _popular = [
        {
          'name': 'Blueberry Pancake',
          'iconPath': 'assets/icons/blueberry-pancake.svg',
          'level': 'Medium',
          'duration': '30mins',
          'calorie': '230kCal',
        },
        {
          'name': 'Salmon Nigiri',
          'iconPath': 'assets/icons/salmon-nigiri.svg',
          'level': 'Easy',
          'duration': '20mins',
          'calorie': '120kCal',
        },
      ];
    });
  }

  void _toggleSelection(int i) {
    setState(() {
      _selectedItem = i;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPopularItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemCount: _popular.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            final popularItem = _popular[index];
            return PopularItem(
              name: popularItem['name'],
              iconPath: popularItem['iconPath'],
              level: popularItem['level'],
              duration: popularItem['duration'],
              calorie: popularItem['calorie'],
              currentIndex: index,
              selectedIndex: _selectedItem,
              onTap: () => _toggleSelection(index),
            );
          },
        )
      ],
    );
  }
  // just like useEffect in React
}
