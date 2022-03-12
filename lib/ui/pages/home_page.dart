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
          children: [],
        ),
      ),
    );
  }
}
