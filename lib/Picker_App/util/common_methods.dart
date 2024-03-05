import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../src/colors.dart';
enum MessageType { success, error }

showCustomBottomSheet(BuildContext context, Widget content,
    {Color bgColor = Colors.white, required String title}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      barrierColor: barrierColor,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.5),
      //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(
                alignment: Alignment.centerRight,
                child:
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: pickerPrimaryColor))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: pickerBlackColor))),
            if(title!='') const SizedBox(height: 8),
            if(title!='') const Divider(thickness: 1.0, color: pickerBlackColor),
            Expanded(
              child: SingleChildScrollView(
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  child: content),
            )
          ]),
        );
      });
}


open(BuildContext context, Widget target) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => target,
    ));

close(BuildContext context, {dynamic result}) => Navigator.pop(context, result);

void snackBar(BuildContext context, {required String message,var type = MessageType.error}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: type == MessageType.success ? Colors.green : Colors.red, content: Text(message, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white))));
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
