import 'package:flutter/material.dart';

//COLORS
const kCardActiveColor = Color(0xFF1D1E33);
const kCardInactiveColor = Color(0xFF111328);
const kContainerBottomColor = Color(0xFFEB1555);
const kOverlaySliderColor = Color(0x40EB1555);
const kTextInactiveColor = Color(0xFF8D8E98);
const kTextColor = Colors.white;
//OTHERS
const kContainerBottomHeight = 80.0;
//STYLES
const kLabelTextStyle = TextStyle(fontSize: 24.0, color: kTextInactiveColor);
const kLabelButtonStyle =
    TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);
const kLabelHeadingStyle =
    TextStyle(fontSize: 80.0, fontWeight: FontWeight.w900);
const kLabelSubheadingStyle = TextStyle(
    fontSize: 28.0, fontWeight: FontWeight.bold, color: kContainerBottomColor);
const kLabelHighlightTextStyle =
    TextStyle(fontSize: 48.0, fontWeight: FontWeight.w900);
//ENUMS
const MAX_HEIGHT = 220.0;
const MIN_HEIGHT = 100.0;

enum Gender { female, male }
enum Weight { plus, minus }
enum Age { plus, minus }
