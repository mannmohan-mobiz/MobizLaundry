import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import 'home_page_new.dart';

class UnDeliveredPage extends StatefulWidget {
  const UnDeliveredPage({super.key});

  @override
  State<UnDeliveredPage> createState() => _UnDeliveredPageState();
}

class _UnDeliveredPageState extends State<UnDeliveredPage> {
  final PickerRepository pickerRepository = PickerRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),)..add(UndeliveredListFetchEvent(
          authData.user_token.toString(), authData.user_id.toString())),
      child: Scaffold(
      backgroundColor: pickerBackgroundColor,
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
          'Undelivered',
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
      body:  BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is UndeliveredListFetching) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is UndeliveredListFetched) {
      final tData = state.unDeliveredList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tData.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (itemBuilder, index) =>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerWhiteColor),
                    boxShadow: const [BoxShadow(
                        color: Colors.grey, blurRadius: 7, offset: Offset(0, 4))
                    ]
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Checkbox(
                          activeColor: pickerGoldColor,
                          value: false,
                          side: const BorderSide(color: pickerGoldColor),
                          onChanged: (value) {}
                      ),
                    ),
                     RowItem(label: 'Customer name:', value: tData[index].customer.name,),
                     RowItem(label: 'Customer type:', value: tData[index].customer.customerType,),
                     RowItem(label: 'Mode of Delivery:',
                        value: tData[index].orderType,
                         isShowButton: true,
                        color: MaterialStateColor.resolveWith((states) {
                      if (tData[index].orderType == "Urgent") {
                        print(5555);
                        return pickerOrangeTypeColor;
                        } else
                        if (tData[index].orderType == "Express") {
                        print(6666);
                        return pickerYellowTypeColor;
                        } else
                        if (tData[index].orderType == "Normal") {
                      print(7777);
                      return pickerGreyTypeColor;
                      } else {
                      print(8888);
                      return Colors.transparent;
                      }
    },
                        )),
                     RowItem(label: 'Order Number:', value: tData[index].orderNumber,),
                     RowItem(label: 'Building Name/No:', value: tData[index].customer.buildingNo ,),
                     RowItem(label: 'Floor No:', value:  tData[index].customer.floorNumber ?? "0"),
                     RowItem(label: 'House No:', value:  tData[index].customer.flatNumber ?? "0"),
                     RowItem(label: 'Mobile No:', value:  tData[index].customer.mobile,),
                     RowItem(label: 'Delivery date/time:',
                         value:   '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${tData[index].deliveryDate}')).toString()}/${tData[index].deliveryTime}',
                      ),
                    const Divider(),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ColumItem(image: 'Assets/Images/view_icon.png',
                            label: 'View'),
                        const ColumItem(image: 'Assets/Images/nav_icon.png',
                            label: 'Navigate'),
                        ColumItem(
                            image: 'Assets/Images/call_icon.png',
                            onTap: (){
                              openDialer(tData[index].customer?.mobile);
                            },
                            label: 'Call'),
                         ColumItem(image: 'Assets/Images/deliver_image.png',
                            label: 'Deliver',
                           onTap: (){
                             pickerRepository.getUndeliveredStatusApi(token: authData.user_token.toString(),orderId:  tData[index].orderId).then((value) {
                               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePageNew(),), (route) => false);
                             });
                           },
                        ),
                      ],
                    )
                  ],
                ),
              ),
        ),
      );
    } else{
      return const Center(child: Text('No Data'));
    }
  },
),

    ),
);
  }
}
