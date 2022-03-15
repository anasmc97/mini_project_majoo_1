import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class Product {
  String? productName;
  String? productDesc;
  String? productRating;
  String? totalRating;
  String? productPrice;
  String? image;
  Color? backgroundColor;

  Product(
      {this.productName,
      this.productDesc,
      this.productRating,
      this.totalRating,
      this.productPrice,
      this.image,
      this.backgroundColor});
}

List<Product> listProduct = [
  Product(
      productName: 'Standard Drone Camera',
      productDesc: 'Package Weight: 235g',
      productRating: '4.9',
      totalRating: '542',
      productPrice: '86',
      image: 'assets/image 37.png',
      backgroundColor: CustomColors.backgroundImage1),
  Product(
      productName: '3D flip Drone Camera',
      productDesc: 'Product weight: 70g',
      productRating: '4.8',
      totalRating: '497',
      productPrice: '78',
      image: 'assets/image 35.png',
      backgroundColor: CustomColors.backgroundImage2),
  Product(
      productName: 'Remote Control Drone',
      productDesc: 'Wrist Remote Control',
      productRating: '3.2',
      totalRating: '21',
      productPrice: '43',
      image: 'assets/image 351.png',
      backgroundColor: CustomColors.backgroundImage3),
];
