import 'package:flutter/material.dart';
import 'base_colors.dart';

class AppColors implements BaseColors{
  Map<int, Color> _primary =
  {
    50:Colors.teal.shade50,
    100:Colors.teal.shade100,
    200:Colors.teal.shade200,
    300:Colors.teal.shade300,
    400:Colors.teal.shade400,
    500:Colors.teal.shade500,
    600:Colors.teal.shade600,
    700:Colors.teal.shade700,
    800:Colors.teal.shade800,
    900:Colors.teal.shade900,
  };

  @override
  MaterialColor get colorAccent => MaterialColor(0xFF795548, _primary);

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFF009688, _primary);

  @override
  Color get colorText => const Color(0xFFFFFFFF);

  @override
  Color get colorPrimaryText => const Color(0xFF212121);

  @override
  Color get colorSecondaryText => const Color(0xFF757575);

  @override
  Color get colorAppbarTitle => const Color(0xff4f2b51);

  @override
  Color get colorLink => const Color(0xff7c06ec);

  @override
  Color get colorBG => const Color(0xffefefef);



  final gradientList = <List<Color>>[
    [
      Colors.green,
      Colors.yellow,
    ],
    [
      Colors.red,
      Colors.blue,
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Color get hintTextColor => Colors.black12;

  @override
  Color get colorEarningNavigationIcon => Colors.green.shade400;

  @override
  Color get colorExpenseNavigationIcon => Colors.red.shade400;

}