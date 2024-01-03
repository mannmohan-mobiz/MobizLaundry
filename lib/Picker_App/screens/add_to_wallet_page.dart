import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/receipt_page.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class AddToWalletPage extends StatefulWidget {
  const AddToWalletPage({super.key});

  @override
  State<AddToWalletPage> createState() => _AddToWalletPageState();
}

class _AddToWalletPageState extends State<AddToWalletPage> {
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
          'Add to wallet',
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: pickerWhiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Collected Amount',
                      style: TextStyle(
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(width: 10,),
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
                            borderSide: const BorderSide(
                                color: pickerGoldColor), // Enabled border color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  backgroundColor: pickerGoldColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReceiptRechargePage()),
                  );
                },
               child: const Center(
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: pickerWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
