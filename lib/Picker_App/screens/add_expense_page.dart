import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String selectedType = "Select Expense Type";
  List<String> orderType = ['Select Expense Type', 'Normal', 'Express', 'Urgent'];
  TextEditingController dateController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController billPicController = TextEditingController();




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
        title: const Text('Add Expense',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          children:  [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Amount',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 18),),
                const SizedBox(height: 15,),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: pickerGoldColor)
                  ),
                  child: TextField(
                    controller: TextEditingController(),
                    textAlign: TextAlign.center,
                    decoration:  const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: pickerGoldColor,
                      width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: pickerGoldColor,
                      width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: pickerGoldColor,
                      width: 1.5),
                ),
              ),
              items: orderType.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Center(child: Text(type)),
                );
              }).toList(),
              value: selectedType,
              onChanged: (value) {}
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: pickerGoldColor)
              ),
              child: TextField(
                controller: billPicController,
                textAlign: TextAlign.center,
                decoration:   InputDecoration(
                  hintText: "Upload Bill pic",
                  border: InputBorder.none,
                    suffixIcon: Image.asset('Assets/Images/camera.png')
                ),
              ),
            ),
            const SizedBox(height: 20,),
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
                      controller: dateController,
                      textAlign: TextAlign.center,
                      decoration:  const InputDecoration(
                        hintText: "05.12.2023",
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
                          dateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: Image.asset('Assets/Images/calendar.png'))
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: pickerGoldColor)
              ),
              child: TextField(
                maxLines: 8,
                controller: commentController,
                textAlign: TextAlign.center,
                decoration:   const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                onPressed: (){

                },
                child: const Text('Save',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            )
          ],
        ),
      ),

    );
  }
}


