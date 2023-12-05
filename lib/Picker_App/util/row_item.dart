import 'package:flutter/cupertino.dart';

import '../src/colors.dart';

class RowItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isShow;
  final bool isShowButton;
  final Color color;
  const RowItem({super.key,required this.value,required this.label,this.isShow = false,this.isShowButton = false,this.color = pickerBackgroundColor});

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
                child: isShowButton ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: color
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      value,
                      textAlign: TextAlign.start,
                    ),
                  )
                )  : Text(
                  value,
                  textAlign: TextAlign.start,
                ),
              )),
          isShow ?  const Spacer() :const SizedBox() ,
          isShow ? Container(
            decoration: BoxDecoration(
                color: pickerWhiteColor,
                borderRadius: BorderRadius.circular(4)
            ),
            height: 40,
            width: 40,
            child: Image.asset('Assets/Images/nav_icon.png'),
          ) : const SizedBox()
        ],
      ),
    );
  }
}