import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final BorderSide? borderSide;
  final AlignmentGeometry textAlign;
  final double? radius;
  final bool enabled;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.textColor,
      this.text,
      this.color,
      this.child,
      this.width = double.infinity,
      this.height,
      this.borderSide,
      this.radius = 100,
      this.enabled = false,
      this.textSize,
      this.textAlign = Alignment.center,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: enabled ? true : false,
      child: MaterialButton(
        minWidth: width,
        height: height ?? 45,
        elevation: 0,
        highlightElevation: 0,
        onPressed: onPressed ?? () {},
        color: enabled ? Colors.grey.shade400 : color,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: borderSide ?? BorderSide.none),
        child: child ??
            Align(
              alignment: textAlign,
              child: Text(text!,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: textSize ?? 14,
                      fontWeight: fontWeight ?? FontWeight.w600)),
            ),
      ),
    );
  }
}
