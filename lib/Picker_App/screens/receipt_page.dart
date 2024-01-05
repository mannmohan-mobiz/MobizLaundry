import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class ReceiptRechargePage extends StatefulWidget {
  const ReceiptRechargePage({super.key});

  @override
  State<ReceiptRechargePage> createState() => _ReceiptRechargePageState();
}

class _ReceiptRechargePageState extends State<ReceiptRechargePage> {
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
          'Receipt for wallet recharge',
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
         padding: const EdgeInsets.only(left: 24, right: 20,bottom: 20,top: 20),
         child: Column(
           children: [
             Container(
               width: double.infinity,
               decoration: BoxDecoration(
                 color: pickerWhiteColor,
                 borderRadius: BorderRadius.circular(12),
               ),
               child:  Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
                 child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Image.asset('Assets/Images/success.png'),
                     const Text(
                       'Recharged successfully',
                       style: TextStyle(
                           color: pickerBlackColor,
                           fontWeight: FontWeight.w400,
                           fontSize: 18),
                     ),
                     const Text(
                       'AED 50.00',
                       style: TextStyle(
                           color: pickerBlackColor,
                           fontWeight: FontWeight.w500,
                           fontSize: 22),
                     ),
                     const Divider(color: pickerGoldColor,),
                     const Padding(
                       padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                       child:  Column(
                         children: [
                           RowItem( label: 'Reference Number ',value: '12345678901',),
                           RowItem( label: 'Payment time ',value: '3 Jan 2024, 7.30',),
                           RowItem( label: 'Payment method ',value: 'Cash',),
                           RowItem( label: 'Recharge for ',value: '12345678901',),
                           RowItem( label: 'Recharge by ',value: 'Picker by',),
                           RowItem( label: 'Recharged for ',value: 'Jason Roy',),
                         ],
                       ),
                     ),
                   ],
                 )
               ),
             ),
             const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   onPressed: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(builder: (context) => const AddToWalletPage()),
                     // );
                   },
                   style: ElevatedButton.styleFrom(
                     elevation: 0,
                     backgroundColor: Colors.white,
                     surfaceTintColor: Colors.white,
                     side: const BorderSide(
                       width: 1.6,
                       color: pickerGoldColor,
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12.0),
                     ),
                   ),
                   child: Row(
                     children: [
                       Image.asset('Assets/Images/pdf_img.png'),
                       const Text(
                         'RECHARGE NOW',
                         style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(width: 10),
                 ElevatedButton(
                   onPressed: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(builder: (context) => const AddToWalletPage()),
                     // );
                   },
                   style: ElevatedButton.styleFrom(
                     elevation: 0,
                     backgroundColor: Colors.white,
                     surfaceTintColor: Colors.white,
                     side: const BorderSide(
                       width: 1.6,
                       color: pickerGoldColor,
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12.0),
                     ),
                   ),
                   child: Row(
                     children: [
                       Image.asset('Assets/Images/share.png'),
                       const Text(
                         'RECHARGE NOW',
                         style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                       ),
                     ],
                   ),
                 ),
               ],
             )
           ],
         ),
       ),
    );
  }
}
