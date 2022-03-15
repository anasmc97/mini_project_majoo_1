//add slider
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/context_extension.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class SliderWidgetImage extends StatefulWidget {
  final TypeLayout typeLayout;
  final double heightContent;
  final List<String> imgList;
  final GestureTapCallback? onBack;
  final GestureTapCallback? onFavorite;
  const SliderWidgetImage({Key? key,
    this.typeLayout = TypeLayout.portrait,
    this.heightContent = 100,
    this.imgList = const [
      "assets/image 22 big.png",
      "assets/image 22 big.png",
      "assets/image 22 big.png",
    ],
    this.onBack,
    this.onFavorite
  }) : super(key: key);

  @override
  State<SliderWidgetImage> createState() =>  _SliderWidgetImage();

}

class _SliderWidgetImage extends State<SliderWidgetImage> {

  int _current = 0;
  final CarouselController _controller = CarouselController();

  final AutoScrollController _scrollController = AutoScrollController();
  final scrollDirection = Axis.horizontal;

  void _onChange(int index) {
    _current = index;
    _scrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.middle);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    TypeLayout typeLayout = widget.typeLayout;
    double widthBgContainer = context.mediaWidth;
    double heightContainer = context.finalHeight * 0.5;
    double sizeDot = 22;
    bool isLandscape = typeLayout == TypeLayout.landscape;
    double widthBackButton = widthBgContainer - (24 * 2);

    if(heightContainer < context.finalHeight * 0.4){
      heightContainer = context.finalHeight * 0.4;
    }
    double heightImg = heightContainer * 0.4;
    double paddingTopImg = heightImg * 0.8;

    EdgeInsets paddingContainer = const EdgeInsets.symmetric(horizontal: 24);
    if(isLandscape) {
      widthBgContainer = context.mediaWidth * 0.45;
      heightContainer = context.finalHeight;
      widthBackButton = widthBgContainer - (24*2);
      heightImg = heightContainer * 0.4;
      paddingTopImg = heightImg * 0.8;
      paddingContainer = EdgeInsets.only(
          right: (context.media.padding.horizontal/2)
      );
    }

    final decorationCard = _buildDecoration(
        isLandscape,
        [
          CustomColors.secondary,
          CustomColors.primary
        ]
    );

    final List<String> imgList = widget.imgList;
    final List<Widget> imageSliders = imgList.map((item) =>
        SizedBox(
          height: 20,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            child: ClipRRect(
              child: Image.asset(
                item,
                width: widthBgContainer,
              ),
            ),
          ),
        )).toList();

    final backButton = _buildBackButton(isLandscape, widthBackButton);

    return Container(
      padding: paddingContainer,
      decoration: decorationCard,
      height: heightContainer,
      width: widthBgContainer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            right: false,
            bottom: false,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: isLandscape ? paddingTopImg : paddingTopImg - context.media.padding.top,
                        bottom: heightImg * 0.2
                    ),
                    height: heightImg,
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) => setState(() => _onChange(index)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: heightImg * 0.02),
                    width: widthBgContainer * 0.3,
                    child: SingleChildScrollView(
                      scrollDirection: scrollDirection,
                      controller: _scrollController,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return AutoScrollTag(
                            controller: _scrollController,
                            index: entry.key,
                            key: ValueKey(entry.key),
                            child: Container(
                              width: sizeDot,
                              height: sizeDot,
                              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _current == entry.key ? Colors.white : Colors.transparent
                                ),
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.white,
                                    _current == entry.key ? Colors.white.withOpacity(0.2) : Colors.transparent
                                  ],
                                  stops: const [0.2, 0.25],
                                  radius: 1.0,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ) ,
                    ),
                  ),
                ],
            ),
          ),
          Positioned(
            top: 0,
            child: backButton,
          )
        ],
      ),
    );
  }

  Widget _buildButton(IconData? icons, GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white)
        ),
        child: Icon(
          icons,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(bool isLandscape, List<Color> gradientsColor) {
    return BoxDecoration(
        borderRadius:  BorderRadius.only(
          bottomLeft: !isLandscape ? const Radius.circular(16) : const Radius.circular(0),
          bottomRight: const Radius.circular(16),
          topRight: isLandscape ? const Radius.circular(16) : const Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
              color: CustomColors.sliderShadowColor.withOpacity(0.5),
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 20
          )
        ],
        gradient: RadialGradient(
            colors: gradientsColor,
            radius: 1.5
        )
    );
  }

  Widget _buildBackButton(bool isLandscape, double widthBackButton) {
    return SafeArea(
      child: Container(
        width: widthBackButton,
        padding: !isLandscape ? null : EdgeInsets.only(
          top: 24,
          left: (context.media.padding.horizontal/2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(Icons.arrow_back_ios_outlined, widget.onBack),
            _buildButton(Icons.favorite_border_rounded, widget.onFavorite),
          ],
        ),
      ),
    );
  }
}
