import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../src/colors.dart';

showCustomBottomSheet(BuildContext context, Widget content,
    {Color bgColor = Colors.white}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      barrierColor: barrierColor,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      builder: (context) {
        return content;
      });
}

open(BuildContext context, Widget target) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => target,
    ));

close(BuildContext context, {dynamic result}) => Navigator.pop(context, result);

void snackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: pickerGoldColor, content: Text(message, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white))));
}


openDialer(String? mobile) async {
  final url = "tel: +971 $mobile";
  print('#############$url');
  if (await launchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
