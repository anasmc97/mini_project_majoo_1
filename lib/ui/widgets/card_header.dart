import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/context_extention.dart';
import 'package:mini_project_1/shared/shared_value.dart';

enum TypeCardView{
  portrait,
  landscape
}

class CardHeaderPromo extends StatelessWidget {
  final TypeCardView typeCardView;
  final String? stringTitle;
  final String? stringRating;
  final String urlImage;
  final double? heightContent;
  final EdgeInsets margin;
  const CardHeaderPromo({
    Key? key,
    this.typeCardView = TypeCardView.portrait,
    this.stringRating,
    this.stringTitle,
    this.heightContent,
    this.urlImage = "assets/image 22.png",
    this.margin = const EdgeInsets.all(CustomSize.defaultMargin)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeTitle = 25;
    double sizeTextRating = 12.5;
    double sizeStar = 15;
    double widthBgContainer = context.mediaWidth;
    double? widthButton;
    bool isLandscape = typeCardView == TypeCardView.landscape;
    if(isLandscape) {
      widthBgContainer = context.mediaWidth * 0.4;
      sizeTitle = 30;
      sizeTextRating = 15;
      sizeStar = 17.5;
      widthButton = widthBgContainer;
    }

    final decorationCard = BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 1),
              spreadRadius: 0.5,
              blurRadius: 0.5)
        ],
        gradient: const RadialGradient(colors: [
          CustomColors.secondary,
          CustomColors.primary,
        ],
            center: Alignment(0.4, 0.4),
            radius: 1.5
          //focalRadius: 1.5,
        ));

    final ratingWidget = Row(
      children: [
        Container(
          child: Icon(
            Icons.star,
            color: CustomColors.starColor,
            size: sizeStar * context.media.textScaleFactor,
          ),
          margin: const EdgeInsets.symmetric(
              vertical: 8
          ),
        ),
        Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: _buildText(context, stringRating, sizeTextRating, Colors.white),
            )
        ),

      ],
    );
    final buttonPurchase = Container(
      width: widthButton,
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            primary: Colors.white,
          ),
          child: _buildText(context, "Buy Now", sizeTextRating, CustomColors.primary)
      ),
    );

    return Builder(
      builder: (context) {
        const padding = EdgeInsets.all(24);

        final landscapeWidget = Container(
          margin: margin,
          padding: padding,
          decoration: decorationCard,
          width: widthBgContainer,
          height: heightContent,
          //height: (context.mediaHeight - 24 - CustomSize.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: widthBgContainer,
                  child: Image.asset(urlImage),
                ),
              ),
              _buildText(context,
                  (stringTitle.toString().isNotEmpty && stringTitle.toString().length > 18) ? "${stringTitle?.substring(0, 17)}...": stringTitle,
                  sizeTitle,
                  Colors.white
              ),
              ratingWidget,
              buttonPurchase
            ],
          ),
        );
        if(isLandscape) {
          return landscapeWidget;
        }

        return Container(
          margin: margin,
          padding: padding,
          decoration: decorationCard,
          child: Stack(
            children: [
              SizedBox(
                width: widthBgContainer,
                child: Row(
                  children: [
                    SizedBox(
                      width: widthBgContainer * 0.3,
                    ),
                    Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Image.asset(urlImage),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(
                width: widthBgContainer * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(context, stringTitle, sizeTitle, Colors.white),
                    ratingWidget,
                    buttonPurchase
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildText(
      BuildContext context, String? text, double? sizeText, Color colorText) {
    return Text(
      text ?? "",
      textScaleFactor: context.media.textScaleFactor.clamp(0.5, 1.0),
      style: TextStyle(
          fontSize: sizeText != null
              ? sizeText * context.media.textScaleFactor
              : sizeText,
          color: colorText,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.start,
    );
  }
}
