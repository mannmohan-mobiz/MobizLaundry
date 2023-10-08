import 'package:flutter/material.dart';
import 'package:integrate_3screens/Picker_App/screens/stock_transfer.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class NewOrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewOrderScreenState();
}

class NewOrderScreenState extends State<NewOrderScreen> {
  int count = 0;
  int neworderradio = 0;
  int availableoffersradio = 0;
  int containerradio = 0;
  bool directStaffCheckbox = false;
  bool contactlessCheckbox = false;
  bool isTableRowSelected = false;
  Color color = pickerPrimaryColor;
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(text: 'New Order',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [


              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: size.height * 0.01, left: size.width * 0.03),
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Text("Create New",style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text("Choose Category"),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        border: Border.all(color: pickerPrimaryColor)),
                    child: Center(child: Text("Select")),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_double_arrow_right),
                  Text("Press & Fold"),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.width * .22,
                          child: Image.network(
                              "https://media.istockphoto.com/id/876424182/photo/classic-mens-shirts-stacked-on-white-background.jpg?s=612x612&w=0&k=20&c=oNZHUUeVply_VbGFsOMq8SRnjlT7nKHYaCxtRFF_kbc=",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text("Shirts"),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.05),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(child: Text("2")),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.width * .22,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2tlgZdrKLNeLPlbP0zl02dReKBTrW0E7-Qub2fVC-&s",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text("Pants"),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.05),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(child: Text("2")),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.width * .22,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSICdcjySxvv87gkppr_k6NlpvFob5rHlJVcEdg6IAOwg&s",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text("Others"),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.05),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(child: Text("2")),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showContainer = !showContainer;
                  });
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Visibility(
                visible: showContainer,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Icon(Icons.keyboard_double_arrow_down),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width /
                                1.2, // Increased width
                            child: ListView.builder(
                              itemCount: 1,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // Increased width
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.deepPurple),
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
                                                border: Border.all(
                                                    color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Category",
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
                                                border: Border.all(
                                                    color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "No of Items",
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
                                                border: Border.all(
                                                    color: Colors.deepPurple),
                                              ),
                                              child: Text(
                                                "Rate",
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
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width: MediaQuery.of(context).size.width /
                                          1.2, // Increased width
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: 2,
                                        itemBuilder: (BuildContext context,
                                            int rowIndex) {
                                          return SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              itemCount: 1,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.2,
                                                  // Increased width
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                margin: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.01),
                                                                decoration:
                                                                    new BoxDecoration(
                                                                  color:
                                                                      pickerPrimaryColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                margin: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.01),
                                                                decoration:
                                                                    new BoxDecoration(
                                                                  color:
                                                                      pickerPrimaryColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mode of Delivery"),
                        Checkbox(
                          activeColor: Colors.lightBlue,
                          value: directStaffCheckbox,
                          onChanged: (value) {
                            setState(() {
                              directStaffCheckbox = value!;
                            });
                          },
                        ),
                        Text('Normal 5'),
                        SizedBox(width: 10),
                        Checkbox(
                          activeColor: Colors.lightBlue,
                          value: contactlessCheckbox,
                          onChanged: (value) {
                            setState(() {
                              contactlessCheckbox = value!;
                            });
                          },
                        ),
                        Text('Express 10'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("To be Delivered on"),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple)),
                          // Add your desired content for the container here
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Time"),
                        SizedBox(
                          width: 90,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple)),
                          // Add your desired content for the container here
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {

                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>  StockTransferScreen(),
                              ));
                        },
                        child: Text("Save"))
                  ],
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
