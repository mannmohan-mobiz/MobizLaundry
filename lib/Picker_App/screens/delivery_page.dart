import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import 'deliver_to_customers.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  List<String> typeList = ['Normal','Express','Urgent'];
  List<Color> colorList = [pickerGreyTypeColor,pickerYellowTypeColor,pickerOrangeTypeColor];
  List<Color> colorListSub = [pickerOrangeTypeColor,pickerYellowTypeColor,pickerGreyTypeColor];
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context)
  )..add(DeliveryListFetchEvent(
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
        title: const Text('Delivery',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body:   BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is DeliveryListFetching) {
    return const Center(
    child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    }else if (state is DeliveryListFetched) {
      final data = state.deliveryDataList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) =>
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: colorList[index],
                                    border: Border.all(color: pickerGoldColor),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Text(typeList[index], style: const TextStyle(
                                color: pickerBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),),
                          ],
                        ),
                  ),
                )
              ],
            ),
             Text('Out for Delivery(${data.orderListCount})', style: const TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.orderList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: pickerWhiteColor),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(0, 4))
                        ]
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration:  BoxDecoration(
                            color:  MaterialStateColor.resolveWith((states) {
                              if(data.orderList[index].orderType == "Urgent"){
                                return pickerOrangeTypeColor;
                              } else if(data.orderList[index].orderType == "Express"){
                                return pickerYellowTypeColor;
                              } else if(data.orderList[index].orderType == "Normal"){
                                return pickerGreyTypeColor;
                              } else {
                                return Colors.transparent;
                              }}),
                              borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),),
                          ),
                          child:  Column(
                            children: [
                              RowItem(
                                label: 'Customer name:', value: data.orderList[index].customerName,),
                              RowItem(label: 'Building Name/No:', value: '${data.orderList[index].address.buildingName} / ${data.orderList[index].address.buildingNo}',),
                              RowItem(label: 'Floor No:', value: data.orderList[index].address.floorNumber,),
                              RowItem(label: 'Room No/House No:', value: '${data.orderList[index].address.flatNumber} / ${data.orderList[index].address.floorNumber}',),
                               RowItem(label: 'Mobile No:', value: data.orderList[index].customerNumber,),
                              RowItem(label: 'Delivery time:',
                                value: data.orderList[index].deliveryTime,
                                isShow: true,),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: const Text('Deliver', style: TextStyle(
                                    fontSize: 14,
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w600)),
                                onTap: () {
                                  open(context,  DeliverToCustomers(ordId: data.orderList[index].orderId,customerId: data.orderList[index].customer));
                                },
                              ),
                              Container(width: 2,
                                  height: 20,
                                  color: pickerVerticalDividerColor),
                              InkWell(
                                child: const Text('Door Lock', style: TextStyle(
                                    fontSize: 14,
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w600)),
                                onTap: () {
                                  showDoorLockDialog();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ),
          ],
        ),
      );
    } else {
      return const Center(child: Text('No Data'));
    }
  },
),
    ),
);
  }

  showDoorLockDialog(){
    return showDialog(
        context: context,
        builder: (mContext) =>  AlertDialog(
          backgroundColor: pickerWhiteColor,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(12),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('Assets/Images/door_lock_image.png'),
                const Text(
                  'Mark it as Door Lock ?',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(onPressed: (){
                          close(context);
                        },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: pickerGoldColor, width: 2.0),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                          ),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pickerGoldColor,
                          ),
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: pickerWhiteColor,fontSize: 16,fontWeight: FontWeight.w600),
                          ),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
