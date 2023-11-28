// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'ServiceNewOrder_Screen.dart';
// import 'Service_new_order.dart';
// import 'Service_staff_dashboard_75.dart';
//
// class ServiceNewOrder extends StatefulWidget {
//   const ServiceNewOrder({Key? key}) : super(key: key);
//
//   @override
//   State<ServiceNewOrder> createState() => _ServiceNewOrderState();
// }
//
// class _ServiceNewOrderState extends State<ServiceNewOrder> {
//   String? selectedStaff;
//   String? selectedMode;
//
//   List<String> staffNames = ['Staff 1', 'Staff 2', 'Staff 3'];
//   List<String> modeOptions = ['Urgent', 'Normal', 'Express'];
//
//   String selectedOption = '';
//   bool expressSelected = false;
//   bool normalSelected = false;
//   String Time = 'Select Time';
//   List<String> Timerange = [
//     'Select Time',
//     '09:00am to 11:00am',
//     '11:00am to 01:00pm',
//     '01:00pm to 03:00pm',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
//         elevation: 0,
//         backgroundColor: CupertinoColors.white,
//         title: Center(
//             child: Text("NEW ORDER",
//                 style: TextStyle(
//                     color: Colors.deepPurple,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500))),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Icon(
//               Icons.refresh_outlined,
//               color: Colors.deepPurple,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.deepPurple),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Mobile Number/Customer ID",
//                     contentPadding: EdgeInsets.all(10),
//                     border: InputBorder.none,
//                     suffixIcon: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(20),
//                               topRight: Radius.circular(20))),
//                       child: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               width: 150,
//               child: ElevatedButton(onPressed: () {
//                 _showDropdownDialog();
//               },
//                 child: Text('New Pickup',style: TextStyle(color: Colors.white),),
//                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
//               ),
//             ),
//             SizedBox(height: 30,),
//             SizedBox(
//               width: 150,
//               child: ElevatedButton(onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceServiceNewOrder(),));
//               },
//                 child: Text('Collect Items',style: TextStyle(color: Colors.white),),
//                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showDropdownDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           surfaceTintColor: Colors.white,
//           title: Text('Select Options'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Select Staff'),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.deepPurple)),
//                 child: DropdownButtonFormField<String>(
//                   decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
//                   value: selectedStaff,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedStaff = newValue;
//                     });
//                   },
//                   items: staffNames.map((staffName) {
//                     return DropdownMenuItem<String>(
//                       value: staffName,
//                       child: Text(staffName),
//                     );
//                   }).toList(),
//                   hint: Text(staffNames[0]),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Select Mode'),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.deepPurple)),
//                 child: DropdownButtonFormField<String>(
//                   decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
//                   value: selectedMode,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedMode = newValue;
//                     });
//                   },
//                   items: modeOptions.map((mode) {
//                     return DropdownMenuItem<String>(
//                       value: mode,
//                       child: Text(mode),
//                     );
//                   }).toList(),
//                   hint: Text(modeOptions[0]),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Picking Time'),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.deepPurple)),
//                 child: DropdownButtonFormField(
//                     validator: (d) {
//                       if (d!.contains('Select Your Time')) {
//                         return 'Select Your Time';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border:
//                       OutlineInputBorder(borderSide: BorderSide.none),
//                       contentPadding: EdgeInsets.only(),
//                       prefix: SizedBox(
//                         width: 10,
//                       ),
//                       hintText: 'Select Your TIme',
//                     ),
//                     value: Time,
//                     items: Timerange
//                         .map((e) => DropdownMenuItem(
//                       value: e,
//                       child: Text(e),
//                     ))
//                         .toList(),
//                     onChanged: (v) {
//                       setState(() {
//                         Time = v!;
//                       });
//                     }),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Perform any action on the selected options if needed
//                 Navigator.of(context).pop();
//               },
//               child: Text('Confirm'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/new_order_save.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceNewOrder/newOrderData.dart';
import 'package:golden_falcon/Picker_App/screens/new_order_2.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/CustomerRepo/customer_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/choose_categ_subCateg.dart';
import 'package:golden_falcon/Utils/common.dart';
import 'package:intl/intl.dart';
import 'package:golden_falcon/Picker_App/screens/stock_transfer.dart';

class ServiceNewOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ServiceNewOrderState();
}

class ServiceNewOrderState extends State<ServiceNewOrder> {
  String selectedCustomer = "Select Client";
  String selectedCustomerId = "";
  String selectedType = "Select Type";
  TextEditingController pickup_dt_controller = TextEditingController();
  TextEditingController pickup_tmt_controller = TextEditingController();
  TextEditingController del_dt_controller = TextEditingController();
  TextEditingController del_tm_controller = TextEditingController();
  List<String> customerData = [];
  List<MainOrderData> orderData = [];
  String new_order_id = "";
  List<String> orderType = ['Select Type', 'Normal', 'Express', 'Urgent'];
  String mode_of_action = "save_order";

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("NEW ORDER",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, String> data = {
            "id": authData.user_id.toString(),
            "customer_id": selectedCustomerId,
            "pickup_date": pickup_dt_controller.text,
            "pickup_time": pickup_tmt_controller.text,
            "order_type": selectedType,
            "Delivery_date": del_dt_controller.text,
            "Delivery_time": del_tm_controller.text
          };
          print(jsonEncode(data));
          BlocProvider.of<ServiceBloc>(context)
              .add(ServiceMainOrderAddEvent(authData.user_token.toString(), data));
          setState(() {
            mode_of_action = "get_items";
          });
        },
        child: Text("Save"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                            width: size.width * 0.3,
                            height: size.height * 0.06,
                            decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Colors.deepPurple))),
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.015),
                              alignment: Alignment.center,
                              child: TextField(
                                  controller:
                                  pickup_dt_controller, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      hintText:
                                      "Pickup Date" //label text of field
                                  ),
                                  readOnly:
                                  true, // when true user cannot edit text
                                  onTap: () async {
                                    DateTime? pickedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime
                                            .now(), //get today's date
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                      String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(
                                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2022-07-04
                                      //You can format date as per your need

                                      setState(() {
                                        pickup_dt_controller.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  }),
                            )),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                            width: size.width * 0.3,
                            height: size.height * 0.06,
                            decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Colors.deepPurple))),
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.015),
                              child: TextField(
                                  controller:
                                  pickup_tmt_controller, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons
                                          .timer_outlined), //icon of text field
                                      hintText:
                                      "Pickup Time" //label text of field
                                  ),
                                  readOnly:
                                  true, // when true user cannot edit text
                                  onTap: () async {
                                    final TimeOfDay? newTime =
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                      TimePickerEntryMode.input,
                                    );
                                    String time24Hours =
                                        newTime!.hour.toString() +
                                            ':' +
                                            newTime.minute.toString();
                                    final DateFormat inputFormat = DateFormat
                                        .Hm(); // Input format for 24-hour time
                                    final DateFormat outputFormat =
                                    DateFormat.Hms();
                                    final DateTime dateTime =
                                    inputFormat.parse(time24Hours);
                                    final String formattedTime =
                                    outputFormat.format(dateTime);
                                    pickup_tmt_controller.text =
                                        formattedTime;
                                  }),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                            width: size.width * 0.3,
                            height: size.height * 0.06,
                            decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Colors.deepPurple))),
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.015),
                              alignment: Alignment.center,
                              child: TextField(
                                  controller:
                                  del_dt_controller, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      hintText:
                                      "Delivery Date" //label text of field
                                  ),
                                  readOnly:
                                  true, // when true user cannot edit text
                                  onTap: () async {
                                    DateTime? pickedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime
                                            .now(), //get today's date
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                      String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(
                                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2022-07-04
                                      //You can format date as per your need

                                      setState(() {
                                        del_dt_controller.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  }),
                            )),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03),
                            width: size.width * 0.3,
                            height: size.height * 0.06,
                            decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Colors.deepPurple))),
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.015),
                              child: TextField(
                                  controller:
                                  del_tm_controller, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons
                                          .timer_outlined), //icon of text field
                                      hintText:
                                      "Delivery Time" //label text of field
                                  ),
                                  readOnly:
                                  true, // when true user cannot edit text
                                  onTap: () async {
                                    final TimeOfDay? newTime =
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                      TimePickerEntryMode.input,
                                    );
                                    String time24Hours =
                                        newTime!.hour.toString() +
                                            ':' +
                                            newTime.minute.toString();
                                    final DateFormat inputFormat = DateFormat
                                        .Hm(); // Input format for 24-hour time
                                    final DateFormat outputFormat =
                                    DateFormat.Hms();
                                    final DateTime dateTime =
                                    inputFormat.parse(time24Hours);
                                    final String formattedTime =
                                    outputFormat.format(dateTime);
                                    del_tm_controller.text = formattedTime;
                                  }),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  BlocProvider(
                    create: (context) => ServiceBloc(
                      RepositoryProvider.of<ServiceRepository>(context),
                    )..add(ServiceClientListFetchEvent(authData.user_token.toString(), authData.user_id.toString())),
                    child: BlocBuilder<ServiceBloc, ServiceState>(
                      builder: (context, state) {
                        if (state is ServiceClientListFetchingState) {
                          print("${state.toString()}");
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                  ),
                                  items: customerData.map((customer) {
                                    return DropdownMenuItem(
                                      value: customer,
                                      child: Center(child: Text(customer)),
                                    );
                                  }).toList(),
                                  value: selectedCustomer,
                                  onChanged: (value) {},
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
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
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          );
                        } else if (state is ServiceClientListFetchedState) {
                          print(state.toString());
                          if (customerData.isEmpty) {
                            customerData.add('Select Client');
                            
                            state.clientData.forEach((cl) {
                              customerData.add(cl.name);
                            });
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                  ),
                                  items: customerData.map((customer) {
                                    return DropdownMenuItem(
                                      value: customer,
                                      child: Center(child: Text(customer)),
                                    );
                                  }).toList(),
                                  value: selectedCustomer,
                                  onChanged: (value) {
                                    selectedCustomer = value!;
                                    state.clientData.forEach((cList) {
                                      if (value == cList.name) {
                                        selectedCustomerId = cList.customerId;
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
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
                                  onChanged: (value) {
                                    selectedType = value!;
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          print(state.toString());
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                  ),
                                  items: customerData.map((customer) {
                                    return DropdownMenuItem(
                                      value: customer,
                                      child: Center(child: Text(customer)),
                                    );
                                  }).toList(),
                                  value: selectedCustomer,
                                  onChanged: (value) {},
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple,
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
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state is ServiceAddedNewOrderState) {
                    print(state.toString());
                    // orderData.add(state.orderData);
                    if (orderData.isEmpty) {
                      orderData.add(state.orderData);
                    } else if (orderData.isNotEmpty) {
                      for (var i = 0; i < orderData.length; i++) {
                        if (state.orderData.customer != orderData[i].customer) {
                          orderData.add(state.orderData);
                        }
                      }
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          border: TableBorder.all(
                            color: Colors.deepPurple,
                          ),
                          showCheckboxColumn: false,
                          columns: const [
                            DataColumn(label: Center(child: Text("Sl.No"))),
                            DataColumn(label: Center(child: Text("Order Id"))),
                            DataColumn(label: Center(child: Text("Order No"))),
                            DataColumn(label: Center(child: Text("Customer Id"))),
                          ],
                          rows: List<DataRow>.generate(
                            orderData.length,
                                (index) {
                              return DataRow(
                                  onSelectChanged: (value) {
                                    authData.setOrdCstmrId(orderData[index].orderId, orderData[index].customer);
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceNewOrder2(cstId: orderData[index].customer),));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategorySubCategoryScreen(),));
                                  },
                                  cells: [
                                    DataCell(Center(child: Text('${(index + 1)}'))),
                                    DataCell(Center(child: Text(orderData[index].orderId))),
                                    DataCell(Center(child: Text(orderData[index].orderNumber))),
                                    DataCell(Center(child: Text(orderData[index].customer))),
                                  ]
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    print(state.toString());
                    return const Center(child: Text("Error"),);
                  }
                },
              )
            ],
          ),
        ),
      ),

    );
  }
}
