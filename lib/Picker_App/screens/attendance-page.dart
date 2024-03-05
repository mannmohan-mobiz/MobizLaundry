import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/punch_in_page.dart';
import 'package:intl/intl.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MMM-yyyy (EEEE)').format(currentDate);
    String formattedDay = DateFormat('dd').format(currentDate);

    return Scaffold(
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
          'Attendance',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          children: [
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PunchInPage()));
        },
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: pickerGoldColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.circular(
                                    15),
                              ),
                              child:  Column(
                                children: [
                                  Text(
                                    formattedDay,
                                    style: const TextStyle(
                                        color: pickerBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                      DateFormat('E').format(currentDate),
                                    style: const TextStyle(
                                        color: pickerGoldColor,
                                        fontSize: 20),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                      const SizedBox(width: 15,),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: pickerGoldColor,
                                fontSize: 15),
                          ),
                          const Text(
                            'Punch In',
                            style: TextStyle(
                                color: pickerGoldColor,
                                fontSize: 20),
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
      )
          ],
        ),
      ),
    );
  }
}
