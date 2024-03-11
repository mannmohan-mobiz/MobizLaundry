import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/punch_out_page.dart';

import '../../Repositories/AttendanceRepo/attendance_repository.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'home_page_new.dart';

class PunchInPage extends StatefulWidget {
  const PunchInPage({super.key});

  @override
  State<PunchInPage> createState() => _PunchInPageState();
}

class _PunchInPageState extends State<PunchInPage> {
  final PickerRepository pickerRepository = PickerRepository();
  String? attenceId;

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
          'Punch In',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          children: [
            Center(child: Image.asset('Assets/Images/punch_img.png')),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Mark Attendance',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            const Text(
              'Click the Punch In Button to mark your attendance',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (){
                  pickerRepository.getPunchInApi(token: authData.user_token.toString(), ).then((value) {
                    setState(() {
                      attenceId = value.data?.attendanceId;
                    });
                    setPunchData(attenceId);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomePageNew()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  PunchOutPage(attendanceId: attenceId)));
                    print(attenceId);
                  });

                },
                child: const Text('Punch In',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            )

          ],
        ),
      ),
    );
  }
}
