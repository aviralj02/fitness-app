import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DietItem extends StatelessWidget {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietItem(
      {super.key,
      required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
          color: boxColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(iconPath),
          Column(
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16),
              ),
              Text(
                '$level | $duration | $calorie',
                style: const TextStyle(
                    color: Color(0xff7B6F72),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                  viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                ]),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'View',
                style: TextStyle(
                    color:
                        viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
