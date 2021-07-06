import 'package:flutter/material.dart';
import 'package:writers/components/text_field_container.dart';
import 'package:writers/constants.dart';

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final ValueChanged<String> onChange;
  const RoundedInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            icon: Icon(icon, color: primaryColor)),
      ),
    );
  }
}
