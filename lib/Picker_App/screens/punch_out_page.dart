import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/home_page_new.dart';

import '../../Repositories/AttendanceRepo/attendance_repository.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';

class PunchOutPage extends StatefulWidget {
  final String? attendanceId;
  const PunchOutPage({super.key,this.attendanceId});

  @override
  State<PunchOutPage> createState() => _PunchOutPageState();
}

class _PunchOutPageState extends State<PunchOutPage> {
  final PickerRepository pickerRepository = PickerRepository();

  @override
  Widget build(BuildContext context) {
    getPunchData().then((value) => {
      debugPrint('getPunchData $value')
    });
    print('####${widget.attendanceId}');
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
          'Punch Out',
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
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          children: [
            Center(child: Image.asset('Assets/Images/punch_img.png')),
            const SizedBox(height: 30,),
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
                  pickerRepository.getPunchOutApi(token: authData.user_token.toString(), attendanceId: widget.attendanceId.toString()).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomePageNew()));
                  });
                  removePunchData();
                },
                child: const Text('Punch Out',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            )

          ],
        ),
      ),
    );
  }
}
