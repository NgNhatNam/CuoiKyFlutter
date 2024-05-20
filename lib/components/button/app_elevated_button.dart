import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.height = 58.0,
    this.width = 170.0,
    required this.text,
    this.textColor = AppColor.white,
    this.color = AppColor.pink,
    this.borderColor = AppColor.pink,
  });

  final Function()? onPressed;
  final double height;
  final double width;
  final String text;
  final Color textColor;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 22.3),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 1.6),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          /* boxShadow: const [
            BoxShadow(
              color: AppColor.black,
              offset: Offset(0.0, 0.3),
              blurRadius: 6.0,
            ),
          ], */
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.8,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
