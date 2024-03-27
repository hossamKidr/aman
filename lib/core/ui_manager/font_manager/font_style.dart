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

TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.regular,
    color,
  );
}

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

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.semiBold,
    color,
  );
}

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
