import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/confirmed_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class ConfirmedOrdersPage extends StatefulWidget {
  const ConfirmedOrdersPage({super.key});

  @override
  State<ConfirmedOrdersPage> createState() => _ConfirmedOrdersPageState();
}

class _ConfirmedOrdersPageState extends State<ConfirmedOrdersPage> {
  List<String> typeList = ['Normal', 'Express', 'Urgent'];
  List<Color> colorList = [
    pickerGreyTypeColor,
    pickerYellowTypeColor,
    pickerOrangeTypeColor
  ];
  List<Color> colorListSub = [
    pickerOrangeTypeColor,
    pickerYellowTypeColor,
    pickerGreyTypeColor
  ];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    //colorListSubData = colorListSub[Random().nextInt(colorListSub.length)];
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(PickupConfirmedListFetchEvent(
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
            'Confirmed Orders',
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
        body: Padding(
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
                      itemBuilder: (itemBuilder, index) => Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                          Text(
                            typeList[index],
                            style: const TextStyle(
                                color: pickerBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                'Confirmed Orders',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              BlocBuilder<PickerBloc, PickerState>(
                builder: (context, state) {
                  print('res${state}');
                  if (state is PickupConfirmedListFetching) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: pickerGoldColor,
                    ));
                  } else if (state is PickupConfirmedListFetched) {
                    final tData = state.dataList;
                    print('DATA${tData}');
                    print('LENGTH${tData.length}');
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tData.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (itemBuilder, index)  {
                        print('33333 NAME###${tData[0].customer.name}');
                        print('33333 ORDER TYPE ###${state.dataList[index].orderType}');
                        print('ssssss ORDER TYPE ###${state.dataList[index].orderType == "URGENT"}');

                        return  Container(
                          margin: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              color: pickerWhiteColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: pickerWhiteColor),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 7,
                                    offset: Offset(0, 4))
                              ]),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: MaterialStateColor.resolveWith((states) {
                                    if (state.dataList[index].orderType == OrderType.URGENT) {
                                      print(5555);
                                      return pickerOrangeTypeColor;
                                    } else
                                    if (state.dataList[index].orderType == OrderType.EXPRESS) {
                                      print(6666);
                                      return pickerYellowTypeColor;
                                    } else
                                    if (state.dataList[index].orderType == OrderType.NORMAL) {
                                      print(7777);
                                      return pickerGreyTypeColor;
                                    } else {
                                      print(8888);
                                      return Colors.transparent;
                                    }
                                  }),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: Column(

                                  children: [
                                    RowItem(
                                        label: 'Customer name:',
                                        value: '${tData[index].customer.name}'),
                                    RowItem(
                                      label: 'Building Name/No:',
                                      value: tData[index].customer.buildingNo,
                                    ),
                                    RowItem(
                                      label: 'Floor No:',
                                      value: tData[index].customer.roomNo,
                                    ),
                                    RowItem(
                                      label: 'Room No/House No:',
                                      value: tData[index].customer.roomNo,
                                    ),
                                    RowItem(
                                      label: 'Mobile No:',
                                      value: tData[index].customer.mobile,
                                    ),
                                    RowItem(
                                      label: 'Pickup time:',
                                      value: tData[index].pickupTime,
                                      isShow: true,
                                      onPressed: () async {
                                          // Uri googleUrl = Uri.parse(
                                          //     'https://www.google.com/maps/search/?api=1&query=${'8.4858828,76.916693'}');
                                          // if (await canLaunchUrl(googleUrl)) {
                                          //   await launchUrl(googleUrl);
                                          // } else {
                                          //   throw 'Could not open the map';
                                          // }
                                      }
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      child: const Text('Collect Items',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: pickerBlackColor,
                                              fontWeight: FontWeight.w600)),
                                      onTap: () {
                                        showCollectItemDialog();
                                      },
                                    ),
                                    Container(
                                        width: 2,
                                        height: 20,
                                        color: pickerVerticalDividerColor),
                                    InkWell(
                                      child: const Text('Door Lock',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: pickerBlackColor,
                                              fontWeight: FontWeight.w600)),
                                      onTap: () {
                                        showDoorLockDialog();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2.0, vertical: 2),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: pickerLightGreenColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      //openDialer('987654321');
                                      openDialer(tData[index].customer.mobile);
                                    } ,
                                    child: const Center(
                                        child: Text('Call',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: pickerWhiteColor,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        ;
                      }
                    );
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDoorLockDialog() {
    return showDialog(
        context: context,
        builder: (mContext) => AlertDialog(
              backgroundColor: pickerWhiteColor,
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/Images/door_lock_image.png'),
                    const Text(
                      'Mark it as Door Lock ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                close(context);
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: pickerGoldColor, width: 2.0),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pickerGoldColor,
                              ),
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: pickerWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  showCollectItemDialog() {
    return showDialog(
        context: context,
        builder: (mContext) => AlertDialog(
              backgroundColor: pickerWhiteColor,
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/Images/collect_items_image.png'),
                    const Text(
                      'Do you really want to collect items from jason ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                close(context);
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: pickerGoldColor, width: 2.0),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pickerGoldColor,
                              ),
                              child: const Text(
                                'Collect',
                                style: TextStyle(
                                    color: pickerWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
