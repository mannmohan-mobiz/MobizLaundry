import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/container_widget.dart';
import '../util/row_value.dart';

class CollectItemsPage extends StatefulWidget {
  const CollectItemsPage({super.key});

  @override
  State<CollectItemsPage> createState() => _CollectItemsPageState();
}

class _CollectItemsPageState extends State<CollectItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  pickerBackgroundColor,
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
          'Collect Items',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children:  [
             const Row(
              children: [
                ContainerWidgets(title: 'Pick-up Time',textTime: '12:00PM - 1:00PM',textDate: '09-DEC-2023'),
                ContainerWidgets(title: 'Delivery Time',textTime: '12:00PM - 1:00PM',textDate: '09-DEC-2023'),
              ],
            ),
            const RowValue(label: 'Payment Method',labelValue: 'COD',),
            const RowValue(label: 'Service Type',labelValue: 'Express Delivery',),
            const RowValue(label:  'Order Type', labelValue:'Dry Clean, Wash & Fold' ),
            const Text('Items to be picked', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,)),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) =>
                  Card(
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Image.asset(
                                      // baseUrl+state.pckItemList[index][index].itemServices.item.itemImage,
                                      // baseUrl+lstData[index].itemServices.item.itemImage,

                                      'Assets/Images/item_img.png',
                                      // baseUrl+lstData.itemServices.item.itemImage,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'shirts / Wash & fold',
                                        //state.pckItemList[index].itemServices.item.itemName,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          const Text(
                                            'No of items',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'Assets/Images/decrement.png',
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Image.asset(
                                                'Assets/Images/increment.png',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            'Rate',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'AED 14',
                                            //'AED ${state.pckItemList[index].amount}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 32,
                                        child: ElevatedButton(
                                          onPressed: () {
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: pickerGoldColor,
                                            ),
                                            //padding: EdgeInsets.symmetric(horizontal: 84.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(9),
                                            ),
                                          ),
                                          child: const Text(
                                            'REMOVE FROM CART',
                                            style: TextStyle(fontSize: 12.0, color: pickerBlackColor, fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
             const SizedBox(height: 10,),
             TextField(
                controller: TextEditingController(),
                maxLines: 8,
                style: const TextStyle(
                    color: pickerCommentColor),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'Write Your Order Comment Here..',
                  hintStyle:  TextStyle(
                    inherit: true,
                    fontSize: 13,
                  ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pickerGoldColor), // Enabled border color
                    ),

                )
            ),
            const SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      close(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: pickerGoldColor,
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 84.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

              ],
            ),
            const RowValue(label: 'Amount',labelValue: 'AED 100',labelValueColor: pickerBlackColor),
            const RowValue(label: 'Delivery Charges',labelValue: 'AED 0',labelValueColor: pickerBlackColor),
            const RowValue(label: 'Sur Charges',labelValue: 'AED 0',labelValueColor: pickerBlackColor),
            const RowValue(label: 'Total Payable',labelValue: 'AED 100',labelValueColor: pickerBlackColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Collected Amount',
                  style: TextStyle(
                    color: pickerBlackColor, fontSize: 15,fontWeight: FontWeight.w400,),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: pickerGoldColor), // Enabled border color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                backgroundColor: pickerGoldColor,
              ),
              onPressed: () {},
              child: const Center(
                child: Text(
                  'MARK AS PICKED',
                  style: TextStyle(
                    color: pickerWhiteColor, fontSize: 16,fontWeight: FontWeight.w400,),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
