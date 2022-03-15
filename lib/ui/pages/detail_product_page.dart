import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/context_extension.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/ui/widgets/detail_body_product.dart';
import 'package:mini_project_1/ui/widgets/slider.dart';

class DetailProductPage extends StatelessWidget {
  final List<String> imgList;
  final String? productName;
  final String? productDescription;
  final String? productPrice;

  const DetailProductPage(
      {Key? key,
      this.imgList = const [
        "assets/image 22 big.png",
        "assets/image 22 big.png",
        "assets/image 35.png",
        "assets/image 37.png",
      ],
      this.productDescription,
      this.productName,
      this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: context.mediaWidth,
        height: context.finalHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final type = constraints.maxWidth >= CustomSize.maxWidthLayout
                ? TypeLayout.landscape
                : TypeLayout.portrait;
            final widgetSlider = SliderWidgetImage(
              typeLayout: type,
              imgList: imgList,
              onBack: () {
                Navigator.of(context).pop();
              },
              onFavorite: () {},
            );
            final detailBody = DetailBodyProduct(
                productName: productName,
                productDescription: productDescription,
                productPrice: productPrice);

            if (constraints.maxWidth >= CustomSize.maxWidthLayout) {
              return Row(
                children: [
                  widgetSlider,
                  Flexible(child: detailBody),
                ],
              );
            } else {
              return Column(
                children: [
                  widgetSlider,
                  Expanded(child: detailBody),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
