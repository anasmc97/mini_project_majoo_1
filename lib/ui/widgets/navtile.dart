import 'package:flutter/material.dart';

class NavTile extends StatelessWidget {
  IconData icon;
  Color? color;
  double? size;
  NavTile(this.icon, {Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
