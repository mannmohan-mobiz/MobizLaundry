import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/custom_radio.dart';
import '../util/customer_divider.dart';
import '../util/table_row.dart';

class DeliverToCustomers extends StatefulWidget {
  const DeliverToCustomers({super.key});

  @override
  State<DeliverToCustomers> createState() => _DeliverToCustomersState();
}

class _DeliverToCustomersState extends State<DeliverToCustomers> {
  List<String> paymentName = ['Cash','Wallet'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Deliver to Customer',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: pickerWhiteColor, borderRadius: BorderRadius.circular(12)),
              child:  const Column(
                children: [
                  Text(
                    'Order Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: pickerBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Golden falcon laundry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3,),
                  MySeparator(color: pickerDividerColor,height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'INV.No',value:  '56897ING',),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:20.0),
                    child: TableWidget(text: 'INV.Date',value:  '18.2.2023',),
                  ),
                  MySeparator(color: pickerDividerColor,height: 2),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:20.0),
                    child: TableWidget(text: 'Total Amount',value:  '50 AED',),
                  ),
                  SizedBox(height: 5,),
                  MySeparator(color: pickerDividerColor,height: 2),
                  SizedBox(height: 3,),
                  Text(
                    'Towards laundry service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Select Mode of payment',
              style: TextStyle(
                color: pickerBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('Assets/Images/payment_image.png'),
                 Expanded(
                   child: SizedBox(
                     height: 90,
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: 2,
                       physics: const BouncingScrollPhysics(),
                       scrollDirection: Axis.vertical,
                       itemBuilder: (itemBuilder, index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 25,
                                child: Checkbox(
                                    activeColor: pickerGoldColor,
                                    value: false,
                                    side: const BorderSide(color: pickerGoldColor),
                                    onChanged: (value) {}
                                ),
                              ),
                               Text(
                                paymentName[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: pickerBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                ),
                   ),
                 )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: pickerWhiteColor, borderRadius: BorderRadius.circular(12)),
              child:   Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Wallet Balance',value:  'AED 100',),
                  ),
                  const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Previous Balance',value:  'AED 40',),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Today Amount',value:  'AED 90',),
                  ),
                  const MySeparator(color: pickerDividerColor,height: 2),
                  const SizedBox(height: 5,),
                  const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Total Amount',value:  'AED***',),
                  ),
                  const SizedBox(height: 5,),
                  const MySeparator(color: pickerDividerColor,height: 2),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Amount Received',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: pickerBlackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 84,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: pickerBackgroundColor
                          ),
                          child:  const Center(
                            child: Text(
                              'AED***',
                              style: TextStyle(
                                color: pickerBlackColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Set the desired border radius
                  ),
                ),
                  child:  const Text(
                    'SAVE',
                    style: TextStyle(
                      color: pickerWhiteColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),),
            ),
          ],
        ),
      ),

    );
  }
}

