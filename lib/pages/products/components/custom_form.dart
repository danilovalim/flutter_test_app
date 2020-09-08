import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class CustomForm extends StatelessWidget {
  final CustomButton customButton;
  final List<CustomTextField> fields;

  const CustomForm({
    Key key,
    this.customButton,
    this.fields,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var f in fields) _loadField(f),
        SizedBox(height: 30),
        customButton
      ],
    );
  }

  _loadField(CustomTextField field) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: CustomTextField(
        controller: field.controller,
        inputType: field.inputType,
        labelText: field.labelText,
      ),
    );
  }
}
