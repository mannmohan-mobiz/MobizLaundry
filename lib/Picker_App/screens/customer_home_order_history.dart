import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import 'customer_home_order_details_page.dart';

class CustomerHomeOrderHistory extends StatefulWidget {
  const CustomerHomeOrderHistory({super.key});

  @override
  State<CustomerHomeOrderHistory> createState() => _CustomerHomeOrderHistoryState();
}

class _CustomerHomeOrderHistoryState extends State<CustomerHomeOrderHistory> {
   bool isDelivered = false;
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
          title: const Text('Order History',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('Assets/Images/notification_icon.png'),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: pickerWhiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: pickerGoldColor)
                      ),
                      child: TextField(
                        controller: TextEditingController(),
                        textAlign: TextAlign.center,
                        decoration:  const InputDecoration(
                          hintText: "From date",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: pickerWhiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: pickerGoldColor)
                      ),
                      child: TextField(
                        controller: TextEditingController(),
                        textAlign: TextAlign.center,
                        decoration:  const InputDecoration(
                          hintText: "To date",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pickerGoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      onPressed: (){
                      },
                      child: const Text('LOAD',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) {
                if(isDelivered == false) {
                 return  Card(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            ListTile(
                               leading:  Image.asset('Assets/Images/in_transit.png'),
                               title: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('In transit', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),),
                                    Text('Ordered on 3.1.2024', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),),
                                  ],
                                ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerHomeOrderDetailPage()));

                                },
                                  child: Image.asset('Assets/Images/for_arrow.png')),
                            ),
                            const RowItem(label: 'Order Number:',
                              value: 'INX 87654321',
                              fontSize: 13,
                              fontSizeValue: 13,
                              fontWeightValue: FontWeight.w300,
                              fontWeight: FontWeight.w300,),
                            const RowItem(label: 'Number of items:',
                              value: '15',
                              fontSize: 13,
                              fontSizeValue: 13,
                              fontWeightValue: FontWeight.w300,
                              fontWeight: FontWeight.w300,),
                            const RowItem(label: 'Delivery date:',
                              value: '09 jan 2024',
                              fontSize: 13,
                              fontSizeValue: 13,
                              fontWeightValue: FontWeight.w300,
                              fontWeight: FontWeight.w300,),
                            const RowItem(label: 'Amount payable:',
                              value: 'AED 100',
                              fontSize: 13,
                              fontSizeValue: 13,
                              fontWeightValue: FontWeight.w300,
                              fontWeight: FontWeight.w300,),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                 return Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          children: [
                            ListTile(
                              leading:  Image.asset('Assets/Images/delivered.png'),
                               title: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivered',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 14),),
                                    Text('On 3.1.2024',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 13),),
                                  ],
                                ),
                                trailing: Image.asset('Assets/Images/for_arrow.png'),
                            ),
                            const RowItem( label: 'Order Number:',value: 'INX 87654321',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
                            const RowItem( label: 'Number of items:',value: '15',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
                            const RowItem( label: 'Amount paid:',value: 'AED 100',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
                            const Divider(color: pickerGreyColor,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColumItem(image: 'Assets/Images/excellent1.png',label: 'Excellent',fontSize: 6),
                                ColumItem(image: 'Assets/Images/good1.png',label: 'Good',fontSize: 6),
                                ColumItem(image: 'Assets/Images/average1.png',label: 'Average',fontSize: 6),
                                ColumItem(image: 'Assets/Images/poor1.png',label: 'Poor',fontSize: 6),
                                ColumItem(image: 'Assets/Images/verypoor1.png',label: 'Very Poor',fontSize: 6),
                                Text('Write a review',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 14),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                }

                // return Card(
                //   child: Container(
                //     width: MediaQuery
                //         .of(context)
                //         .size
                //         .width,
                //     decoration: BoxDecoration(
                //       color: pickerWhiteColor,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 20, vertical: 10),
                //       child: Column(
                //         children: [
                //           // Align(
                //           //     alignment: Alignment.topRight,
                //           //     child: Image.asset('Assets/Images/for_arrow.png')),
                //           Row(
                //             children: [
                //               Image.asset('Assets/Images/in_transit.png'),
                //               const SizedBox(width: 10),
                //               const Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text('In transit', style: TextStyle(
                //                       color: pickerBlackColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14),),
                //                   Text('Ordered on 3.1.2024', style: TextStyle(
                //                       color: pickerBlackColor,
                //                       fontWeight: FontWeight.w300,
                //                       fontSize: 13),),
                //                 ],
                //               ),
                //               Image.asset('Assets/Images/for_arrow.png'),
                //             ],
                //           ),
                //           const RowItem(label: 'Order Number:',
                //             value: 'INX 87654321',
                //             fontSize: 13,
                //             fontSizeValue: 13,
                //             fontWeightValue: FontWeight.w300,
                //             fontWeight: FontWeight.w300,),
                //           const RowItem(label: 'Number of items:',
                //             value: '15',
                //             fontSize: 13,
                //             fontSizeValue: 13,
                //             fontWeightValue: FontWeight.w300,
                //             fontWeight: FontWeight.w300,),
                //           const RowItem(label: 'Delivery date:',
                //             value: '09 jan 2024',
                //             fontSize: 13,
                //             fontSizeValue: 13,
                //             fontWeightValue: FontWeight.w300,
                //             fontWeight: FontWeight.w300,),
                //           const RowItem(label: 'Amount payable:',
                //             value: 'AED 100',
                //             fontSize: 13,
                //             fontSizeValue: 13,
                //             fontWeightValue: FontWeight.w300,
                //             fontWeight: FontWeight.w300,),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              }
              ),
              // Card(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: pickerWhiteColor,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child:  Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              //       child: Column(
              //         children: [
              //           // Align(
              //           //     alignment: Alignment.topRight,
              //           //     child: Image.asset('Assets/Images/for_arrow.png')),
              //           Row(
              //             children: [
              //               Image.asset('Assets/Images/delivered.png'),
              //               const SizedBox(width: 10),
              //               const Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Delivered',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 14),),
              //                   Text('On 3.1.2024',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 13),),
              //                 ],
              //               ),
              //               Image.asset('Assets/Images/for_arrow.png'),
              //             ],
              //           ),
              //           const RowItem( label: 'Order Number:',value: 'INX 87654321',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
              //           const RowItem( label: 'Number of items:',value: '15',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
              //           const RowItem( label: 'Amount paid:',value: 'AED 100',fontSize: 13,fontSizeValue: 13,fontWeightValue: FontWeight.w300,fontWeight: FontWeight.w300,),
              //         const Divider(color: pickerGreyColor,),
              //           const Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               ColumItem(image: 'Assets/Images/excellent1.png',label: 'Excellent',fontSize: 6),
              //               ColumItem(image: 'Assets/Images/good1.png',label: 'Good',fontSize: 6),
              //               ColumItem(image: 'Assets/Images/average1.png',label: 'Average',fontSize: 6),
              //               ColumItem(image: 'Assets/Images/poor1.png',label: 'Poor',fontSize: 6),
              //               ColumItem(image: 'Assets/Images/verypoor1.png',label: 'Very Poor',fontSize: 6),
              //               Text('Write a review',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 14),),
              //             ],
              //           )
              //
              //         ],
              //       ),
              //     ),
              //   ),
              // ),




            ],
          ),
        )
    );
  }
}
