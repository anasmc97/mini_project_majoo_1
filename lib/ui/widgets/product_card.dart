import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class ProductCard extends StatelessWidget {
  final String? imageUrl;
  final Color? color;
  final String? productName;
  final String? productDesc;
  final String? productRating;
  final String? totalRating;
  final String? productPrice;
  const ProductCard({
    Key? key,
    this.imageUrl,
    this.color,
    this.productName,
    this.productDesc,
    this.productRating,
    this.totalRating,
    this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 14, left: 14, right: 20, bottom: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ProductImage(
              imageUrl: imageUrl,
              color: color,
            ),
            const SizedBox(
              width: 20,
            ),
            _ProductBody(
              productDesc: productDesc,
              productName: productName,
              productRating: productRating,
              totalRating: totalRating,
              productPrice: productPrice,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? imageUrl;
  final Color? color;
  const _ProductImage({
    Key? key,
    this.color,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        child: Image.asset(
          imageUrl ?? 'assets/image 22.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductBody extends StatelessWidget {
  final String? productName;
  final String? productDesc;
  final String? productRating;
  final String? totalRating;
  final String? productPrice;
  const _ProductBody({
    Key? key,
    this.productName,
    this.productDesc,
    this.productRating,
    this.totalRating,
    this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName ?? '',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                productDesc ?? '',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFF5B901)),
                  const SizedBox(width: 10.0),
                  Text(
                    productRating ?? '',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    '($totalRating)',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              Text(
                '\$$productPrice',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: CustomColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
