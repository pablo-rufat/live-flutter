import 'package:flutter/material.dart';
import 'package:writers/components/text_field_container.dart';
import 'package:writers/constants.dart';

class LanguagesDropdown extends StatefulWidget {
  const LanguagesDropdown({Key? key}) : super(key: key);

  @override
  _LanguagesDropdownState createState() => _LanguagesDropdownState();
}

class _LanguagesDropdownState extends State<LanguagesDropdown> {
  String dropdownValue = 'language';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.language,
            color: primaryColor,
          ),
          SizedBox(width: size.width * 0.04),
          DropdownButton(
            hint: DropdownMenuItem<String>(
              value: dropdownValue,
              child: Text(dropdownValue),
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            underline: Container(),
            items: <String>[
              'English',
              'Español',
              'Português',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
