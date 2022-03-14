import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class SearchTextField extends StatelessWidget {
  double? width;
  String? hintText;
  TextStyle? textStyle;
  Color? color;
  Widget prefixIcon;
  Widget suffixIcon;
  SearchTextField({
    Key? key,
    this.width,
    this.hintText,
    this.textStyle,
    this.color,
    this.suffixIcon = const SizedBox(),
    this.prefixIcon = const Icon(Icons.search),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // add searchfield
      width: width,
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
    );
  }
}
