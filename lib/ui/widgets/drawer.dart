import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/ui/widgets/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerItem(
            'Home',
            const ImageIcon(AssetImage("assets/home.png"),
                color: CustomColors.primary),
            onTap: () => print('Tap Home'),
          ),
          DrawerItem(
            'Favorite',
            const ImageIcon(AssetImage("assets/Heart.png"),
                color: CustomColors.primary),
            onTap: () => print('Tap Heart'),
          ),
          DrawerItem(
            'Wallet',
            const ImageIcon(AssetImage("assets/wallet.png"),
                color: CustomColors.primary),
            onTap: () => print('Tap Wallet'),
          ),
          DrawerItem(
            'profile',
            const ImageIcon(AssetImage("assets/profile.png"),
                color: CustomColors.primary),
            onTap: () => print('Tap Profile'),
          ),
        ],
      ),
    );
  }
}
