import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class HomePage extends StatelessWidget {
  final TypeLayout typeLayout;
  const HomePage({Key? key, this.typeLayout = TypeLayout.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
