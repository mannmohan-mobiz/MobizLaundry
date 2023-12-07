import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pickerBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: pickerWhiteColor,
          toolbarHeight: 100.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
            side: BorderSide(color: pickerGoldColor),
          ),
          leading: IconButton(
              onPressed: () {
                close(context);
              },
              icon: Image.asset('Assets/Images/back_arrow.png')
          ),
          title: const Text('Order History',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('Assets/Images/notification_icon.png'),
            )
          ],
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Container(
            decoration: BoxDecoration(color: pickerWhiteColor,borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: ListView(
                children:  const [
                  Text('Item Name/Category',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                   Row(
                     children: [
                       Text('Order No:',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                       Text('568978',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                     ],
                   ),
                  Row(
                    children: [
                      Text('Date:',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                      Text('17.10.2023',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Status:',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                      Text('In Transit',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 13),),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
