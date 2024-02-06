import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class DeliveredScreen extends StatefulWidget {
  const DeliveredScreen({super.key});

  @override
  State<DeliveredScreen> createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  bool isDelivered = false;
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
          title: const Text('Order History',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
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
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        DateTime? fromDate =
                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (fromDate != null) {
                          print(fromDate);
                          String formattedDate =
                          DateFormat('dd-MM-yyyy').format(fromDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(formattedDate);
                          setState(() {
                            fromDateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: pickerWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: pickerGoldColor)
                        ),
                        child: AbsorbPointer(
                          // This widget absorbs pointer events, preventing the TextField from being editable
                          absorbing: true,
                          child: TextField(
                            controller: fromDateController,
                            textAlign: TextAlign.center,
                            decoration:  const InputDecoration(
                              hintText: "From Date",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        DateTime? fromDate =
                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (fromDate != null) {
                          print(fromDate);
                          String formattedDate =
                          DateFormat('dd-MM-yyyy').format(fromDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(formattedDate);
                          setState(() {
                            toDateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: pickerWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: pickerGoldColor)
                        ),
                        child: AbsorbPointer(
                          // This widget absorbs pointer events, preventing the TextField from being editable
                          absorbing: true,
                          child: TextField(
                            controller: toDateController,
                            textAlign: TextAlign.center,
                            decoration:  const InputDecoration(
                              hintText: "To Date",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pickerGoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      onPressed: (){
                        // if(fromDateController.text.isEmpty){
                        //   snackBar(context, message: 'Please choose From date');
                        // } else if(toDateController.text.isEmpty){
                        //   snackBar(context, message: 'Please choose To date');
                        // } else {
                        //   Map<String, String> data = {
                        //     "customer_id": widget.customerId.toString(),
                        //     "from_date": fromDateController.text,
                        //     "to_date": toDateController.text
                        //   };
                        //   print('#########${(data)}');
                        //   pickerRepository.getCustomerHistoryResults(
                        //       token: authData.user_token.toString(), body: data)
                        //       .then((value) {
                        //     setState(() {
                        //       customerHistoryData = value.data;
                        //     });
                        //     // if(value.status == false) {
                        //     // snackBar(context, message: value.message.toString());
                        //     // }
                        //   });
                        // }
                      },
                      child: const Text('LOAD',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (itemBuilder, index) {
                    return  Card(
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
                            children: [
                              ListTile(
                                leading: Image.asset('Assets/Images/delivered.png'),
                                title:  const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivered', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),),
                                    Text('on 12.12.2023 ', style: TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),),
                                  ],
                                ),
                                // trailing: InkWell(
                                //     onTap: () {},
                                //     child: Image.asset('Assets/Images/for_arrow.png')),
                              ),
                              const RowItem(label: 'Customer Name:',
                                value: 'Jason Roy',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Customer type:',
                                value: 'Home',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Order Number:',
                                value:'INX 8989898989',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'No of items:',
                                value: '15',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Building name/number:',
                                value: '',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Floor no:',
                                value: '',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'House no:',
                                value: '',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Mobile no:',
                                value: '',
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
                              const RowItem(label: 'Balance to pay:',
                                value: 'AED 10',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                              const RowItem(label: 'Delivery date/time:',
                                value: '1.4.2023/7am to 9am',
                                fontSize: 13,
                                fontSizeValue: 13,
                                fontWeightValue: FontWeight.w300,
                                fontWeight: FontWeight.w300,),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
        )
    );
  }
}
