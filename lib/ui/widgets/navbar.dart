import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  double? width;
  double? height;
  List<Widget> icons;
  NavBar(this.icons, {Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF6E8DDD).withOpacity(0.4),
                const Color(0xFF5C7BCD).withOpacity(0.4)
              ]),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons,
      ),
    );
  }
}
