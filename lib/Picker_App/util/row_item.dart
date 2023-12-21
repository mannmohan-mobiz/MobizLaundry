import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';

class RowItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isShow;
  final bool isShowButton;
  final Color color;
  final Color borderColor;
  final Function()? onTap;
  final Function()? onPressed;
  const RowItem({super.key,required this.value,required this.label,this.isShow = false,this.isShowButton = false,this.color = pickerWhiteColor,this.borderColor = pickerWhiteColor,this.onTap,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: isShowButton ? InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: borderColor),
                        color: color
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        value,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ),
                )  : Text(
                  value,
                  textAlign: TextAlign.start,
                ),
              )),
          isShow ?  const Spacer() :const SizedBox() ,
          isShow ? InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(4)
              ),
              height: 40,
              width: 40,
              child: Image.asset('Assets/Images/nav_icon.png'),
            ),
          ) : const SizedBox()
        ],
      ),
    );
  }
}