import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/row_value.dart';

class OutStandingDuesPage extends StatefulWidget {
  const OutStandingDuesPage({super.key});

  @override
  State<OutStandingDuesPage> createState() => _OutStandingDuesPageState();
}

class _OutStandingDuesPageState extends State<OutStandingDuesPage> {
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
          title: const Text('OutStanding Dues',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children:  [
              const Text('Your Overall due',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 14),),
              const SizedBox(height: 8,),
              const Text('AED 5000.00',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 20),),
              const Text('Customer List',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 14),),
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
                          child:   Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Column(
                              children: [
                               Row(
                                 children: [
                                   Image.asset('Assets/Images/profile_icon.png'),
                                   const SizedBox(width: 10,),
                                   const Text('Customer Name',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 14),),
                                 ],
                               ),
                                const RowValue( label: 'Number of pending Invoices',labelValue: '5',labelValueColor: pickerBlackColor,),
                                const RowValue( label: 'Total pending amount',labelValue: 'AED 200.00',labelValueColor: pickerBlackColor,),
                                const Divider(color: pickerGreyColor,),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ColumItem(image: 'Assets/Images/home_img.png',height: 25,label: 'Customer Home'),
                                    ColumItem(image: 'Assets/Images/nav_icon.png',label: 'Navigate'),
                                    ColumItem(image: 'Assets/Images/call_icon.png',label: 'Call'),
                                  ],
                                )                              ],
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
