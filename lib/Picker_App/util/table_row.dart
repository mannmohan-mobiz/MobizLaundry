import 'package:flutter/cupertino.dart';

import '../src/colors.dart';

class TableWidget extends StatelessWidget {
  final String text;
  final String value;
  final Color colorText;
  final Color colorValue;
  const TableWidget({super.key,this.text = '',this.value = '',this.colorValue = pickerBlackColor,this.colorText = pickerBlackColor });

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
                Text(text,style:  TextStyle(color: colorText,fontWeight: FontWeight.w500,fontSize: 13),),
                 Text(value,style:  TextStyle(color: colorValue,fontWeight: FontWeight.w700,fontSize: 13),),
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