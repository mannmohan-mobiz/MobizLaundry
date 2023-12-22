import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';

class ContainerWidgets extends StatelessWidget {
  final String title;
  final String textDate;
  final String textTime;
  const ContainerWidgets({super.key,this.title = '',this.textDate = '',this.textTime = ''});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: pickerGoldColor, width: 2)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 12,
                        color: pickerBlackColor, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    textTime,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 13,
                        color: pickerGoldColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    textDate,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 13,
                        color: pickerGoldColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}