import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Size size;
  final Function onChanged;
  final String hintText;

  const CustomSearchField({
    this.size,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .9,
      height: size.height * .05,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
