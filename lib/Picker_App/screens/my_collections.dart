import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class MyCollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCollectionScreenState();
}

class MyCollectionScreenState extends State<MyCollectionScreen> {
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
        child: Appbar(text: 'My Collections',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Center(
                        child: Text(
                      'From Date :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                        width: size.width * 0.2,
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
                                hintText: 'From Date'
                            ),
                          ),
                        )
                    ),
                    Spacer(),
                    Center(
                        child: Text(
                          'To Date :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                        width: size.width * 0.2,
                        height: size.height * 0.04,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: pickerPrimaryColor))),
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.015),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'To Date'
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Center(
                        child: Text(
                          'Mode',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.08),
                        width: size.width * 0.2,
                        height: size.height * 0.04,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: pickerPrimaryColor))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('All')
                        )
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.keyboard_double_arrow_right,color: pickerPrimaryColor,size: 25,)),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Center(
                      child: Text('Cash/Cheque/Wallet/Card',
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    height: size.height * 0.3,
                    width: MediaQuery.of(context).size.width *
                        0.9, // Increased width
                    child: ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              height: size.height * 0.06,
                              width: MediaQuery.of(context).size.width /
                                  0.8, // Increased width
                              child:  Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.deepPurple),
                                  ),
                                  child:   Container(
                                      margin: EdgeInsets.only(right: size.width *0.06),
                                      width: size.width * 0.45,
                                      height: size.height * 0.045,
                                      decoration: ShapeDecoration(
                                          color: Colors.transparent,
                                          shape: RoundedRectangleBorder (
                                              borderRadius: BorderRadius.circular(2.0),
                                              side: BorderSide(
                                                  width: 2,
                                                  color: pickerPrimaryColor
                                              )
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:EdgeInsets.only(left: size.width * 0.02),
                                            child: Text('Search....',),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: pickerLightGreyColor
                                              ),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.search,
                                                  color: pickerPrimaryColor,
                                                  size: 22,
                                                ),
                                                onPressed: () {},
                                              )
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              height: size.height * 0.08,
                              width: MediaQuery.of(context).size.width /
                                  0.8, // Increased width
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        " Sl No",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Client Name",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Amount",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Mode",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "Balance",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 1.35,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                itemCount: 2,
                                itemBuilder:
                                    (BuildContext context, int rowIndex) {
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child: SizedBox(
                                      height: size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.width * 1.5,
                                      child: ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.05),
                                            height: size.height * 0.05,
                                            width:
                                            MediaQuery.of(context).size.width *
                                                1.5,
                                            // Increased width
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.deepPurple),
                                                    ),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.deepPurple),
                                                    ),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.deepPurple),
                                                    ),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.deepPurple),
                                                    ),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.deepPurple),
                                                    ),
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: size.height * 0.05,
                              width: MediaQuery.of(context).size.width /
                                  0.8, // Increased width
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.5,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.deepPurple),
                                    ),
                                    child: Text(
                                      " Total",
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: size.width * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "100",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: size.width * 0.65,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        " Total",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: size.width * 0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                      ),
                                      child: Text(
                                        "100",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
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
