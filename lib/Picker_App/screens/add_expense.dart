import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends State<AddExpenseScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'Add Expense',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                padding: EdgeInsets.all(smallTextPadding),
                width: size.width * 0.3,
                child:  ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                    ),
                    elevation: 15.0,
                  ),
                  child:  Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                  width: size.width * 0.3,
                  height: size.height * 0.04,
                  decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          side: BorderSide(width: 1, color: pickerPrimaryColor))),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Date'
                      ),
                    ),
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                  width: size.width * 0.4,
                  height: size.height * 0.04,
                  decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          side: BorderSide(width: 1, color: pickerPrimaryColor))),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Expense Head'
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: size.height * 0.02),
                            child:  Text('Amount'),
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                              width: size.width * 0.45,
                              height: size.height * 0.04,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(width: 1, color: pickerPrimaryColor))),
                              child: Container(
                                margin: EdgeInsets.only(top: size.height * 0.015),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: ''
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: size.height * 0.02),
                            child:  Text('Remarks'),
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                              width: size.width * 0.45,
                              height: size.height * 0.04,
                              decoration: ShapeDecoration(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(width: 1, color: pickerPrimaryColor))),
                              child: Container(
                                margin: EdgeInsets.only(top: size.height * 0.015),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: ''
                                  ),
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.03),
                      width: size.width * 0.15,
                      height: size.height * 0.08,
                      decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide(width: 1, color: pickerPrimaryColor))),
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.015),
                        alignment: Alignment.center,
                        child: Text('Bill Pic')
                      )
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.06),
                padding: EdgeInsets.all(smallTextPadding),
                width: size.width * 0.25,
                child:  ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: pickerPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    elevation: 15.0,
                  ),
                  child:  Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }
}
