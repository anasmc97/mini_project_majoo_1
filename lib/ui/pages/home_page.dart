import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/context_extension.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final TypeLayout typeLayout;
  const HomePage({Key? key, this.typeLayout = TypeLayout.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavBar(
          [
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/home.png"),
                  color: Colors.white,
                ),
                activeIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage("assets/selected.png"),
                      size: context.finalHeight * 0.05,
                      color: Colors.white,
                    ),
                    const ImageIcon(AssetImage("assets/home.png"),
                        color: CustomColors.selectedIconColor),
                  ],
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/Heart.png"),
                  color: Colors.white,
                ),
                activeIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage("assets/selected.png"),
                      size: context.finalHeight * 0.05,
                      color: Colors.white,
                    ),
                    const ImageIcon(AssetImage("assets/Heart.png"),
                        color: CustomColors.selectedIconColor),
                  ],
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/wallet.png"),
                  color: Colors.white,
                ),
                activeIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage("assets/selected.png"),
                      size: context.finalHeight * 0.05,
                      color: Colors.white,
                    ),
                    const ImageIcon(AssetImage("assets/wallet.png"),
                        color: CustomColors.selectedIconColor),
                  ],
                ),
                label: "Top Up"),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/profile.png"),
                  color: Colors.white,
                ),
                activeIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage("assets/selected.png"),
                      size: context.finalHeight * 0.05,
                      color: Colors.white,
                    ),
                    const ImageIcon(AssetImage("assets/profile.png"),
                        color: CustomColors.selectedIconColor),
                  ],
                ),
                label: "Profile")
          ],
          height: context.finalHeight * 0.10,
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: context.finalHeight * 0.04, left: CustomSize.defaultMargin),
          child: SearchTextField(
            suffixIcon: const ImageIcon(
              AssetImage("assets/Voice.png"),
              color: CustomColors.searchIconColor,
            ),
            prefixIcon: const ImageIcon(
              AssetImage("assets/search.png"),
              color: CustomColors.searchIconColor,
            ),
            color: CustomColors.searchBarColor,
            width: context.mediaWidth - (CustomSize.defaultMargin * 2),
            hintText: "Search your Topic ...",
            textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w400, color: CustomColors.fontSecondary),
          ),
        ),
      ),
    );
  }
}
