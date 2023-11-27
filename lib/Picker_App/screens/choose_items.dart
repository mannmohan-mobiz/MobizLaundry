
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';

class ChooseItemsPage extends StatefulWidget {
  const ChooseItemsPage({super.key});

  @override
  State<ChooseItemsPage> createState() => _ChooseItemsPageState();
}

class _ChooseItemsPageState extends State<ChooseItemsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: pickerPrimaryColor,
        leading: BackButton(color: Colors.white, onPressed: () => Navigator.pop(context),),
        title: const Text("Items", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 30),
        child: ListView(
          children:  [
            const Text(
                'Mode of Delivery',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: pickerPrimaryColor)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Text(
                  'Normal/Express/Urgent'
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                                'Assets/Images/Wash1.png',
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Shirt',
                                  style: TextStyle(
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
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      'Rate',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'AED 100',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: pickerButtonColor,
                                        ),
                                        onPressed: () {},
                                        child: const Text('Edit')),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: pickerButtonColor,
                                        ),
                                        onPressed: () {},
                                        child: const Text('Delete')),
                                  ],
                                )
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
            );
          }
            ),

          ],
        ),
      ),
    );
  }
}
