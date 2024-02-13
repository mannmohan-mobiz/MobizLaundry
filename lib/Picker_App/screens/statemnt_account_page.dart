import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/statement%20_account_detail_page.dart';
import 'package:intl/intl.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class StatementOfAccountPage extends StatefulWidget {
  final String? cstId;
  const StatementOfAccountPage({super.key,this.cstId});

  @override
  State<StatementOfAccountPage> createState() => _StatementOfAccountPageState();
}

class _StatementOfAccountPageState extends State<StatementOfAccountPage> {
  TextEditingController fromController = TextEditingController();
  TextEditingController fromToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.cstId);
    return Scaffold(
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
        title: const Text('Statement of account',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
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
                      controller: fromController,
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
                        initialDate: DateTime
                            .now(), //get today's date
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (fromDate != null) {
                      print(
                          fromDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(
                          fromDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(
                          formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        fromController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                    child: Image.asset('Assets/Images/calendar.png'),)
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
                      controller: fromToController,
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
                  DateTime? toDate =
                      await showDatePicker(
                      context: context,
                      initialDate: DateTime
                          .now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (toDate != null) {
                    print(toDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(toDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(formattedDate);
                    setState(() {
                      fromToController.text =
                          formattedDate;
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  StatementOfAccountDetailPage(customerId: widget.cstId,fromDate: fromController.text,toDate: fromToController.text, )));
                },
                child: const Text('LOAD',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            )

          ],
        ),
      ),
    );
  }
}
