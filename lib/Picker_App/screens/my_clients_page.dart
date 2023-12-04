import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';

class MyClientsPage extends StatefulWidget {
  const MyClientsPage({super.key});

  @override
  State<MyClientsPage> createState() => _MyClientsPageState();
}

class _MyClientsPageState extends State<MyClientsPage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'My Clients',
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
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children:  [
            const Text('Search Clients',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),),
            const SizedBox(height: 2,),
            SearchWidget(
              searchCtrl: TextEditingController(),
                onChanged: (String myString){},
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (itemBuilder, index) =>
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                margin: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius:  BorderRadius.circular(12),
                    border: Border.all(color: pickerWhiteColor),
                    boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
                ),
                child:  const Column(
                  children: [
                    RowItem( label: 'Customer name:',value: 'Jason Roy',),
                    RowItem( label: 'Customer type:',value: 'Home',),
                    RowItem( label: 'Mode of Delivery:',value: 'Urgent',color : pickerOrangeTypeColor,isShowButton: true),
                    RowItem( label: 'Order ID:',value: '',),
                    RowItem(label: 'Building Name/No:',value: '',),
                    RowItem(label: 'Floor No:',value: '',),
                    RowItem(label: 'House No:',value: '',),
                    RowItem(label: 'Mobile No:',value: '',),
                    RowItem(label: 'Delivery time:',value: '7am to 9am'),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ColumItem(image: 'Assets/Images/view_icon.png',label: 'View'),
                        ColumItem(image: 'Assets/Images/edit_icon.png',label: 'Edit'),
                        ColumItem(image: 'Assets/Images/nav_icon.png',label: 'Navigate'),
                        ColumItem(image: 'Assets/Images/call_icon.png',label: 'Call')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
