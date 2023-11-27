import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';

import '../BLoCs/ServiceBloc/service_bloc.dart';
import '../Picker_App/src/colors.dart';
import 'Service_staff_dashboard_75.dart';

class ServiceAddClients extends StatefulWidget {
  const ServiceAddClients({Key? key}) : super(key: key);

  @override
  State<ServiceAddClients> createState() => _ServiceAddClientsState();
}

class _ServiceAddClientsState extends State<ServiceAddClients> {
  TextEditingController dob = TextEditingController();
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController buildController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController altController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController credLmtController = TextEditingController();
  TextEditingController credDaysController = TextEditingController();
  TextEditingController credInvController = TextEditingController();

  bool isVisible = false;

  List<String> customerType = [
    'Home',
    'Corporate',
  ];

  String cType = '';
  String pgId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StaffServiceDashboard(),), (route) => false),
          ),
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          title: Center(
              child: Text("ADD CLIENTS",
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Customer Details",
                    style: TextStyle(
                        color: pickerPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: pickerPrimaryColor, width: .5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintText: "Username",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: passwordController,
                            obscureText: isVisible ? false : true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: (){
                                if (isVisible) {
                                  setState(() {
                                    isVisible = false;
                                  });
                                } else {
                                  setState(() {
                                    isVisible = true;
                                  });
                                }
                              }, icon: Icon(
                                isVisible ? Icons.visibility_off : Icons.visibility,
                                color: pickerPrimaryColor,
                              ),
                              ),
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: buildController,
                            decoration: InputDecoration(
                              hintText: "Building.No",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: roomController,
                            decoration: InputDecoration(
                              hintText: "Room No",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: mobileController,
                            decoration: InputDecoration(
                              hintText: "Mobile",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: whatsappController,
                            decoration: InputDecoration(
                              hintText: "WhatsApp",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: altController,
                            decoration: InputDecoration(
                              hintText: "Alt.Mobile",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: latController,
                            decoration: InputDecoration(
                              hintText: "GPSE",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: longController,
                            decoration: InputDecoration(
                              hintText: "GPSN",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5),
                          IconButton(
                            icon: const Icon(Icons.my_location,
                                color: pickerPrimaryColor),
                            onPressed: () {
                              getLocation();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    "Account Details",
                    style: TextStyle(
                        color: pickerPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: pickerPrimaryColor, width: .5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      BlocProvider(
                        create: (context) => ServiceBloc(
                          RepositoryProvider.of<ServiceRepository>(context),
                        )..add(ServiceLocPrcFetchingEvent(authData.user_token.toString())),
                        child: BlocBuilder<ServiceBloc, ServiceState>(
                          builder: (context, state) {
                            if (state is ServiceLocPrcFetchingState) {
                              print(state.toString());
                              return CircularProgressIndicator();
                            } else if (state is ServiceLocPrcFetchedState) {
                              print(state.toString());
                              return Row(
                                children: [
                                  Flexible(
                                      child: RadioListTile(
                                        value: customerType[0],
                                        groupValue: cType,
                                        onChanged: (value) {
                                          setState(() {
                                            cType = value.toString();
                                          });
                                          state.lpData.priceGroupList.forEach((element) {
                                            if (cType == element.name) {
                                              setState(() {
                                                pgId = '';
                                                pgId = element.priceGroupId;
                                              });
                                            }
                                          });
                                          print('C-Type : $cType & PgId: $pgId');
                                        },
                                        title: Text("Home"),
                                      )),
                                  Flexible(
                                      child: RadioListTile(
                                        value: customerType[1],
                                        groupValue: cType,
                                        onChanged: (value) {
                                          setState(() {
                                            cType = value.toString();
                                          });
                                          state.lpData.priceGroupList.forEach((element) {
                                            if (cType == element.name) {
                                              setState(() {
                                                pgId = '';
                                                pgId = element.priceGroupId;
                                              });
                                            }
                                          });
                                          print('C-Type : $cType & PgId: $pgId');
                                        },
                                        title: Text("Corporate"),
                                      )),
                                ],
                              );
                            } else {
                              print(state.toString());
                              return Text('Error');
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: credLmtController,
                            decoration: InputDecoration(
                              hintText: "Credit Limit",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: credDaysController,
                            decoration: InputDecoration(
                              hintText: "Credit Days",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 5),
                          Expanded(
                              child: TextField(
                            controller: credInvController,
                            decoration: InputDecoration(
                              hintText: "Credit Invoice",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: pickerPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: (){
                      if (
                        userNameController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      mobileController.text.isNotEmpty &&
                      cType.isNotEmpty && pgId.isNotEmpty
                      ) {
                        Map<String, String> body = {
                          "id":authData.user_id.toString(),
                          "username":userNameController.text,
                          "name":nameController.text,
                          "email":emailController.text,
                          "password":passwordController.text,
                          "customer_type":cType,
                          "building_no":buildController.text ?? "",
                          "room_no":roomController.text ?? "",
                          "mobile":mobileController.text ,
                          "alt_mobile":altController.text ?? "",
                          "whats_app":whatsappController.text ?? "",
                          "credit_limit":credLmtController.text ?? "",
                          "credit_days":credDaysController.text ?? "",
                          "credit_invoices":credInvController.text ?? "",
                          "GPSE":latController.text,
                          "GPSN":longController.text,
                          "price_group_id":pgId
                        };
                        print(body);
                        BlocProvider.of<ServiceBloc>(context).add(ServiceAddnewClientEvent(authData.user_token.toString(), body));
                        Future.delayed(
                            Duration(seconds: 1),
                                () =>
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StaffServiceDashboard(),), (route) => false)
                        );
                      } else {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("Enter Sufficient Data"),
                            actions: [
                              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
                            ],
                          );
                        },);
                      }

                    },
                    child: Text(
                      "Add Data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      latController.text = position.latitude.toString();
      longController.text = position.longitude.toString();
    });
  }

}
