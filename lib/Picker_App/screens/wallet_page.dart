import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import 'add_to_wallet_page.dart';

class WalletNewPage extends StatefulWidget {
  const WalletNewPage({super.key});

  @override
  State<WalletNewPage> createState() => _WalletNewPageState();
}

class _WalletNewPageState extends State<WalletNewPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Container(
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.96, -0.27),
                    end: Alignment(0.96, 0.27),
                    colors: [Color(0xFFBBAA52), Color(0xFFD2C99B)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('Assets/Images/visa.png'),
                            Image.asset('Assets/Images/chip.png'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Balance',
                                  style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'AED 3500',
                                  style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                           // SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount to collect',
                                  style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'AED 50',
                                  style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddToWalletPage()),
                    );
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
                  child: const Text(
                    'RECHARGE NOW',
                    style: TextStyle(fontSize: 16.0, color: pickerBlackColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
