import 'package:flutter/material.dart';

class AppSize {
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double width(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
}
