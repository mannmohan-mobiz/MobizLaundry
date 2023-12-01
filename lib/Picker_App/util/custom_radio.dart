import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';


class CustomRadio extends StatefulWidget {
  final int value;
  final int? groupValue;  final String title;
  final void Function(int) onChanged;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged, required this.title})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: pickerGoldColor),
                  shape: BoxShape.rectangle, color: selected ? pickerGoldColor : pickerWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}