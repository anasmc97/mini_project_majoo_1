import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 480) {
        return const HomePage(
          typeLayout: TypeLayout.portrait,
        );
      } else {
        return const HomePage(
          typeLayout: TypeLayout.landscape,
        );
      }
    });
  }
}
