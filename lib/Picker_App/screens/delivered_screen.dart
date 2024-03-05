import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/delivered_order_model.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class DeliveredScreen extends StatefulWidget {
  const DeliveredScreen({super.key});

  @override
  State<DeliveredScreen> createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final PickerRepository pickerRepository = PickerRepository();
  List<DeliveredOrder> deliveredList = [];
  bool checkStatus = true;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context)
    )..add(PickupDeliveredOrdersFetchEvent(
        authData.user_token.toString())),
    child: Scaffold(
        backgroundColor: pickerBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: pickerWhiteColor,
          toolbarHeight: 100.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
            side: BorderSide(color: pickerGoldColor),
          ),
          leading: IconButton(
              onPressed: () {
                close(context);
              },
              icon: Image.asset('Assets/Images/back_arrow.png')
          ),
          title: const Text('Order History',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('Assets/Images/notification_icon.png'),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
          child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
    if (state is DeliveredOrdersFetching) {
    return const Center(
    child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    }else if (state is DeliveredOrdersFetched) {
      final data = (deliveredList.isEmpty && checkStatus)
          ? state.deliveredOrderList
          : deliveredList;
      return ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    DateTime? fromDate =
                    await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        //get today's date
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (fromDate != null) {
                      print(fromDate);
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(
                          fromDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate);
                      setState(() {
                        fromDateController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: pickerGoldColor)
                    ),
                    child: AbsorbPointer(
                      // This widget absorbs pointer events, preventing the TextField from being editable
                      absorbing: true,
                      child: TextField(
                        controller: fromDateController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "From Date",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    DateTime? fromDate =
                    await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        //get today's date
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (fromDate != null) {
                      print(fromDate);
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(
                          fromDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate);
                      setState(() {
                        toDateController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: pickerGoldColor)
                    ),
                    child: AbsorbPointer(
                      // This widget absorbs pointer events, preventing the TextField from being editable
                      absorbing: true,
                      child: TextField(
                        controller: toDateController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "To Date",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pickerGoldColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: () {
                    if (fromDateController.text.isEmpty) {
                      snackBar(context, message: 'Please choose From date');
                    } else if (toDateController.text.isEmpty) {
                      snackBar(context, message: 'Please choose To date');
                    } else {
                      Map<String, String> data = {
                        "from_date": fromDateController.text,
                        "to_date": toDateController.text
                      };
                      print('#########${(data)}');
                      pickerRepository.getDeliveredOrder(
                          token: authData.user_token.toString(), body: data)
                          .then((value) {
                        setState(() {
                          deliveredList = value.data;
                        });
                        PickerBloc(pickerRepository).emit(DeliveredOrdersFetched(value.data));
                        if (value.status == false) {
                          setState(() {
                            checkStatus = false;
                          });
                          snackBar(context, message: value.message.toString());
                        }
                      });
                    }
                  },
                  child: const Text('LOAD', style: TextStyle(
                      color: pickerWhiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),),),
              )
            ],
          ),
          const SizedBox(height: 10),
           ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (itemBuilder, index) {
                      return Card(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            color: pickerWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      'Assets/Images/delivered.png'),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(data[index].status,
                                        style: const TextStyle(
                                            color: pickerBlackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),),
                                      Text(
                                        'on ${DateFormat('dd-MM-yyyy').format(
                                            data[index].deliveryDate)}',
                                        style: const TextStyle(
                                            color: pickerBlackColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),),
                                    ],
                                  ),
                                  // trailing: InkWell(
                                  //     onTap: () {},
                                  //     child: Image.asset('Assets/Images/for_arrow.png')),
                                ),
                                RowItem(label: 'Customer Name:',
                                  value: data[index].customerAddress.name,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Customer type:',
                                  value: data[index].customerAddress
                                      .customerType,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Order Number:',
                                  value: data[index].orderNumber,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'No of items:',
                                  value: '${data[index].noOfItems}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Building name/number:',
                                  value: '${data[index].customerAddress
                                      .buildingName} / ${data[index]
                                      .customerAddress.buildingNo} ',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Floor no:',
                                  value: data[index].customerAddress
                                      .floorNumber,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Flat no:',
                                  value: data[index].customerAddress.flatNumber,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Mobile no:',
                                  value: data[index].mobile,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Amount paid:',
                                  value: data[index].amountPaid,
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Balance to pay:',
                                  value: '${data[index].balanceAmount}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                RowItem(label: 'Delivery date/time:',
                                  value: '${DateFormat('dd-MM-yyyy').format(
                                      data[index].deliveryDate)} /${data[index]
                                      .deliveryTime}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                )

        ],
      );
    } else {
      return const Center(child: Text('No Data'));
    }
  },
),
        )
    ),
);
  }
}
