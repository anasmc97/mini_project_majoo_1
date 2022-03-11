import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/shared/theme.dart';
import 'package:mini_project_1/ui/widgets/navtile.dart';
import 'package:mini_project_1/ui/widgets/widgets.dart';
import 'package:mini_project_1/shared/context_extention.dart';

class HomePage extends StatelessWidget {
  final TypeLayout typeLayout;
  const HomePage({Key? key, this.typeLayout = TypeLayout.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: CustomSize.defaultMargin, top: 20),
              child: SearchField(
                height: context.finalHeight * 0.15,
                width: context.mediaWidth - (CustomSize.defaultMargin * 2),
                hintText: "Search Your Topic...",
                textStyle: CustomTheme.lightTheme.textTheme.bodyText1,
                color: CustomColors.searchBarColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.mediaHeight - 239.600),
              child: NavBar(
                [
                  NavTile(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 30,
                  ),
                  NavTile(
                    Icons.access_alarm,
                    color: Colors.white,
                    size: 30,
                  ),
                  NavTile(
                    Icons.access_time,
                    color: Colors.white,
                    size: 30,
                  ),
                  NavTile(
                    Icons.accessibility,
                    color: Colors.white,
                    size: 30,
                  )
                ],
                height: context.finalHeight * 0.15,
                width: context.mediaWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
