import 'package:fitness/widgets/diet_item.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  // we may also replace the Map generic with a Class object.
  List<Map<String, dynamic>> _diets = [];

  Future<void> _getDiets() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _diets = [
        {
          'name': 'Honey Pancake',
          'iconPath': 'assets/icons/honey-pancakes.svg',
          'level': 'Easy',
          'duration': '30mins',
          'calorie': '180kCal',
          'viewIsSelected': true,
          'boxColor': Color(0xff9DCEFF)
        },
        {
          'name': 'Canai Bread',
          'iconPath': 'assets/icons/canai-bread.svg',
          'level': 'Easy',
          'duration': '20mins',
          'calorie': '230kCal',
          'viewIsSelected': false,
          'boxColor': Color(0xffEEA4CE)
        },
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _getDiets();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final diet = _diets[index];
              return DietItem(
                name: diet['name'],
                iconPath: diet['iconPath'],
                level: diet['level'],
                duration: diet['duration'],
                calorie: diet['calorie'],
                boxColor: diet['boxColor'],
                viewIsSelected: diet['viewIsSelected'],
              );
            },
            padding: EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: _diets.length,
          ),
        )
      ],
    );
  }
}
