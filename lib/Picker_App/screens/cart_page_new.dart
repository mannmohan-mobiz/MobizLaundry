import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/profile_page.dart';
import 'package:golden_falcon/Picker_App/util/customer_divider.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_value.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  bool isExpanded = false;
  String selectedOption = 'Choose Payment method';
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
          'Jason\'s Cart',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          children:  [
            const Wrap(
              children: [
                Text(
                  'Delivery to:',
                  style: TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Text(
                  'Jason Roy , House name ,Floor no,Building number. 8089790114',
                  style: TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
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
              onPressed: () {
                // showCustomBottomSheet(context,
                //    Padding(
                //      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                //      child: SizedBox(
                //        height: MediaQuery.of(context).size.height * 0.28,
                //        child: Column(
                //         children: [
                //           Row(
                //             children: [
                //               InkWell(
                //                   onTap: close(context),
                //                   child: Image.asset('Assets/Images/close.png'),
                //               ),
                //               const Text(
                //                 'Select delivery Address',
                //                 style: TextStyle(
                //                   color: pickerBlackColor, fontSize: 12,fontWeight: FontWeight.w400,),
                //               ),
                //             ],
                //           ),
                //           const Divider(),
                //
                //         ],
                //                          ),
                //      ),
                //    )
                // );
              },
              child: const Center(
                child: Text(
                  'CHANGE DELIVERY ADDRESS',
                  style: TextStyle(
                      color: pickerBlackColor, fontSize: 12,fontWeight: FontWeight.w400,),
                ),
              ),
            ),
            const Row(
              children: [
                ContainerWidgets(title: 'Pick-up Time',textTime: '12:00PM - 1:00PM',textDate: '09-DEC-2023'),
                ContainerWidgets(title: 'Delivery Time',textTime: '12:00PM - 1:00PM',textDate: '09-DEC-2023')
              ],
            ),
            const RowValue(label: 'Service Type',labelValue: 'Express Delivery',),
            const RowValue(label:  'Order Type', labelValue:'Dry Clean, Wash & Fold' ),
            const SizedBox(height: 12),
            const Text('Picked items for Jason.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,)),
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
            const SizedBox(height: 12),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Apply PromoCode ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,)),
                  TextSpan(
                    text: '(select only one)',
                    style: TextStyle(fontWeight: FontWeight.w600,color: pickerTextColor,fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) =>
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: 150,
                   //  width: double.infinity,
                    decoration: BoxDecoration(
                        color: pickerGoldColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Promo Code',
                            style: TextStyle(fontSize: 13.0, color: pickerWhiteColor, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '20',
                            style: TextStyle(fontSize: 54.0, color: pickerWhiteColor, fontWeight: FontWeight.w600),
                          ),
                          MySeparator(color: pickerWhiteColor,height: 2),
                          SizedBox(height: 2),
                          Text(
                            'Redeem Now',
                            style: TextStyle(fontSize: 13.0, color: pickerWhiteColor, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
               ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                backgroundColor: pickerWhiteColor,
                side: const BorderSide(color: pickerGoldColor, width: 1.0),
              ),
              onPressed: () {},
              child: const Center(
                child: Text(
                  'Apply Coupon',
                  style: TextStyle(
                    color: pickerBlackColor, fontSize: 13,fontWeight: FontWeight.w400,),
                ),
              ),
            ),
            const RowValue(label: 'Net Taxable Value',labelValue: 'AED 100',labelValueColor: pickerBlackColor),
            const RowValue(label: 'Vat',labelValue: 'AED 0',labelValueColor: pickerBlackColor),
             Column(
               children: [
                 InkWell(
                   onTap: (){
                     setState(() {
                       isExpanded = !isExpanded;
                     });
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(8),
                       decoration: BoxDecoration(
                         border: Border.all(color: pickerGoldColor),
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Text(selectedOption),
                           Icon(
                             isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                             size: 24,
                             color: pickerGoldColor,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 AnimatedContainer(
                   duration: const Duration(milliseconds: 300),
                   width: double.infinity,
                   height: isExpanded ? 150 : 0,
                   padding: const EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     border: Border.all(color: pickerGoldColor),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   child: ListView(
                     children: [
                       ListTile(
                         title: const Text('Cash'),
                         onTap: () {
                           setState(() {
                             selectedOption = 'Cash';
                             isExpanded = false;
                           });
                         },
                       ),
                       ListTile(
                         title: const Text('e-pay'),
                         onTap: () {
                           setState(() {
                             selectedOption = 'e-pay';
                             isExpanded = false;
                           });
                         },
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             Row(
              children: [
                Checkbox(
                    activeColor: pickerGoldColor,
                    value: false,
                    side: const BorderSide(color: pickerGoldColor),
                    onChanged: (value) {}
                ),
                const Text(
                  'Use Wallet Balance ?',
                  style: TextStyle(
                    color: pickerBlackColor, fontSize: 15,fontWeight: FontWeight.w400,),
                ),
              ],
                         ),
            const RowValue(label: 'Total Payable',labelValue: 'AED 100',labelValueColor: pickerBlackColor),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
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
                  'Place Order',
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






class ContainerWidgets extends StatelessWidget {
  final String title;
  final String textDate;
  final String textTime;
  const ContainerWidgets({super.key,this.title = '',this.textDate = '',this.textTime = ''});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: pickerGoldColor, width: 2)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 12,
                        color: pickerBlackColor, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    textTime,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 13,
                        color: pickerGoldColor, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    textDate,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(fontSize: 13,
                        color: pickerGoldColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

