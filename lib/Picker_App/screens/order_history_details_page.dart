import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';
import 'order_details_page.dart';

class OrderHistoryDetailsPage extends StatefulWidget {
  const OrderHistoryDetailsPage({super.key});

  @override
  State<OrderHistoryDetailsPage> createState() => _OrderHistoryDetailsPageState();
}

class _OrderHistoryDetailsPageState extends State<OrderHistoryDetailsPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children:  [
            const Text('Showing all orders',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
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
            Row(
              children: [
                const Text(
                  'Total Orders',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                ),
                const SizedBox(width: 15,),
                Container(
                  width: 110,
                  height: 38,
                  decoration: BoxDecoration(
                   color: pickerWhiteColor,
                    border: Border.all(color: pickerGoldColor),
                    borderRadius: BorderRadius.circular(12),

                  ),
                )
              ],
            ),
            const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)),
                  child: const Column(
                    children: [
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 20,
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: pickerGoldColor,
                      ),
                      Flexible(
                        child: Text(
                          'Via App',
                          style: TextStyle(
                            fontSize: 9,
                            color: pickerBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)),
                  child: const Column(
                    children: [
                      Text(
                        '05',
                        style: TextStyle(
                          fontSize: 20,
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: pickerGoldColor,
                      ),
                      Flexible(
                        child: Text(
                          'Via Call',
                          style: TextStyle(
                            fontSize: 9,
                            color: pickerBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)),
                  child: const Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                          fontSize: 20,
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: pickerGoldColor,
                      ),
                      Flexible(
                        child: Text(
                          'Via Staff',
                          style: TextStyle(
                            fontSize: 9,
                            color: pickerBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)),
                  child: const Column(
                    children: [
                      Text(
                        '02',
                        style: TextStyle(
                          fontSize: 20,
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: pickerGoldColor,
                      ),
                      Flexible(
                        child: Text(
                          'New Clients',
                          style: TextStyle(
                            fontSize: 9,
                            color: pickerBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18,),
            SearchWidget(
              hintText: 'Order Id/phone',
              searchCtrl: TextEditingController(),
              //onChanged: (String myString){},
            ),
            const SizedBox(height: 18,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Container(
                   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius:  BorderRadius.circular(12),
                        border: Border.all(color: pickerWhiteColor),
                        boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
                    ),
                    child:  Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetailsPage()));
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset('Assets/Images/front_arrow.png')
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
                        const RowItem(label: 'Delivery Status:',value: '',),
                        const RowItem(label: 'Pickup date/time:',value: '1.4/2023 / 7am to 9am'),
                        const RowItem(label: 'Delivery date/time:',value: '1.4/2023 / 7am to 9am'),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
