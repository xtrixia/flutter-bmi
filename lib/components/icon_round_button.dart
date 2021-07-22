import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onClick});

  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: CircleBorder(),
        fillColor: kTextInactiveColor,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        onPressed: onClick,
        child: Icon(icon));
  }
}
