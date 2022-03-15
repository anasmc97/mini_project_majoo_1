import 'package:flutter/material.dart';
import 'package:mini_project_1/models/product.dart';
import 'package:mini_project_1/ui/widgets/product_card.dart';

class ListProductCard extends StatelessWidget {
  final Function(Product) onTap;
  final double? width;
  final double? height;
  const ListProductCard(
      {Key? key, this.width, this.height, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> listProductData = listProduct;

    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
        itemCount: listProductData.length,
        itemBuilder: (BuildContext context, int index) {
          final Product data = listProductData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: GestureDetector(
              onTap: onTap(data),
              child: ProductCard(
                productName: data.productName,
                productDesc: data.productDesc,
                productRating: data.productRating,
                totalRating: data.totalRating,
                productPrice: data.productPrice,
                imageUrl: data.image,
                color: data.backgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
