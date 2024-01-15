import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_value.dart';
import '../util/table_row.dart';

class MyCollectionDetailsPage extends StatefulWidget {
  const MyCollectionDetailsPage({super.key});

  @override
  State<MyCollectionDetailsPage> createState() => _MyCollectionDetailsPageState();
}

class _MyCollectionDetailsPageState extends State<MyCollectionDetailsPage> {
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
        title: const Text('My Collections',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children:  [
            const Text('Showing all your collections',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
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
            const SizedBox(height: 8,),
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
                              const TableWidget( text: 'Amount',value: 'AED 1000.00',fontSize:12,fontSizeValue: 12,fontWeight: FontWeight.w300,fontWeightValue: FontWeight.w300),
                              const TableWidget( text: 'Amount collected',value: 'AED 200.00',fontSize:12,fontSizeValue: 12,fontWeight: FontWeight.w300,fontWeightValue: FontWeight.w300),
                              const TableWidget( text: 'Balance amount',value: 'AED 800.00',fontSize:12,fontSizeValue: 12,fontWeight: FontWeight.w300,fontWeightValue: FontWeight.w300),

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
