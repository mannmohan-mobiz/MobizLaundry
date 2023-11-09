import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:integrate_3screens/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:integrate_3screens/Models/PickerModel/location_price_model.dart';
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
  final bool fromHome;
  const AddClientScreen({super.key, required this.fromHome});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}
enum Animals { giraffe, lion, tiger }
class _AddClientScreenState extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? selectedOption;
    CustomerTypeList csType;
    Animals? _animal = Animals.giraffe;
    List<String> priceList = [];
    String selectedValue = "Select Group";

    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(FetchLocationPriceEvent(authData.user_token.toString())),
      child: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
          if (state is LocationPriceFetching) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(
                  color: pickerPrimaryColor,
                ),
              ),
            );
          } else if (state is LocationPriceFetched) {
            csType = state.ctList;
            priceList.add("Select Group");
            state.pgList.forEach((element) {
              priceList.add(element.name);
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
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
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: pickerPrimaryColor,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                const SizedBox(width: 5),
                                const Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  icon: const Icon(Icons.my_location, color: pickerPrimaryColor),
                                  onPressed: () {

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
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: pickerPrimaryColor,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: const Text('Giraffe'),
                                      leading: Radio<Animals>(
                                        value: Animals.giraffe,
                                        groupValue: _animal,
                                        onChanged: (Animals? value) {
                                          setState(() {
                                            _animal = value;
                                          });
                                          debugPrint(_animal!.name);
                                        },
                                      ),
                                    )),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Lion'),
                                    leading: Radio<Animals>(
                                      value: Animals.lion,
                                      groupValue: _animal,
                                      onChanged: (Animals? value) {
                                        setState(() {
                                          _animal = value;
                                        });
                                        debugPrint(_animal!.name);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Tiger'),
                                    leading: Radio<Animals>(
                                      value: Animals.tiger,
                                      groupValue: _animal,
                                      onChanged: (Animals? value) {
                                        setState(() {
                                          _animal = value;
                                        });
                                        debugPrint(_animal!.name);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                    child: TextField(
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: pickerPrimaryColor, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: DropdownButton(
                                items: priceList
                                    .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                isExpanded: false,
                                value: selectedValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold (
              appBar: AppBar(
                backgroundColor: pickerPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    widget.fromHome
                        ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyClientScreen()),
                            (route) => false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("No Data"),
              ),
            );
          }
        },
      ),
    );
  }

  // void getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   setState(() {
  //     gpse_controller.text = position.latitude.toString();
  //     gpsn_controller.text = position.longitude.toString();
  //   });
  // }
}
