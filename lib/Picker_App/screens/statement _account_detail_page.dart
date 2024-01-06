import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/row_value.dart';
import '../util/table_row.dart';

class StatementOfAccountDetailPage extends StatefulWidget {
  const StatementOfAccountDetailPage({super.key});

  @override
  State<StatementOfAccountDetailPage> createState() => _StatementOfAccountDetailPageState();
}

class _StatementOfAccountDetailPageState extends State<StatementOfAccountDetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: const Text('Statement of account',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children:  [
            const Text('Showing details',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
            const SizedBox(height: 8,),
            const Row(
              children: [
                Row(
                  children: [
                    Text(
                      'From',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      '01.12.2023',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Text(
                      'To',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      '05.12.2023',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (itemBuilder, index) =>
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        children: [
                          RowValue( label: 'Invoice Number',labelValue: '#INDS12345678901',labelValueColor: pickerBlackColor,),
                          RowValue( label: 'Invoice date',labelValue: '12 Feb 2023',labelValueColor: pickerBlackColor,),
                          RowValue( label: 'Order Number',labelValue: '#INDS12345678901',labelValueColor: pickerBlackColor,),
                          RowValue( label: 'Status',labelValue: 'Delivered',labelValueColor: pickerBlackColor,),
                          Divider(color: pickerBlackColor,),
                          RowValue( label: 'Amount',labelValue: 'AED 200.00',labelValueColor: pickerBlackColor,),
                        ],
                      ),
                    ),
                  ),
               ),
               ),
            )
          ],
        ),
      ),
    );
  }
}
