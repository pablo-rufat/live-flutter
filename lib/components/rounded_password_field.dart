import 'package:flutter/material.dart';
import 'package:writers/components/text_field_container.dart';
import 'package:writers/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChange;
  const RoundedPasswordField({Key? key, required this.onChange})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscure = true;
  IconData visibilityIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChange,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(visibilityIcon, color: primaryColor),
              onPressed: () {
                setState(() {
                  obscure = !obscure;

                  if (obscure) {
                    visibilityIcon = Icons.visibility;
                  } else {
                    visibilityIcon = Icons.visibility_off;
                  }
                });
              },
            ),
            border: InputBorder.none),
      ),
    );
  }
}
