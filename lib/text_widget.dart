import 'package:flutter/widgets.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final TextAlign? textAlign;
  final Key? key;
  const TextWidget(this.text,
      {this.fontWeight,
      this.fontSize,
      this.color,
      this.textAlign,
      this.paddingLeft,
      this.paddingRight,
      this.paddingBottom,
      this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingLeft ?? 0,
          right: paddingRight ?? 0,
          bottom: paddingBottom ?? 0),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
