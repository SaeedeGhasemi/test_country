import 'package:flutter/material.dart';
import 'package:test_contries/core/constants/colors.dart';

final lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: white_Elements_Text,
  onPrimary: dark_Blue_Text,
  secondary: dark_Grey_Input,
  onSecondary: white_Elements_Text,
  error: white_Elements_Text,
  onError: white_Elements_Text,
  surface: light_Grey_BackGround,
  onSurface: dark_Blue_Text,
);

final darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: dark_Blue_Elements,
  onPrimary: white_Elements_Text,
  secondary: dark_Grey_Input,
  onSecondary: white_Elements_Text,
  error: dark_Grey_Input,
  onError: dark_Grey_Input,
  surface: dark_Blue_BackGround,
  onSurface: white_Elements_Text,
);
