
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class AttendanceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AttendanceScreenState();

}
class AttendanceScreenState extends State<AttendanceScreen>
{
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text: 'Attendance'),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height:  size.height * 0.08,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Click to Punch In',
                      style: TextStyle(fontSize: 12,color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'),
              fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }

}