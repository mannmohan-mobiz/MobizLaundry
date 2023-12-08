import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/table_row.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {

  List<String> title = ['Press & Fold', 'Press & Hang'];
  List<String> titleData = ['Shirts', 'Pants'];
  List<String> titleDataValue = ['2', '2'];
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
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  const Text('Item Name/Category',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 14),),
                  const SizedBox(height: 10,),
                  const TableWidget(text: 'Order No',value: '568978',colorValue: pickerGoldColor),
                  const TableWidget(text: 'Date',value: '17.10.2023',colorValue: pickerGoldColor,),
                  const TableWidget(text: 'Status',value: 'In Transit',colorValue: pickerGoldColor,),
                  const Divider(color: pickerDividerColor,thickness: 1,),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (itemBuilder, index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListView(
                          shrinkWrap: true,
                      children:  [
                         Text(title[index],style: const TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w600,fontSize: 14),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (itemBuilder, index) =>
                               TableWidget(text: titleData[index],value: titleDataValue[index],colorValue: pickerGoldColor),
                          ),
                        ),
                        const Divider(color: pickerDividerColor,thickness: 1,),
                               ]
                      ),
                    )

                  )
                ]

              ),
            ),
          ),
        )
    );
  }
}
