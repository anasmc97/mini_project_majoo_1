import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/ui/widgets/product_card.dart';

class ListProductCard extends StatelessWidget {
  final double? width;
  final double? height;
  const ListProductCard({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> data = [
      {
        'productName': 'Standard Drone Camera',
        'productDesc': 'Package Weight: 235g',
        'productRatting': '4.9',
        'totalRatting': '542',
        'productPrice': '86',
        'image': 'assets/image 37.png',
        'backgroundColor': CustomColors.backgroundImage1,
      },
      {
        'productName': '3D flip Drone Camera',
        'productDesc': 'Product weight: 70g',
        'productRatting': '4.8',
        'totalRatting': '497',
        'productPrice': '78',
        'image': 'assets/image 35.png',
        'backgroundColor': CustomColors.backgroundImage2,
      },
      {
        'productName': 'Remote Control Drone',
        'productDesc': 'Wrist Remote Control',
        'productRatting': '3.2',
        'totalRatting': '21',
        'productPrice': '43',
        'image': 'assets/image 351.png',
        'backgroundColor': CustomColors.backgroundImage3,
      },
    ];

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: SizedBox(
            width: width,
            height: height,
            child: GestureDetector(
              onTap: () {},
              child: ProductCard(
                productName: data[index]['productName'],
                productDesc: data[index]['productDesc'],
                productRatting: data[index]['productRatting'],
                totalRatting: data[index]['totalRatting'],
                productPrice: data[index]['productPrice'],
                imageUrl: data[index]['image'],
                color: data[index]['backgroundColor'],
              ),
            ),
          ),
        );
      },
    );
  }
}
