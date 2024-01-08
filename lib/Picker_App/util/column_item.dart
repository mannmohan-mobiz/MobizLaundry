import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumItem extends StatelessWidget {
  final String label;
  final String image;
  final Function()? onTap;
  final double? height;
  final double fontSize;
  const ColumItem({super.key,required this.label,required this.image,this.height = 20,this.onTap,this.fontSize =12});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(image,height: height),
            Text(
              label,
              textAlign: TextAlign.start,
              style:  TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
