import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/shared/theme.dart';
import 'package:mini_project_1/ui/widgets/navtile.dart';
import 'package:mini_project_1/ui/widgets/widgets.dart';
import 'package:mini_project_1/shared/context_extension.dart';

class HomePage extends StatelessWidget {
  final TypeLayout typeLayout;
  const HomePage({Key? key, this.typeLayout = TypeLayout.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
 task/Slider_widget
    return Scaffold(
      body: Column(
        children: [
          SliderWidgetImage(
            typeLayout: typeLayout,
            heightContent: context.finalHeight * 0.5,
            imgList: const [
              "assets/image 22 big.png",
              "assets/image 22 big.png",
              "assets/image 22 big.png",
            ],
            onBack: () {},
            onFavorite: () {},
          ),
          // const CardHeaderPromo(
          //   stringRating: "4.9 (542)",
          //   stringTitle: "Dji Phantom Drone",
          // )
        ],
      ),
    );
  }
}
