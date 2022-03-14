import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  double? height;
  double? width;
  String? hintText;
  TextStyle? textStyle;
  Color? color;
  SearchField(
      {Key? key,
      this.height,
      this.width,
      this.hintText,
      this.textStyle,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        onFieldSubmitted: (value) {},
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          hintText: hintText,
          hintStyle: textStyle,
          prefixIcon: const Visibility(
            visible: true,
            child: Icon(Icons.search),
          ),
          suffixIcon: const Visibility(
            visible: true,
            child: Icon(Icons.mic),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
