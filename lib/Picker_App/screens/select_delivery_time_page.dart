import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/select_category.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';

class SelectDeliveryTimePage extends StatefulWidget {
  const SelectDeliveryTimePage({super.key});

  @override
  State<SelectDeliveryTimePage> createState() => _SelectDeliveryTimePageState();
}

class _SelectDeliveryTimePageState extends State<SelectDeliveryTimePage> {


  List<DateTime> dateTime = [];
  List<String> selectTime = [
    '11:00AM - 12:00PM',
    '12:00PM - 1:00PM',
    '1:00PM - 2:00PM',
    '7:00PM - 8:00PM',
    '8:00AM - 9:00PM',
    '9:00AM - 10:00PM',
  ];

  List<String> selectDay = [
    'Friday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
  ];

  List<String> selectDate = [
    '08 Dec 2023',
    '09 Dec 2023',
    '10 Dec 2023',
    '11 Dec 2023',
    '12 Dec 2023',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context)
  )..add(PickupDeliveryDateListFetchEvent(
    authData.user_token.toString(), authData.user_id.toString())),
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dateTime.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                height: 75,
                                width: 128,
                                decoration: BoxDecoration(
                                    color: Colors.white,
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
                                        const Text(
                                          '',
                                         // selectDay[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13, color: pickerGoldColor, fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${dateTime[index]}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 15, color: pickerGoldColor, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 22),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: selectTime.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: pickerGoldColor, width: 2)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                child: Text(
                                  selectTime[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 13, color: pickerGoldColor, fontWeight: FontWeight.w600),
                                ),
                              )
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectCategory()));
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
        ),
    ),
);
  }
}
