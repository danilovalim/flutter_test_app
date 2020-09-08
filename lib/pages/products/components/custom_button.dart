import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onSubmit;
  final String text;
  final Color backGroundColor;
  final Color textColor;
  final double width;

  const CustomButton({
    Key key,
    this.onSubmit,
    this.text,
    this.backGroundColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
