import 'package:flutter/material.dart';

hexColor(strHexColor) {
 return Color(int.parse(strHexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

const primaryColor = Colors.deepPurple;

class AppColor {
  final white = Colors.white;
  final black = Colors.black;
  final grey = Colors.grey;
  final mediumGrey = Colors.grey.shade300;
  final lightGrey = hexColor('#F4F4F4');
  final darkRed = const Color(0xFFB71C1C);
  final red = Colors.red;
  final mediumRed = Colors.red.shade300;
  final lightRed = Colors.red.shade100;
  final buttonColor = const Color(0xFFEF8934);
  final orange = const Color(0xFFFF8306);
  final mediumOrange = const Color(0xFFFF8306).withOpacity(.5);
  final lightOrange = const Color(0xFFFF8306).withOpacity(.1);
  final purple = const Color(0xFF293A92);
  final lightPurple = const Color(0xFF293A92).withOpacity(.2);
  final transparent = Colors.transparent;
  final green = const Color(0xFF15AB85);
  final blue = const Color.fromRGBO(28, 115, 171, 1);

  BoxShadow boxShadow() {
    return BoxShadow(
      color: mediumGrey,
      spreadRadius: 0,
      blurRadius: 3,
      offset: const Offset(0, 2),
    );
  }

  final slate700 = const Color(0xFF374151);
  final slate400 = const Color(0xFF9CA3AF);
  final slate500 = const Color(0xFF6B7280);
  final slate200 = const Color(0xFFE5E7EB);
  final slate600 = const Color(0xFF4B5563);
  final slate100 = const Color(0xFFF3F4F6);
}
