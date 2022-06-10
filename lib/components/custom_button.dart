import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, 
    required this.text, 
    required this.backgroundColor, 
    required this.textColor, 
    required this.height, 
    required this.width, 
    required this.fontSize, 
    this.isGradient, 
    this.backgroundColorTwo, 
    required this.onPressed
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double fontSize;
  final bool? isGradient;
  final Color? backgroundColorTwo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2)
          )
        ],
        gradient: isGradient == true ? LinearGradient(
          colors: [backgroundColor, backgroundColorTwo!],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        ) : null
      ),

      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),

          primary: transparent,
          shadowColor: transparent

        ),

        child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500))
      ),
    );
  }
}