import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';
import 'package:mini_project_1/shared/context_extension.dart';

class SearchTextField extends StatelessWidget {
  TypeLayout? typeLayout;
  //double? width;
  String? hintText;
  TextStyle? textStyle;
  Color? color;
  Widget prefixIcon;
  Widget suffixIcon;
  SearchTextField({
    Key? key,
    this.typeLayout,
    //this.width,
    this.hintText,
    this.textStyle,
    this.color,
    this.suffixIcon = const SizedBox(),
    this.prefixIcon = const Icon(Icons.search),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (typeLayout == TypeLayout.landscape)
            ? Padding(
                padding: EdgeInsets.only(right: context.mediaWidth * 0.02),
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: CustomColors.primary,
                      ),
                    );
                  },
                ),
              )
            : Container(),
        SizedBox(
          // add searchfield
          width: (typeLayout == TypeLayout.landscape)
              ? context.mediaWidth * 0.4
              : context.mediaWidth - (CustomSize.defaultMargin * 2),
          child: TextFormField(
            cursorColor: CustomColors.fontSecondary,
            onFieldSubmitted: (value) {},
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              fillColor: color,
              filled: true,
              hintText: hintText,
              hintStyle: textStyle,
              prefixIcon: Visibility(
                visible: true,
                child: prefixIcon,
              ),
              suffixIcon: Visibility(
                visible: true,
                child: suffixIcon,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
