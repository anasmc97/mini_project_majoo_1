import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class DrawerItem extends StatelessWidget {
  String text;
  Widget icon;
  GestureTapCallback? onTap;
  DrawerItem(this.text, this.icon, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: CustomColors.fontThird,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
