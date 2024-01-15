import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/collect_items_model.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/container_widget.dart';
import '../util/row_value.dart';

class CollectItemsPage extends StatefulWidget {
  final String orderId;
  final String customerId;
  const CollectItemsPage({super.key,required this.orderId,required this.customerId});

  @override
  State<CollectItemsPage> createState() => _CollectItemsPageState();
}

class _CollectItemsPageState extends State<CollectItemsPage> {
  final PickerRepository pickerRepository = PickerRepository();
  late CollectItems? data;
  List<String> priceValueData = [];
  bool isExpanded = false;
  String selectedOption = '';
  var selectedWalletBalance;

  void decrementQuantity(int index) {
    setState(() {
      int currentQuantity = int.parse(data!.cart[index].quantity.toString());
      if ( currentQuantity > 1) {
        currentQuantity--;
        data!.cart[index].quantity = currentQuantity.toString();
      }
    });
  }

  void incrementQuantity(int index, ) {
    setState(() {
      int currentQuantity = int.parse(data!.cart[index].quantity.toString());
      currentQuantity++;
      data!.cart[index].quantity = currentQuantity.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    print('ORDERID###${widget.orderId}');
    print('CSTID###${widget.customerId}');
    return BlocProvider(
      create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
        ..add(PckCollectItemsFetchEvent(
            authData.user_token.toString(), widget.orderId.toString())),
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
          'Collect Items',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //   Map<String, String> data = {
              //     "id": authData.user_id.toString(),
              //     "customer_id": selectedCustomerId,
              //     "pickup_date": pickup_dt_controller.text,
              //     "pickup_time": pickup_tmt_controller.text,
              //     "order_type": selectedType,
              //     "Delivery_date": del_dt_controller.text,
              //     "Delivery_time": del_tm_controller.text
              //   };
              //   print(jsonEncode(data));
              //   BlocProvider.of<PickerBloc>(context)
              //       .add(AddNewOrderEvent(data, authData.user_token.toString()));
              //   setState(() {
              //     mode_of_action = "get_items";
              //   });
            },
            child: const Icon(Icons.add,color: pickerGoldColor,)
        ),
      body:  BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
      if (state is PckCollectItemsFetchingState) {
      return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
      } else if (state is PckCollectItemsFetchedState) {
         data = state.collectItemsData;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
               ContainerWidgets(title: 'Delivery Time',
                  textTime: '${state.collectItemsData?.cart![0].order.deliveryTime}',
                  textDate:  DateFormat('yyyy-MM-dd').format(DateTime.parse('${state.collectItemsData?.cart![0].order.deliveryDate}')),),
               const RowValue(label: 'Payment Method', labelValue: 'COD',),
              // BlocProvider(
              //   create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
              //     ..add(PickupPaymentListFetchEvent(
              //         authData.user_token.toString())),
              //   child: Column(
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             isExpanded = !isExpanded;
              //           });
              //         },
              //         child: Container(
              //           height: 56,
              //           width: double.infinity,
              //           padding: const EdgeInsets.all(18),
              //           decoration: BoxDecoration(
              //             color: pickerWhiteColor,
              //             border: Border.all(color: pickerGoldColor),
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(selectedOption,style: const TextStyle(
              //                   fontSize: 14,color: pickerBlackColor
              //               ),),
              //               Icon(
              //                 isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              //                 size: 24,
              //                 color: pickerGoldColor,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       AnimatedContainer(
              //         duration: const Duration(milliseconds: 300),
              //         width: double.infinity,
              //         height: isExpanded ? 120 : 0,
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           color: pickerWhiteColor,
              //           border: Border.all(color: pickerGoldColor),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: BlocBuilder<PickerBloc, PickerState>(
              //             builder: (context, state) {
              //               if (state is PickupPaymentListFetching) {
              //                 return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
              //               } else if (state is PickupPaymentListFetched) {
              //                 final data = state.paymentList;
              //                 return ListView.builder(
              //                   scrollDirection: Axis.vertical,
              //                   shrinkWrap: true,
              //                   itemCount: data?.length,
              //                   itemBuilder: (BuildContext context, int index) =>
              //                       ListTile(
              //                         title:  Text('${data?[index].paymentMethod}',style: const TextStyle(
              //                             fontSize: 12,color: pickerBlackColor
              //                         ),),
              //                         onTap: () {
              //                           setState(() {
              //                             selectedOption = '${data?[index].paymentMethod}';
              //                             isExpanded = false;
              //                           });
              //                           if( selectedOption == 'Wallet') {
              //                             Map<String, String> data = {
              //                               "id": authData.user_id.toString(),
              //                               "order_id": widget.orderId,
              //                               "customer_id":  widget.customerId,
              //                             };
              //                             pickerRepository.getWalletBalanceApi(token: authData.user_token.toString(),body: data).then((value) {
              //                               setState(() {
              //                                 selectedWalletBalance = value.walletBalance;
              //                               });
              //                               print('BALANCE###$selectedWalletBalance');
              //                             }
              //                             );
              //                           }
              //
              //                         },
              //                       ),
              //                 );
              //               } else {
              //                 return const Center(child: Text('No Data'));
              //               }
              //             }
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
               RowValue(
                label: 'Order Type', labelValue: '${state.collectItemsData?.cart![0].order.orderType}',),
               RowValue(
                  label: 'Service Type', labelValue: '${state.collectItemsData?.cart![0].itemService.category
                  .serviceMaster.categoryName}''/''${state.collectItemsData?.cart![0]
                  .itemService.subCategory.subServiceMaster.subCatName}'),
              const Text('Items to be picked',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,)),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.collectItemsData?.cart.length,
                itemBuilder: (BuildContext context, int index) {
                  priceValueData.add(state.collectItemsData!.cart[index]
                      .amount);
                  return Card(
                    elevation: 10,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Image.network(
                                      '$baseUrl${state.collectItemsData
                                          ?.cart[index].itemService
                                          .item.itemImage}',
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.collectItemsData?.cart[index]
                                            .itemService.item
                                            .itemName}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          const Text(
                                            'No of items',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  decrementQuantity(index);
                                                  print('#####$index');
                                                  Map<String,
                                                      String>dataList = {
                                                    "id": authData.user_id
                                                        .toString(),
                                                    "order_id": widget.orderId,
                                                    "cart_id": '${data
                                                        ?.cart[index].cartId}',
                                                    "price_list_id": '${data
                                                        ?.cart[index]
                                                        .priceList}',
                                                    "item_ser_id": '${data
                                                        ?.cart[index]
                                                        .itemService
                                                        .itemSerId}',
                                                    "quantity": '${data
                                                        ?.cart[index]
                                                        .quantity}',
                                                  };
                                                  print(
                                                      '#########${(dataList)}');
                                                  pickerRepository
                                                      .getCartQuantityPrice(
                                                      token: authData.user_token
                                                          .toString(),
                                                      body: dataList).then((
                                                      value) {
                                                    setState(() {
                                                      priceValueData[index] =
                                                          value.data.amount;
                                                    });
                                                  });
                                                },
                                                child: Image.asset(
                                                  'Assets/Images/decrement.png',
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 4.0),
                                                child: Text(
                                                  '${data?.cart[index]
                                                      .quantity}',
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight
                                                        .w600,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  incrementQuantity(index);
                                                  Map<String,
                                                      String> dataList = {
                                                    "id": authData.user_id
                                                        .toString(),
                                                    "order_id": widget.orderId,
                                                    "cart_id": '${data
                                                        ?.cart[index].cartId}',
                                                    "price_list_id": '${data
                                                        ?.cart[index]
                                                        .priceList}',
                                                    "item_ser_id": '${data
                                                        ?.cart[index]
                                                        .itemService
                                                        .itemSerId}',
                                                    "quantity": '${data
                                                        ?.cart[index].quantity}'
                                                  };
                                                  print(
                                                      '#########${(dataList)}');
                                                  pickerRepository
                                                      .getCartQuantityPrice(
                                                      token: authData.user_token
                                                          .toString(),
                                                      body: dataList).then((
                                                      value) {
                                                    setState(() {
                                                      priceValueData[index] =
                                                          value.data.amount;
                                                    });
                                                  });
                                                },
                                                child: Image.asset(
                                                  'Assets/Images/increment.png',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          const Text(
                                            'Rate',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            priceValueData[index] != null ? 'AED ${priceValueData[index]}' :
                                            'AED ${state.collectItemsData?.cart[index].amount}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 10,),
              TextField(
                  controller: TextEditingController(),
                  maxLines: 8,
                  style: const TextStyle(
                      color: pickerCommentColor),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Write Your Order Comment Here..',
                    hintStyle: TextStyle(
                      inherit: true,
                      fontSize: 13,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: pickerGoldColor), // Enabled border color
                    ),

                  )
              ),
              // const SizedBox(height: 2,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 8),
              //       child: ElevatedButton(
              //         onPressed: () {
              //           close(context);
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.white,
              //           surfaceTintColor: Colors.white,
              //           side: const BorderSide(
              //             width: 1.0,
              //             color: pickerGoldColor,
              //           ),
              //           //padding: EdgeInsets.symmetric(horizontal: 84.0),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(9),
              //           ),
              //         ),
              //         child: const Text(
              //           'Submit',
              //           style: TextStyle(
              //               fontSize: 16, fontWeight: FontWeight.w600),
              //         ),
              //       ),
              //     ),
              //
              //   ],
              // ),
              const RowValue(label: 'Amount',
                  labelValue: 'AED 100',
                  labelValueColor: pickerBlackColor),
              // const RowValue(label: 'Delivery Charges',
              //     labelValue: 'AED 0',
              //     labelValueColor: pickerBlackColor),
               RowValue(label: 'VAT',
                  labelValue:'AED ${state.collectItemsData?.cart[0].order.vat ?? '0'}',
                  labelValueColor: pickerBlackColor),
               RowValue(label: 'Total Payable',
                  labelValue:  'AED ${state.collectItemsData?.cart[0].order.totalAmount}',
                  labelValueColor: pickerBlackColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Collected Amount',
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                              color: pickerGoldColor), // Enabled border color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: pickerGoldColor,
                  ),
                  onPressed: () {},
                  child: const Center(
                    child: Text(
                      'MARK AS PICKED',
                      style: TextStyle(
                        color: pickerWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,),
                    ),
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
}
