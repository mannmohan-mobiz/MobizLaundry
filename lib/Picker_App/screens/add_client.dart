import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:integrate_3screens/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:integrate_3screens/Picker_App/screens/homepage.dart';
import 'package:integrate_3screens/Picker_App/screens/my_client.dart';
import 'package:integrate_3screens/Picker_App/src/colors.dart';
import 'package:integrate_3screens/Picker_App/src/dimen.dart';
import 'package:integrate_3screens/Repositories/AuthRepo/auth_repository.dart';
import 'package:integrate_3screens/Repositories/PickerRepo/picker_repo.dart';

import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  bool isFirstForm = true;
  bool readyToSubmit = false;
  bool isVisible = false;
  bool _radioValue1 = false;
  bool _radioValue2 = false;
  int callData = 1;
  List<String> locData = [];
  List<String> pgData = [];
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController user_name_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
  TextEditingController alt_controller = TextEditingController();
  TextEditingController build_controller = TextEditingController();
  TextEditingController room_controller = TextEditingController();
  TextEditingController whatsapp_controller = TextEditingController();
  TextEditingController gpse_controller = TextEditingController();
  TextEditingController gpsn_controller = TextEditingController();
  TextEditingController credit_days_controller = TextEditingController();
  TextEditingController credit_lmt_controller = TextEditingController();
  TextEditingController credit_invoice_controller = TextEditingController();
  String? locId;
  String? pgId;

  String loc = "Select Location";
  String price_group = "Select Price Group";
  String client_type = "Select Type";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(
          text: 'Add New Client',
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            isFirstForm && !readyToSubmit
                ? Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Basic Info',
                            style: TextStyle(fontSize: dashboardHeaderText2),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: first_name_controller,
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: last_name_controller,
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: email_controller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: user_name_controller,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: password_controller,
                                obscureText: isVisible ? false : true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: isVisible
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                                  labelText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Contact Details',
                            style: TextStyle(fontSize: dashboardHeaderText2),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: mobile_controller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: "Mobile No.",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: alt_controller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: "Alt. Number",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: build_controller,
                                decoration: InputDecoration(
                                  labelText: "Building No.",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: room_controller,
                                decoration: InputDecoration(
                                  labelText: "Room No.",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: whatsapp_controller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Whatsapp No.",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: pickerPrimaryColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Location Details',
                            style: TextStyle(fontSize: dashboardHeaderText2),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: gpse_controller,
                                decoration: InputDecoration(
                                  labelText: "GPSE",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: gpsn_controller,
                                decoration: InputDecoration(
                                  labelText: "GPSN",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color:
                                            pickerPrimaryColor), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                getLocation();
                              },
                              icon: Icon(Icons.my_location,
                                  color: pickerPrimaryColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  )
                : Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Account Details',
                            style: TextStyle(fontSize: dashboardHeaderText2),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: true,
                              groupValue: _radioValue1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _radioValue1 = value!;
                                  _radioValue2 = !value;
                                });
                              },
                            ),
                            Text('Home'),
                            Radio(
                              value: true,
                              groupValue: _radioValue2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _radioValue2 = value!;
                                  _radioValue1 = !value;
                                });
                              },
                            ),
                            Text('Corporate'),
                          ],
                        ),
                        SizedBox(height: 8),
                        BlocProvider(
                          create: (context) => PickerBloc(
                            RepositoryProvider.of<PickerRepository>(context),
                          )..add(FetchLocationPriceEvent(
                              authData.user_token.toString())),
                          child: BlocBuilder<PickerBloc, PickerState>(
                            builder: (context, state) {
                              if (state is LocationPriceFetching) {
                                print(state.toString());
                                return Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: locData.map((location) {
                                          return DropdownMenuItem(
                                            value: location,
                                            child:
                                                Center(child: Text(location)),
                                          );
                                        }).toList(),
                                        value: loc,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: pgData.map((priceG) {
                                          return DropdownMenuItem(
                                            value: priceG,
                                            child: Center(child: Text(priceG)),
                                          );
                                        }).toList(),
                                        value: price_group,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                );
                              } else if (state is LocationPriceFetched) {
                                callData = 1;
                                print(state.toString());
                                print(callData);
                                if (locData.isEmpty && pgData.isEmpty) {
                                  locData.add('Select Location');
                                  pgData.add('Select Price Group');
                                  state.loc_data.forEach((locationData) {
                                    locData.add(locationData.name);
                                  });
                                  state.prc_data.forEach((priceGroupData) {
                                    pgData.add(priceGroupData.name);
                                  });
                                } else {
                                  print("Not Empty");
                                }
                                print("**********************************");
                                print(pgData.toList());
                                print(locData.toList());
                                print("**********************************");
                                return Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: locData.map((location) {
                                          return DropdownMenuItem(
                                            value: location,
                                            child:
                                                Center(child: Text(location)),
                                          );
                                        }).toList(),
                                        value: loc,
                                        onChanged: (value) {
                                          if (value != "Select Location") {
                                            state.loc_data.forEach((ld) {
                                              if (value == ld.name) {
                                                locId = ld.locationId;
                                                loc = value!;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: pgData.map((priceG) {
                                          return DropdownMenuItem(
                                            value: priceG,
                                            child: Center(child: Text(priceG)),
                                          );
                                        }).toList(),
                                        value: price_group,
                                        onChanged: (value) {
                                          if (value != "Select Price Group") {
                                            state.prc_data.forEach((pgd) {
                                              if (value == pgd.name) {
                                                pgId = pgd.priceGroupId;
                                                price_group = value!;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                print(state.toString());
                                return Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: locData.map((location) {
                                          return DropdownMenuItem(
                                            value: location,
                                            child:
                                                Center(child: Text(location)),
                                          );
                                        }).toList(),
                                        value: loc,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: pickerPrimaryColor,
                                                width: 1.5),
                                          ),
                                        ),
                                        items: pgData.map((priceG) {
                                          return DropdownMenuItem(
                                            value: priceG,
                                            child: Center(child: Text(priceG)),
                                          );
                                        }).toList(),
                                        value: price_group,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
            SizedBox(height: 12),
            isFirstForm && !readyToSubmit
                ? InkWell(
                    onTap: () {
                      if (first_name_controller.text.isNotEmpty &&
                          last_name_controller.text.isNotEmpty &&
                          user_name_controller.text.isNotEmpty &&
                          password_controller.text.isNotEmpty &&
                          mobile_controller.text.isNotEmpty &&
                          email_controller.text.isNotEmpty) {
                        setState(() {
                          isFirstForm = false;
                          callData = 0;
                        });
                      }
                    },
                    child: Material(
                      elevation: 10,
                      shape: CircleBorder(
                          side: BorderSide(color: pickerPrimaryColor)),
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(2),
                        width: size.width / 2,
                        decoration: BoxDecoration(
                            color: pickerPrimaryColor, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : InkWell(
              onTap: () {
                Map<String, String> data = {};
                print("Pressed");
                if (locId!.isNotEmpty &&
                    pgId!.isNotEmpty &&
                    _radioValue1 || _radioValue2) {
                  setState(() {
                    isFirstForm = true;
                    readyToSubmit = true;
                  });
                  data = {
                    "id": authData.user_id.toString(),
                    "username": user_name_controller.text,
                    "first_name": first_name_controller.text,
                    "last_name": last_name_controller.text,
                    "email": email_controller.text,
                    "password": password_controller.text,
                    "customer_type": _radioValue1 ? 'Home' : 'Corporate',
                    "building_no": build_controller.text ?? "",
                    "room_no": room_controller.text ?? "",
                    "mobile": mobile_controller.text,
                    "alt_mobile": alt_controller.text ?? "",
                    "whats_app": whatsapp_controller.text ?? "",
                    "credit_limit": credit_lmt_controller.text ?? "",
                    "credit_days": credit_days_controller.text ?? "",
                    "credit_invoices":
                    credit_invoice_controller.text ?? "",
                    "GPSE": gpse_controller.text ?? "",
                    "GPSN": gpsn_controller.text ?? "",
                    "location_id": locId!,
                    "price_group_id": pgId!
                  };
                }
                print(jsonEncode(data));
                print(_radioValue1 );
                print(_radioValue2);
                BlocProvider.of<PickerBloc>(context).add(AddNewClientEvent(data, authData.user_token.toString()));
                Future.delayed(
                  Duration(seconds: 2),
                      () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyClientScreen()), (route) => false),
                );
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.all(2),
                width: size.width / 2,
                decoration: BoxDecoration(
                  color: pickerPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Add Client',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      gpse_controller.text = position.latitude.toString();
      gpsn_controller.text = position.longitude.toString();
    });
  }
}
