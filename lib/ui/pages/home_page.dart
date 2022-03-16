import 'package:flutter/material.dart';
import 'package:mini_project_1/models/product.dart';
import 'package:mini_project_1/shared/context_extension.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/ui/pages/detail_product_page.dart';
import 'package:mini_project_1/ui/widgets/card_promo.dart';
import 'package:mini_project_1/ui/widgets/drawer.dart';
import 'package:mini_project_1/ui/widgets/list_product_card.dart';
import 'package:mini_project_1/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final TypeLayout typeLayout;

  const HomePage({Key? key, this.typeLayout = TypeLayout.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            const goToPageCardPromo = DetailProductPage(
              productName: "Dji Phantom Drone",
              productPrice: "129",
              productDescription:
                  "The light socket and the different screens can cause the color of the item in the image to be a little different from the actual one.",
            );
            final cardPromoWidget = CardHeaderPromo(
              typeLayout: typeLayout,
              stringRating: "4.9 (542)",
              stringTitle: "Dji Phantom Drone",
              heightContent: typeLayout == TypeLayout.portrait
                  ? context.finalHeight * 0.4
                  : null,
              onPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => goToPageCardPromo));
              },
            );
            final widgetTextPopular = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular Drone",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See all",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: CustomColors.fontThird),
                ),
              ],
            );
            final listProductWidget = ListProductCard(
              height: context.finalHeight * 0.20,
              onTap: (product) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailProductPage(
                        productDescription: product.productDesc,
                        productName: product.productName,
                        productPrice: product.productPrice,
                      );
                    },
                  ),
                );
              },
            );
            final searchTextWidget = SearchTextField(
              suffixIcon: const ImageIcon(
                AssetImage("assets/Voice.png"),
                color: CustomColors.searchIconColor,
              ),
              prefixIcon: const ImageIcon(
                AssetImage("assets/search.png"),
                color: CustomColors.searchIconColor,
              ),
              color: CustomColors.searchBarColor,
              typeLayout: typeLayout,
              hintText: "Search your Topic ...",
              textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: CustomColors.fontSecondary),
            );
            final paddingSearch = EdgeInsets.only(
                top: context.finalHeight * 0.04,
                left: CustomSize.defaultMargin);

            if (typeLayout == TypeLayout.portrait) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: paddingSearch,
                          child: searchTextWidget,
                        ),
                        cardPromoWidget,
                        Padding(
                          padding: const EdgeInsets.only(
                              left: CustomSize.defaultMargin,
                              right: CustomSize.defaultMargin),
                          child: widgetTextPopular,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: context.finalHeight * 0.04),
                          child: SizedBox(
                            height: context.finalHeight *
                                0.20 *
                                (listProduct.length + 1),
                            child: listProductWidget,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: NavBar(
                      [
                        _buildNavBarItem(context, "Home", "assets/home.png"),
                        _buildNavBarItem(
                            context, "Favorite", "assets/Heart.png"),
                        _buildNavBarItem(
                            context, "Top Up", "assets/wallet.png"),
                        _buildNavBarItem(
                            context, "Profile", "assets/profile.png"),
                      ],
                      typeLayout,
                    ),
                  )
                ],
              );
            } else {
              return Row(
                children: [
                  SizedBox(
                    width: context.mediaWidth * 0.5,
                    child: Column(
                      children: [
                        Padding(
                          padding: paddingSearch,
                          child: searchTextWidget,
                        ),
                        Expanded(
                          child: cardPromoWidget,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: context.finalHeight * 0.04,
                              left: CustomSize.defaultMargin,
                              right: CustomSize.defaultMargin),
                          child: widgetTextPopular,
                        ),
                        Expanded(
                          child: listProductWidget,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      BuildContext context, String label, String assetName) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(assetName),
          color: Colors.white,
        ),
        activeIcon: Stack(
          alignment: Alignment.center,
          children: [
            ImageIcon(
              const AssetImage("assets/selected.png"),
              size: context.finalHeight * 0.05,
              color: Colors.white,
            ),
            ImageIcon(AssetImage(assetName),
                color: CustomColors.selectedIconColor),
          ],
        ),
        label: label);
  }
}
