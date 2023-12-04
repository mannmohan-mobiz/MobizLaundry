import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class UnDeliveredPage extends StatefulWidget {
  const UnDeliveredPage({super.key});

  @override
  State<UnDeliveredPage> createState() => _UnDeliveredPageState();
}

class _UnDeliveredPageState extends State<UnDeliveredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
            onPressed: () {
              close(context);
            },
            icon: Image.asset('Assets/Images/back_arrow.png')),
        title: const Text(
          'Undelivered',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (itemBuilder, index) =>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius:  BorderRadius.circular(12),
                    border: Border.all(color: pickerWhiteColor),
                    boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
                ),
                child:  Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Checkbox(
                          activeColor: pickerGoldColor,
                          value: false,
                          side: const BorderSide(color: pickerGoldColor),
                          onChanged: (value) {}
                      ),
                    ),
                    const RowItem( label: 'Customer name:',value: 'Jason Roy',),
                    const RowItem( label: 'Customer type:',value: 'Home',),
                    const RowItem( label: 'Mode of Delivery:',value: 'Urgent',color : pickerOrangeTypeColor,isShowButton: true),
                    const RowItem( label: 'Order ID:',value: '',),
                    const RowItem(label: 'Building Name/No:',value: '',),
                    const RowItem(label: 'Floor No:',value: '',),
                    const RowItem(label: 'House No:',value: '',),
                    const RowItem(label: 'Mobile No:',value: '',),
                    const RowItem(label: 'Delivery date/time:',value: '1.4/2023 / 7am to 9am'),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ColumItem(image: 'Assets/Images/view_icon.png',label: 'View'),
                        ColumItem(image: 'Assets/Images/nav_icon.png',label: 'Navigate'),
                        ColumItem(image: 'Assets/Images/call_icon.png',label: 'Call'),
                        ColumItem(image: 'Assets/Images/deliver_image.png',label: 'Deliver'),
                      ],
                    )
                  ],
                ),
              ),
        ),
      ),

    );
  }
}
