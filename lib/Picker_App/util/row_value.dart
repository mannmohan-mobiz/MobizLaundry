import 'package:flutter/cupertino.dart';

import '../src/colors.dart';

class RowValue extends StatelessWidget {
  final String label;
  final String labelValue;
  final Color labelValueColor;
  const RowValue({super.key,this.label = '', this.labelValue = '',this.labelValueColor = pickerGoldColor });

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label ,
            style: const TextStyle(
              color: pickerBlackColor, fontSize: 15,fontWeight: FontWeight.w400,),
          ),
          Text(
            labelValue,
            style:  TextStyle(
              color: labelValueColor, fontSize: 13,fontWeight: FontWeight.w600,),
          ),
        ],
      ),
    );
  }
}