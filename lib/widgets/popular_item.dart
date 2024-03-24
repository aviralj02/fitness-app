import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularItem extends StatelessWidget {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  int currentIndex;
  int selectedIndex;
  VoidCallback onTap;

  PopularItem(
      {super.key,
      required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.currentIndex,
      required this.selectedIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color:
              currentIndex == selectedIndex ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: currentIndex == selectedIndex
              ? [
                  BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.07),
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0)
                ]
              : []),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 65,
            height: 65,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/button.svg',
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
