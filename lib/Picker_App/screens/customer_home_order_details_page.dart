import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/container_widget.dart';

class CustomerHomeOrderDetailPage extends StatefulWidget {
  const CustomerHomeOrderDetailPage({super.key});

  @override
  State<CustomerHomeOrderDetailPage> createState() => _CustomerHomeOrderDetailPageState();
}

class _CustomerHomeOrderDetailPageState extends State<CustomerHomeOrderDetailPage> {
  bool isDelivered = false;
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
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
          child: isDelivered == false ? ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Image.asset('Assets/Images/in_transit.png'),
                            const SizedBox(width: 10,),
                            const Column(
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
                          ],
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                            shrinkWrap: true,
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (itemBuilder, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                      ),
                                      child:
                                        Image.asset('Assets/Images/item_img.png',
                                        fit: BoxFit.fill,
                                        ),
                               ),
                                  const SizedBox(width: 20),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Shirt/wash & fold',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('No of items',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            Text('2',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Rate',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            Text('AED 14',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                       ),
                      ],
                    ),
                  ),
                ),
              ),
              const ContainerWidgets(title: 'Delivery Time',
                  textTime: '12.00PM - 1.00PM',
                  textDate: '09-Jan-2024'),
              const Text(
                'Delivery address',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                'Jason Roy , House name ,Floor no,Building number. 8089790114',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total order price',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AED 150',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        'View breakup',
                        style: TextStyle(
                            color: pickerGoldColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    'COD',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service type',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    'Express Delivery',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              )
            ],
          ) :
          ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Image.asset('Assets/Images/delivered.png'),
                            const SizedBox(width: 10,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivered', style: TextStyle(
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),),
                                Text('On 3.1.2024', style: TextStyle(
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (itemBuilder, index) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                      ),
                                      child:
                                      Image.asset('Assets/Images/item_img.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Shirt/wash & fold',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('No of items',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                              ),
                                              Text('2',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Rate',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                              ),
                                              Text('AED 14',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                        ),
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
              ),
              const ContainerWidgets(title: 'Delivery Time',
                  textTime: '12.00PM - 1.00PM',
                  textDate: '09-Jan-2024'),
              const Text(
                'Delivery address',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                'Jason Roy , House name ,Floor no,Building number. 8089790114',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total order price',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AED 150',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        'View breakup',
                        style: TextStyle(
                            color: pickerGoldColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    'COD',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service type',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    'Express Delivery',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // <-- Radius
                  ),
                  backgroundColor: pickerWhiteColor,
                  side: const BorderSide(color: pickerGoldColor, width: 1.0),
                ),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'Update Delivery',
                    style: TextStyle(
                        color: pickerGoldColor, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
