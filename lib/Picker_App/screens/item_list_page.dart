import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';


class ItemsListPage extends StatefulWidget {
  const ItemsListPage({Key? key}) : super(key: key);

  @override
  State<ItemsListPage> createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {

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
            'Select Sub-Service',
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

      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Wash & Fold', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                const Text('Pick the Items', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,)),
                const SizedBox(height: 28),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Card(
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
                                          child: Image.network(
                                            // baseUrl+state.pckItemList[index][index].itemServices.item.itemImage,
                                            // baseUrl+lstData[index].itemServices.item.itemImage,

                                            'Assets/Images/service_1.png',
                                           // baseUrl+lstData.itemServices.item.itemImage,
                                            fit: BoxFit.fill,
                                          )),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'shirt',
                                              //state.pckItemList[index].itemServices.item.itemName,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                const Text(
                                                  'No of items',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
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
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Rate',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  'AED',
                                                  //'AED ${state.pckItemList[index].amount}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 32,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                },
                                                child: Text(
                                                  'ADD TO CART',
                                                  style: TextStyle(fontSize: 13.0, color: pickerGoldColor, fontWeight: FontWeight.w600),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  surfaceTintColor: Colors.white,
                                                  side: const BorderSide(
                                                    width: 1.0,
                                                    color: pickerGoldColor,
                                                  ),
                                                  //padding: EdgeInsets.symmetric(horizontal: 84.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(2),
                                                  ),
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
                      );
                    }
                ),
              ],
            ),
          )
      ),
    );
  }
}