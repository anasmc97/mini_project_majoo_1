import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class Product {
  String productName;
  String productDesc;
  String productRating;
  String totalRating;
  String productPrice;
  String image;
  Color backgroundColor;

  Product(this.productName, this.productDesc, this.productRating,
      this.totalRating, this.productPrice, this.image, this.backgroundColor);
}

List<Product> listProduct = [
  Product('Standard Drone Camera', 'Package Weight: 235g', '4.9', '542', '86',
      'assets/image 37.png', CustomColors.backgroundImage1),
  Product('3D flip Drone Camera', 'Product weight: 70g', '4.8', '497', '78',
      'assets/image 35.png', CustomColors.backgroundImage2),
  Product('Remote Control Drone', 'Wrist Remote Control', '3.2', '21', '43',
      'assets/image 351.png', CustomColors.backgroundImage3)
];
