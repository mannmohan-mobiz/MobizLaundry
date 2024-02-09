import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/receipt_page.dart';

import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';

class AddToWalletPage extends StatefulWidget {
  final String? customerId;
  const AddToWalletPage({super.key,this.customerId});

  @override
  State<AddToWalletPage> createState() => _AddToWalletPageState();
}

class _AddToWalletPageState extends State<AddToWalletPage> {
  final PickerRepository pickerRepository = PickerRepository();
  TextEditingController collectedAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('CUSTID##4${widget.customerId}');
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
                        controller: collectedAmountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.black,
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
                  if(collectedAmountController.text.isEmpty){
                    snackBar(context, message: 'Please enter the amount');
                  } else {
                    Map<String, String> data = {
                      "customer_id": widget.customerId.toString(),
                      "amount": collectedAmountController.text,
                    };
                    print('#########${(data)}');
                    pickerRepository.rechargeWalletApi(
                        token: authData.user_token.toString(), body: data)
                        .then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>  ReceiptRechargePage(transId: value.data.transferId)),);
                    });
                  }
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
