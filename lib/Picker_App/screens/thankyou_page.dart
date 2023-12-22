import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class ThankYouPageScreen extends StatefulWidget {
  const ThankYouPageScreen({super.key});

  @override
  State<ThankYouPageScreen> createState() => _ThankYouPageScreenState();
}

class _ThankYouPageScreenState extends State<ThankYouPageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'Order Confirmed',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Image.asset('Assets/Images/success.png'),
          ),
         // const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Hai User!',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          //const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Thank You for the\npurchase from us',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
          ),
          const SizedBox(height: 4,),
          Expanded(
            child: Container(
              width: double.infinity,
              color: pickerWhiteColor,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Order Details',
                      style: TextStyle(
                          color: pickerBlackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const RowItem(label: 'Date of purchase:', value: '21.12.2023',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Pick up date:', value: '09.12.2023',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Pick up time:', value: '12.00 pm - 1.00 pm',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Mode of Delivery:', value: 'Express',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Delivery date:', value: '09.12.2023',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Delivery time:', value: '12.00 pm - 1.00 pm',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Order Total:', value: 'AED 100',fontSize: 12,fontSizeValue:12),
                    const RowItem(label: 'Order ID:', value: '#8929',fontSize: 12,fontSizeValue:12),
                    const SizedBox(height: 10,),
                    const Text(
                      'Great news! Your order is confirmed with order id #8979. Sit back and relax as we handle the rest. Expect top-notch service and the convenience of doorstep pick-up. Your garments are in good hands. Thank you for choosing Golden Falcon Laundry!',
                      style: TextStyle(
                          color: pickerBlackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6), // <-- Radius
                        ),
                        backgroundColor: pickerWhiteColor,
                        side: const BorderSide(color: pickerGoldColor, width: 1.0),),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ThankYouPageScreen())),
                      child: const Center(
                        child: Text(
                          'BACK TO HOME',
                          style: TextStyle(
                            color: pickerBlackColor, fontSize: 16,fontWeight: FontWeight.w400,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
