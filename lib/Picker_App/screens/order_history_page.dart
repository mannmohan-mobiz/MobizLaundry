import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'order_history_details_page.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final PickerRepository pickerRepository = PickerRepository();
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
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('From',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)
                    ),
                    child: TextField(
                      controller: fromDateController,
                      textAlign: TextAlign.center,
                      decoration:  const InputDecoration(
                          hintText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                InkWell(
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
                    child: Image.asset('Assets/Images/calendar.png'))
              ],
            ),
            const SizedBox(height: 30,),
            const Text('To',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: pickerGoldColor)
                    ),
                    child: TextField(
                      controller: toDateController,
                      textAlign: TextAlign.center,
                      decoration:  const InputDecoration(
                        hintText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                InkWell(
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
                    child: Image.asset('Assets/Images/calendar.png'))
              ],
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                onPressed: (){
                  // Map<String, String> data = {
                  //   "id": authData.user_id.toString(),
                  //   "from_date": fromDateController.text,
                  //   "to_date": toDateController.text
                  // };
                  // print('#########${(data)}');
                  // pickerRepository.getOrderReport(
                  //     token: authData.user_token.toString(), body: data)
                  //     .then((value) {
                  //       setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  OrderHistoryDetailsPage(fromDate: fromDateController.text,toDate: toDateController.text,)));
                  //       });
                  // });

                },
                child: const Text('LOAD',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            )

          ],
        ),
      ),
    );
  }
}
