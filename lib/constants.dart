import 'package:flutter/material.dart';

const double kDefaultFontSize = 20.0;
Decoration kBoxDecoration = BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white, boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 4,
    offset: const Offset(0, 2),
  ),
]);
