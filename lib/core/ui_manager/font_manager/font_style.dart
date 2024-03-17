import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../app_size/app_font_size.dart';
import 'font_weight.dart';


TextStyle _getTextStyle(
    double? fontSize,
    FontWeight fontWeight,
    Color color,
    ) {
  return TextStyle(
      fontSize: fontSize ?? AppFontSize.f12,
      fontWeight: fontWeight,
      fontFamily: Constants.fontFamily,
      color: color);
}

// light style
TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.light,
    color,
  );
}


// medium style
TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.medium,
    color,
  );
}


// bold style
TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.bold,
    color,
  );
}