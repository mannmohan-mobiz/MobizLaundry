import 'package:flutter/cupertino.dart';

import '../src/colors.dart';

class TableWidget extends StatelessWidget {
  final String text;
  final String value;
  final Color colorText;
  final Color colorValue;
  final double fontSize;
  final double fontSizeValue;
  final FontWeight fontWeight;
  final FontWeight fontWeightValue;


  const TableWidget({super.key,this.text = '',this.value = '',this.fontSize = 13,this.fontSizeValue = 13,this.fontWeight = FontWeight.w500,
    this.fontWeightValue = FontWeight.w700,this.colorValue = pickerBlackColor,this.colorText = pickerBlackColor });

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(4),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(4),
        },
        children:   [
          TableRow(
              children: [
                Text(text,style:  TextStyle(color: colorText,fontWeight: fontWeight,fontSize: fontSize),),
                 Text(value,style:  TextStyle(color: colorValue,fontWeight: fontWeightValue,fontSize: fontSizeValue),),
              ]
          )
        ],
      ),
    );
  }
}




// Text('Order No:',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
// Text('568978',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
// Text('Date:',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
// Text('17.10.2023',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),