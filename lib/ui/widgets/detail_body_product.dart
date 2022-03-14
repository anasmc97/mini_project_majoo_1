import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/context_extention.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class DetailBodyProduct extends StatelessWidget {
  final String? productName;
  final String? productDescription;
  final String? productPrice;
  const DetailBodyProduct({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ProductName(productName: productName),
          _ProductDescription(productDescription: productDescription),
          const _IncrementDecrementButton(),
          _AddToCartButton(
            productPrice: productPrice,
          ),
        ],
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  final String? productName;
  const _ProductName({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      productName!,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String? productDescription;
  const _ProductDescription({Key? key, required this.productDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      productDescription!,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontWeight: FontWeight.normal),
    );
  }
}

class _IncrementDecrementButton extends StatelessWidget {
  const _IncrementDecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isPortrait
          ? context.mediaWidth * 0.5
          : context.mediaWidth * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    CustomColors.secondary,
                    CustomColors.primary,
                  ],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.remove,
                color: CustomColors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CustomColors.white,
              border: Border.all(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '01',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: CustomColors.black),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    CustomColors.secondary,
                    CustomColors.primary,
                  ],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.add,
                color: CustomColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  final String? productPrice;
  const _AddToCartButton({Key? key, required this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? double.infinity
          : MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            CustomColors.secondary,
            CustomColors.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Add to cart $productPrice',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
