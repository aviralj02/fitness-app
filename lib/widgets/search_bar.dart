import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreakfastSearchBar extends StatelessWidget {
  const BreakfastSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1d1616).withOpacity(0.11),
          spreadRadius: 0.0,
          blurRadius: 40,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Breakfast',
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          contentPadding: const EdgeInsets.all(15),
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Filter.svg'),
                ),
              ]),
            ),
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
