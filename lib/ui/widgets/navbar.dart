import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/shared/context_extension.dart';

class NavBar extends StatefulWidget {
  //double? height;
  TypeLayout typeLayout;
  List<BottomNavigationBarItem> items;
  NavBar(this.items, this.typeLayout, {Key? key}) : super(key: key);
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return (widget.typeLayout == TypeLayout.landscape)
        ? Container(
            color: Colors.transparent,
          )
        : Opacity(
            opacity: 0.7,
            child: Container(
              //add navbar
              height: context.finalHeight * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CustomColors.navBarColor1.withOpacity(0.6),
                    CustomColors.navBarColor2.withOpacity(0.4)
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: BottomNavigationBar(
                items: widget.items,
                showSelectedLabels: false,
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(
                    () {
                      _selectedIndex = index;
                    },
                  );
                },
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                unselectedItemColor: Colors.white,
                selectedIconTheme:
                    const IconThemeData(color: CustomColors.selectedIconColor),
              ),
            ),
          );
  }
}
