import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get sbh => SizedBox(height: toDouble());
  SizedBox get sbw => SizedBox(width: toDouble());
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  TextTheme get textTheme => theme.textTheme;
}
