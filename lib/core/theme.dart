import 'package:flutter/material.dart';

Color colorOne = const Color(0xFF1f5567);
Color colorTwo = const Color(0xFF2d958e);
Color colorButton = const Color(0xFF44bd6e);

BoxDecoration backgroundPage = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [colorOne, colorTwo],
  ),
);
