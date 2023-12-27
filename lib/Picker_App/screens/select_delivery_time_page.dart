import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/select_category.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/delivery_time.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';

class SelectDeliveryTimePage extends StatefulWidget {
  final String? mode;
  final String? deliveryDate;
  final String? custID;

  const SelectDeliveryTimePage({super.key, this.mode,this.deliveryDate,this.custID});

  @override
  State<SelectDeliveryTimePage> createState() => _SelectDeliveryTimePageState();
}

class _SelectDeliveryTimePageState extends State<SelectDeliveryTimePage> {
  String selectedDate = '';
  String isSelectedTimeData = '';
  final PickerRepository pickerRepository = PickerRepository();
  bool isSelected = false;
  DeliveryTimeList? selectedTime;
  String mode_of_action = "save_order";


  @override
  Widget build(BuildContext context) {
    print('#####IDDDDD####${widget.custID.toString()}');
    print('#####${widget.mode.toString()}');
    return BlocProvider(
  create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context)
  )..add(PickupDeliveryDateListFetchEvent(
    authData.user_token.toString(), widget.mode.toString())),
  child: Scaffold(
        backgroundColor:  pickerBackgroundColor,
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
            'Delivery Times',
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
        body:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Time of Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 75,
                    child: BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                    if (state is PickupDeliveryDateListFetching) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: pickerGoldColor,
                          ));
                    } else if(state is PickupDeliveryDateListFetched){
                      final data = state.date;

                       return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          print('QQQQQ${data[index].date}');
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: (){
                                selectedDate =  DateFormat('yyyy-MM-dd').format(data[index].date);
                                print('#######DATE#$selectedDate');
                                pickerRepository.getDeliveryTimeList(token: authData.user_token.toString(), deliveryDate: selectedDate).then((value) {
                                  setState(() {
                                    selectedTime = value;
                                  });
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color:   selectedDate ==  DateFormat('yyyy-MM-dd').format(data[index].date) ? pickerGoldColor : Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: pickerGoldColor, width: 2)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                           Text(
                                             data[index].day,
                                            //'${DateFormat('EEEE').format(data[index])}',
                                            textAlign: TextAlign.center,
                                            style:  TextStyle(fontSize: 13,
                                                color: selectedDate ==  DateFormat('yyyy-MM-dd').format(data[index].date) ?  Colors.white : pickerGoldColor, fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            DateFormat('dd-MMM-yyyy').format(data[index].date),
                                            //DateFormat('dd-MMM-yyyy').format(data[index]),
                                            textAlign: TextAlign.center,
                                            style:  TextStyle(fontSize: 15,
                                                color: selectedDate ==  DateFormat('yyyy-MM-dd').format(data[index].date) ?  Colors.white : pickerGoldColor, fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          );
                        }
                    );
                    } else {
                      return const Center(child: Text('No Data'));
                    }
  },
),
                  ),
                  const SizedBox(height: 22),
                  BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                    final List<String> tData = (selectedTime?.data) ?? [];
                  if (tData.isNotEmpty){

                  return ListView.builder(
                    physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isSelectedTimeData = tData[index];
                              });

                                print('#######TIME#$isSelectedTimeData');
                                print('#######TIMESELECTION#${isSelectedTimeData == tData[index]}');
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isSelectedTimeData == tData[index] ? pickerGoldColor : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: pickerGoldColor, width: 2)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                  child: Text(
                                    tData[index],
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(fontSize: 13,
                                        color: isSelectedTimeData == tData[index] ? Colors.white :  pickerGoldColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  );
                } else {
                  return const Center(child: Text(''));
                }
  },
),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Map<String, String> data = {
                          "id": authData.user_id.toString(),
                          "customer_id": widget.custID.toString(),
                          "order_type":  widget.mode.toString(),
                          "Delivery_date": selectedDate,
                          "Delivery_time": isSelectedTimeData
                        };
                        print('#########${(data)}');
                        print(jsonEncode(data));
                        pickerRepository.saveNewOrder(token: authData.user_token.toString(),body: data);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SelectCategory()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pickerGoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(fontSize: 16.0, color: pickerWhiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    ),
);
  }
}
