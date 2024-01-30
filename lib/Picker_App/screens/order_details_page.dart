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
import '../util/table_row.dart';

class OrderDetailsPage extends StatefulWidget {
  final String? orderId;
  const OrderDetailsPage({super.key,this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {

  List<String> title = ['Press & Fold', 'Press & Hang'];
  List<String> titleData = ['Shirts', 'Pants'];
  List<String> titleDataValue = ['2', '2'];
  @override
  Widget build(BuildContext context) {
    print('ORDID###${widget.orderId}');
    return BlocProvider(
    create: (context) =>  PickerBloc(
    RepositoryProvider.of<PickerRepository>(context),)..add(PckOrderReportDetailFetchEvent(
    authData.user_token.toString(),widget.orderId.toString())),
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
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Container(
            decoration: BoxDecoration(color: pickerWhiteColor,borderRadius: BorderRadius.circular(12)),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: BlocBuilder<PickerBloc, PickerState>(
              builder: (context, state) {
                if (state is PckOrdReportDetailFetchingState) {
                return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
                } else if (state is PckOrdReportDetailFetchedState) {
                  final tData = state.orderReportDetailList;
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Item Name/Category', style: TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),),
                        const SizedBox(height: 10,),
                         TableWidget(text: 'Order No',
                            value: '${tData?.cart[0].order.orderNumber}',
                            colorValue: pickerGoldColor),
                         TableWidget(text: 'Date',
                          value: DateFormat('yyyy-MM-dd').format(DateTime.parse('${tData?.cart[0].order.orderDate}')),
                          colorValue: pickerGoldColor,),
                         TableWidget(text: 'Status',
                          value: '${tData?.cart[0].order.status}',
                          colorValue: pickerGoldColor,),
                        const Divider(color: pickerDividerColor, thickness: 1,),
                        const SizedBox(height: 10,),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: tData?.cart.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (itemBuilder, index) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        Text('${tData?.cart[index].itemService.category.serviceMaster.categoryName}',
                                          style: const TextStyle(
                                              color: pickerBlackColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 10),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: tData?.cart.length,
                                            physics: const BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (itemBuilder, index) =>
                                                TableWidget(
                                                    text: '${tData?.cart[index].itemService.item.itemName}',
                                                    value: '${tData?.cart[index].quantity}',
                                                    colorValue: pickerGoldColor),
                                          ),
                                        ),
                                        const Divider(color: pickerDividerColor,
                                          thickness: 1,),
                                      ]
                                  ),
                                )

                        )
                      ]

                  );
                } else {
                  return const Center(child: Text('No Data'));
                }
  },
),
            ),
          ),
        )
    ),
);
  }
}
