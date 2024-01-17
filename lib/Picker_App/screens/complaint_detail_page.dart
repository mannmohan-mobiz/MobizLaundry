import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/table_row.dart';

class ComplaintDetailsPage extends StatefulWidget {
  const ComplaintDetailsPage({super.key});

  @override
  State<ComplaintDetailsPage> createState() => _ComplaintDetailsPageState();
}

class _ComplaintDetailsPageState extends State<ComplaintDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
            onPressed: () {
              close(context);
            },
            icon: Image.asset('Assets/Images/back_arrow.png')
        ),
        title: const Text('Complaints Details',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Complaint heading',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
                            SizedBox(height: 5,),
                            TableWidget(text: 'Complaint No', value: 'NXT5689715',colorValue: pickerGoldColor),
                            TableWidget(text: 'Status', value: 'Pending',colorValue: pickerGoldColor),
                            TableWidget(text: 'Date', value: '1.3.2023',colorValue: pickerGoldColor),
                            TableWidget(text: 'Order Number', value: 'XHG23456',colorValue: pickerGoldColor),
                            TableWidget(text: 'Type', value: 'Delayed Delivery',colorValue: pickerGoldColor),
                            TableWidget(text: 'Remark', value: 'Nil',colorValue: pickerGoldColor),
                            Divider(color: pickerDivColor,)
                          ],
                        ),
              ),
              ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Align(
                        alignment: Alignment.center,
                        child: Text('Reply from company',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
                    ),
                    SizedBox(height: 8,),
                    Text('We apologize for the delay in your laundry supply. Unforeseen circumstances occurred. Rest assured, we\'re working diligently to resolve this promptly.',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w300,fontSize: 13),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Center(child: Text('My Remark',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),)),
            const SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child:  Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: TextField(
                  controller: TextEditingController(),
                  decoration:  const InputDecoration(
                    border: InputBorder.none,
                  ),
                )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
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
                    child: const Text(
                          'Back',
                          style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                        ),
                  
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
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
                    child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                        ),
                  
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
