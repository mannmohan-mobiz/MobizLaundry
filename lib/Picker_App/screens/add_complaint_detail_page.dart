import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class AddComplaintDetailPage extends StatefulWidget {
  const AddComplaintDetailPage({super.key});

  @override
  State<AddComplaintDetailPage> createState() => _AddComplaintDetailPageState();
}

class _AddComplaintDetailPageState extends State<AddComplaintDetailPage> {
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
        title: const Text('Add new Complaint',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (itemBuilder, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          color: pickerWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              ListTile(
                                leading:  Image.asset('Assets/Images/delivered.png'),
                                title:  const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('Delivered', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),),
                                    Text('Ordered on ', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),),
                                  ],
                                ),
                                trailing: InkWell(
                                    onTap: () {

                                    },
                                    child: Image.asset('Assets/Images/rounded.png')),
                              ),
                              const RowItem(label: 'Order Number:',
                                value:'INX 346789088',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Number of items:',
                                value: '12',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Amount paid:',
                                value: 'AED 100',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
            ),
            const SizedBox(height: 15,),
            Container(
              height: 56,
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: pickerWhiteColor,
                border: Border.all(color: pickerGoldColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select the type of complaint',style: TextStyle(
                      fontSize: 14,color: pickerBlackColor
                  ),),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: pickerGoldColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
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
                      hintText: 'Note customer complaint here...',
                      border: InputBorder.none,
                    ),
                  )
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  backgroundColor: pickerGoldColor,
                ),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'REGISTER NOW!',
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
