import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import 'home_page_new.dart';

class PickingConfirmationPage extends StatefulWidget {
  const PickingConfirmationPage({super.key});

  @override
  State<PickingConfirmationPage> createState() =>
      _PickingConfirmationPageState();
}

class _PickingConfirmationPageState extends State<PickingConfirmationPage> {
  List<String> typeList = ['Normal', 'Express', 'Urgent'];
  List<Color> colorList = [
    pickerGreyTypeColor,
    pickerYellowTypeColor,
    pickerOrangeTypeColor
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(PickupListFetchEvent(
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
            'Pending Confirmation',
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
                'Pending for Confirmation',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              BlocBuilder<PickerBloc, PickerState>(
                builder: (context, state) {
                  if (state is PickupListFetching) {
                    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
                  } else if (state is PickupListFetched) {
                   final tData = state.fData;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tData.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (itemBuilder, index) => Container(
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
                              decoration:  BoxDecoration(
                                color: MaterialStateColor.resolveWith((states) {
                                  if(state.fData[index].orderType == "Urgent"){
                                 return pickerOrangeTypeColor;
                                } else if(state.fData[index].orderType == "Express"){
                                 return pickerYellowTypeColor;
                                } else if(state.fData[index].orderType == "Normal"){
                                 return pickerGreyTypeColor;
                                } else {
                                 return Colors.transparent;
                                }}),
                                // color: (){
                                //   switch(state.fData[index].orderType){
                                //     case "Urgent":
                                //     return pickerOrangeTypeColor;
                                //     case "Express":
                                //         return pickerYellowTypeColor;
                                //     case "Normal":
                                //         return pickerGreyTypeColor;
                                //     default:
                                //       return Colors.transparent;
                                //   }
                                // }(),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child:  Column(
                                children: [
                                  RowItem(
                                    label: 'Customer name:',
                                    value: tData[index].customer.name,
                                  ),
                                  RowItem(
                                    label: 'Order No:',
                                    value: tData[index].orderNumber,
                                  ),
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
                                    value: DateFormat('yyyy-MM-dd').format(tData[index].pickupDate).toString(),
                                  ),
                                  RowItem(
                                    label: 'Pickup time:',
                                    value: tData[index].pickupTime,
                                    isShow: true,
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
                                    child: const Text('Confirm',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: pickerBlackColor,
                                            fontWeight: FontWeight.w600)),
                                    onTap: () {
                                      showDialog(
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
                                                  Image.asset('Assets/Images/confirm_image.png'),
                                                  const Text(
                                                    'Do you really want to confirm this order ?',
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
                                                              'No',
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
                                                            onPressed: () {
                                                              Map<String, String> body = {
                                                                "id":authData.user_id.toString(),
                                                                "order_id":tData[index].orderId,
                                                                "pickup_date":DateFormat('yyyy-MM-dd').format(tData[index].pickupDate).toString(),
                                                                "pickup_time":tData[index].pickupTime
                                                              };
                                                              print('###Body Response$body');
                                                              BlocProvider.of<PickerBloc>(context).add(PickerConfirmOrderEvent(body, authData.user_token.toString()));
                                                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePageNew(),), (route) => false);
                                                            },
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
                                    },
                                  ),
                                  Container(
                                      width: 2,
                                      height: 20,
                                      color: pickerVerticalDividerColor),
                                  InkWell(
                                    onTap: (){
                                      //openDialer('987654321');
                                      openDialer(tData[index].customer.mobile);
                                    } ,
                                    child: const Text('Call',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: pickerBlackColor,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
}
