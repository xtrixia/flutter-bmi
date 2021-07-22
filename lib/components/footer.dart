import 'package:flutter/material.dart';

import '../constants.dart';

class Footer extends StatelessWidget {
  Footer({@required this.label, this.onClick});

  final String label;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        color: kContainerBottomColor,
        height: kContainerBottomHeight,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            label,
            style: kLabelButtonStyle,
          ),
        ),
      ),
    );
  }
}
