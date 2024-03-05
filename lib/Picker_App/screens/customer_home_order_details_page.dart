import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/container_widget.dart';

class CustomerHomeOrderDetailPage extends StatefulWidget {
  final String orderId;
  final String? statusValue;
  final String? orderDateValue;

  const CustomerHomeOrderDetailPage({super.key,required this.orderId,this.statusValue,this.orderDateValue});

  @override
  State<CustomerHomeOrderDetailPage> createState() => _CustomerHomeOrderDetailPageState();
}

class _CustomerHomeOrderDetailPageState extends State<CustomerHomeOrderDetailPage> {
  bool isDelivered = false;
  @override
  Widget build(BuildContext context) {
    print('####ORDID3#${widget.orderId}');
    print('####STATUS#${widget.statusValue}');
    print('####ORDDATE#${widget.orderDateValue}');
    return BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
    ..add(PckCustomerHistoryDetailFetchEvent(
        authData.user_token.toString(), widget.orderId.toString())),
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
             print('@@$state');
    if (state is PckCustHistoryDetailFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is PckCustHistoryDetailFetchedState) {
    final data = state.orderHistoryDetailList;
    print('@@$state');
            return ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            '${widget.statusValue}' == 'Delivered' ? Image.asset('Assets/Images/delivered.png') : Image.asset('Assets/Images/in_transit.png'),
                            const SizedBox(width: 10,),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.statusValue}', style: const TextStyle(
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),),
                                Text('Ordered ${widget.orderDateValue}', style: const TextStyle(
                                    color: pickerBlackColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                            shrinkWrap: true,
                          itemCount: data?.cart?.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (itemBuilder, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                      ),
                                      child:
                                        Image.network('$baseUrl${data?.cart?[index].itemService?.item?.itemImage}',
                                        fit: BoxFit.fill,
                                        ),
                               ),
                                  const SizedBox(width: 20),
                                   Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${data?.cart?[index].itemService?.item?.itemName}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('No of items',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            Text('${data?.cart?[index].quantity}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Rate',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            Text('AED ${data?.cart?[index].amount}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                       ),
                      ],
                    ),
                  ),
                ),
              ),
               ContainerWidgets(title: 'Delivery Time',
                  textTime: '${data?.deliveryTime}',
                  textDate: '${data?.deliveryDate}'),
              const Text(
                'Delivery address',
                style: TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
               Text(
                '${data?.deliveryAddress?.name},${data?.deliveryAddress?.flatNumber},${data?.deliveryAddress?.flatNumber},${data?.deliveryAddress?.buildingNo}',
                style: const TextStyle(
                    color: pickerBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total order price',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AED ${data?.totalAmount}',
                        style: const TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      InkWell(
                        onTap: (){
                          showCustomBottomSheet(
                            context,
                            title: 'Payment Information',
                             Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Net Taxable Value',
                                      style: TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'AED ${data?.netTaxable ?? 0}',
                                      style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Vat',
                                      style: TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'AED ${data?.vat ?? 0}',
                                      style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Wallet balance used',
                                      style: TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'AED ${data?.walletBalance}',
                                      style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Amount payable',
                                      style: TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'AED ${data?.totalAmount}',
                                      style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          );
                        },
                        child: const Text(
                          'View breakup',
                          style: TextStyle(
                              color: pickerGoldColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 8),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment method',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    '${data?.paymentMethod}',
                    style: const TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Service type',
                    style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    '${data?.orderType}',
                    style: const TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              )
            ],
          );
  } else {
      return const Center(child: Text('No Data'));
    }
           }

)

        )
    ),
);
  }
}
