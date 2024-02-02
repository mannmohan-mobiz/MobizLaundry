import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/profile_page.dart';
import 'package:golden_falcon/Picker_App/screens/thankyou_page.dart';
import 'package:golden_falcon/Picker_App/util/customer_divider.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/cart_list_model.dart';
import '../../Models/PickerModel/delivery_address_list.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/container_widget.dart';
import '../util/row_value.dart';

class CartPageScreen extends StatefulWidget {
  final String orderId;
  final String custIdd;
  const CartPageScreen({super.key,required this.orderId,required this.custIdd});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  final PickerRepository pickerRepository = PickerRepository();
  bool isExpanded = false;
  String selectedOption = 'Choose payment method';
  List<int> counterQuantity = [];
  List<String> priceValues = [];
  late CartList? data;
  var newWalletBalance;
  String? wallId;
  TextEditingController collectedAmtController = TextEditingController();




  void decrement(int index) {
    setState(() {
      int currentQuantity = int.parse(data!.cart[index].quantity.toString());
      if ( currentQuantity > 1) {
        currentQuantity--;
        data!.cart[index].quantity = currentQuantity.toString();
      }
    });
  }

  void increment(int index, ) {
    setState(() {
      int currentQuantity = int.parse(data!.cart[index].quantity.toString());
      currentQuantity++;
      data!.cart[index].quantity = currentQuantity.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    print('ORDERID##${widget.orderId}');
    return BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
      ..add(PckCartListFetchEvent(
          authData.user_token.toString(), widget.orderId.toString())),
    child:
         Scaffold(
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
              'Cart',
              style: TextStyle(
                  color: pickerGoldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: BlocBuilder<PickerBloc, PickerState>(
  builder: (context, state) {
    if (state is PckCartListFetchingState) {
      return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is PckCartListFetchedState) {
       data = state.cartList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
             Wrap(
              children: [
                const Text(
                  'Delivery to:',
                  style: TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Text(
                  '${state.deliveryAddress?["name"].toString()}, '
                      '${state.deliveryAddress?["building_name"].toString()}, '
                      '${state.deliveryAddress?["building_no"].toString()}, '
                      '${state.deliveryAddress?["floor_number"].toString()}, '
                      '${state.deliveryAddress?["flat_number"].toString()}, '
                      '${state.deliveryAddress?["mobile"].toString()}',
                  // '${state.cartList?.cart[0].order.customer.name},'
                  //     '${state.cartList?.cart[0].order.customer.flatNumber ?? '--'},'
                  //     '${state.cartList?.cart[0].order.customer.floorNumber ?? '--'},'
                  //     '${state.cartList?.cart[0].order.customer.buildingNo ?? '--'},'
                  //     '${state.cartList?.cart[0].order.customer.mobile}.',
                  style: const TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ],
            ),

       ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // <-- Radius
                ),
                backgroundColor: pickerWhiteColor,
                side: const BorderSide(color: pickerGoldColor, width: 1.0),
              ),
              onPressed: () {
                showChangeAddressDialog(context,state.cartList!);
                },
              child: const Center(
                child: Text(
                  'CHANGE DELIVERY ADDRESS',
                  style: TextStyle(
                    color: pickerBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,),
                ),
              ),
            ),
            ContainerWidgets(title: 'Delivery Time',
              textTime: '${state.cartList?.cart![0].order.deliveryTime}',
              textDate: DateFormat('yyyy-MM-dd').format(DateTime.parse('${state.cartList?.cart![0].order.deliveryDate}')),),
            RowValue(
                label: 'Service Type',
                labelValue: '${state.cartList?.cart![0].order.orderType}'),
            RowValue(
                label: 'Order Type',
                labelValue: '${state.cartList?.cart![0].itemService.category
                    .serviceMaster.categoryName}''/''${state.cartList?.cart![0]
                    .itemService.subCategory.subServiceMaster.subCatName}'),
            const SizedBox(height: 12),
            const Text('Picked items for Jason.', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400,)),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.cartList?.cart.length,
              itemBuilder: (BuildContext context, int index) {
                counterQuantity.add(1);
                priceValues.add(state.cartList!.cart[index].amount);
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
                                    '$baseUrl${state.cartList?.cart[index].itemService
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
                                      '${state.cartList?.cart[index].itemService.item
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
                                                decrement(index);
                                                print('#####$index');
                                                Map<String, String>dataList = {
                                                  "id": authData.user_id.toString(),
                                                  "order_id": widget.orderId,
                                                  "cart_id": '${data?.cart[index].cartId}',
                                                  "price_list_id": '${data?.cart[index].priceList}' ,
                                                  "item_ser_id": '${data?.cart[index].itemService.itemSerId}',
                                                  "quantity": '${data?.cart[index].quantity}',
                                                };
                                                print('#########${(dataList)}');
                                                pickerRepository.getCartQuantityPrice(token: authData.user_token.toString(), body: dataList).then((value) {
                                                  setState(() {
                                                    priceValues[index] = value.data.amount;
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
                                                '${data?.cart[index].quantity}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Image.asset(
                                                'Assets/Images/increment.png',
                                              ),
                                              onTap: (){
                                                 increment(index);
                                                Map<String, String> dataList = {
                                                  "id": authData.user_id.toString(),
                                                  "order_id": widget.orderId,
                                                  "cart_id": '${data?.cart[index].cartId}',
                                                  "price_list_id": '${data?.cart[index].priceList}',
                                                  "item_ser_id": '${data?.cart[index].itemService.itemSerId}',
                                                  "quantity": '${data?.cart[index].quantity}'
                                                };
                                                print('#########${(dataList)}');
                                                pickerRepository.getCartQuantityPrice(token: authData.user_token.toString(), body: dataList).then((value) {
                                                  setState(() {
                                                    priceValues[index] = value.data.amount;
                                                  });
                                                });
                                              },
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
                                          priceValues[index] != null ? 'AED ${priceValues[index]}' :
                                          'AED ${state.cartList?.cart[index].amount}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          pickerRepository.deleteCartData(token: authData.user_token.toString(),
                                              cartId:  '${state.cartList?.cart[index].cartId}').then((value) {

                                            context.read<PickerBloc>().add(PckCartListFetchEvent(
                                                authData.user_token.toString(), widget.orderId.toString()));

                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: pickerGoldColor,
                                          ),
                                          //padding: EdgeInsets.symmetric(horizontal: 84.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(9),
                                          ),
                                        ),
                                        child: const Text(
                                          'REMOVE FROM CART',
                                          style: TextStyle(fontSize: 12.0,
                                              color: pickerBlackColor,
                                              fontWeight: FontWeight
                                                  .w600),
                                        ),
                                      ),
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
            const SizedBox(height: 12),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Apply PromoCode ',
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400,)),
                  TextSpan(
                    text: '(select only one)',
                    style: TextStyle(fontWeight: FontWeight.w600,
                        color: pickerTextColor,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        //  width: double.infinity,
                        decoration: BoxDecoration(
                            color: pickerGoldColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Promo Code',
                                style: TextStyle(fontSize: 13.0,
                                    color: pickerWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '20',
                                style: TextStyle(fontSize: 54.0,
                                    color: pickerWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              MySeparator(
                                  color: pickerWhiteColor, height: 2),
                              SizedBox(height: 2),
                              Text(
                                'Redeem Now',
                                style: TextStyle(fontSize: 13.0,
                                    color: pickerWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                backgroundColor: pickerWhiteColor,
                side: const BorderSide(color: pickerGoldColor, width: 1.0),
              ),
              onPressed: () {},
              child: const Center(
                child: Text(
                  'Apply Coupon',
                  style: TextStyle(
                    color: pickerBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,),
                ),
              ),
            ),
             RowValue(label: 'Net Taxable Value',
                labelValue: 'AED ${state.cartList?.netTaxable}',
                labelValueColor: pickerBlackColor),
             RowValue(label: 'Vat',
                labelValue: 'AED ${state.cartList?.vat}',
                labelValueColor: pickerBlackColor),
            BlocProvider(
            create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
              ..add(PickupPaymentListFetchEvent(
                  authData.user_token.toString())),
              child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      border: Border.all(color: pickerGoldColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedOption,style: const TextStyle(
                            fontSize: 14,color: pickerBlackColor
                        ),),
                        Icon(
                          isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          size: 24,
                          color: pickerGoldColor,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: isExpanded ? 120 : 0,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    border: Border.all(color: pickerGoldColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: BlocBuilder<PickerBloc, PickerState>(
                 builder: (context, state) {
                    if (state is PickupPaymentListFetching) {
                    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
                    } else if (state is PickupPaymentListFetched) {
                   final data = state.paymentList;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) =>
                      ListTile(
                        title:  Text('${data?[index].paymentMethod}',style: const TextStyle(
                          fontSize: 12,color: pickerBlackColor
                        ),),
                        onTap: () {
                          setState(() {
                            selectedOption = '${data?[index].paymentMethod}';
                            isExpanded = false;
                          });
                         if( selectedOption == 'Wallet') {
                           Map<String, String> data = {
                             "id": authData.user_id.toString(),
                             "order_id": widget.orderId,
                             "customer_id":  widget.custIdd,
                           };
                           pickerRepository.getWalletBalanceApi(token: authData.user_token.toString(),body: data).then((value) {
                            setState(() {
                              newWalletBalance = value.walletBalance;
                              wallId = value.walletid;
                            });
                            print('BALANCE###$newWalletBalance');
                            print('ID###$wallId');

                           }
                          );
                         }

                        },
                      ),
                  );
                } else {
                      return const Center(child: Text('No Data'));
                    }
                 }
),
                ),
              ],
            ),
),
            // Row(
            //   children: [
            //     Checkbox(
            //         activeColor: pickerGoldColor,
            //         value: false,
            //         side: const BorderSide(color: pickerGoldColor),
            //         onChanged: (value) {
            //           Map<String, String> data = {
            //             "id": authData.user_id.toString(),
            //             "order_id": widget.orderId,
            //             "customer_id":  widget.custIdd,
            //           };
            //           pickerRepository.getWalletBalanceApi(token: authData.user_token.toString(),body: data).then((value) {
            //             setState(() {
            //               //double.parse((state.cartList?.walletBalance).toString()) = value.walletBalance;
            //             });
            //           }
            //           );
            //         }
            //     ),
            //      const Text(
            //       'Use Wallet Balance ?',
            //       style: TextStyle(
            //         color: pickerBlackColor,
            //         fontSize: 15,
            //         fontWeight: FontWeight.w400,),
            //     ),
            //     const SizedBox(width: 30,),
            //     Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(4),
            //             border: Border.all(color: pickerGoldColor),
            //             color: pickerWhiteColor
            //         ),
            //         child: Padding(
            //           padding:  const EdgeInsets.symmetric(horizontal: 12.0),
            //           child: Text(
            //            'AED ${state.cartList?.walletBalance}'!= null ?  'AED ${state.cartList?.walletBalance}' : newWalletBalance,
            //             textAlign: TextAlign.start,
            //
            //           ),
            //         )
            //     ),
            //   ],
            // ),
            RowValue(label: 'Wallet Balance',
                labelValue: selectedOption == 'Wallet' ? "$newWalletBalance" :
                'AED ${state.cartList?.walletBalance}',
                labelValueColor: pickerBlackColor),
             RowValue(label: 'Total Payable',
                labelValue: 'AED ${state.cartList?.grandTotal}',
                labelValueColor: pickerBlackColor),
            Visibility(
              visible: selectedOption == 'Cash',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
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
                        controller: collectedAmtController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: pickerBlackColor,
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
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  backgroundColor: pickerGoldColor,
                ),
                onPressed: () {
                  if(selectedOption == 'Choose payment method'){
                    snackBar(context, message: 'Please choose Payment type');
                  }else {
                  Map<String, dynamic> data = {
                    "customer_id": widget.custIdd,
                    "order_id": widget.orderId,
                    "discount":  double.parse(state.cartList!.discount).toDouble(),
                    "net_taxable": double.parse(state.cartList!.netTaxable).toDouble(),
                    "vat":  double.parse(state.cartList!.vat).toDouble(),
                    "grant_total": double.parse(state.cartList!.grandTotal).toDouble(),
                    "collect_mode": selectedOption,
                    "payed_amount": selectedOption == 'Cash' ? collectedAmtController.text : 0,
                    //"payed_amount": collectedAmtController.text,
                    "customer_address": "04882634ab7a465fa5fe85f129cb1b5b",
                    "wallet_id": '$wallId'
                  };
                  print('#########${(data)}');
                 pickerRepository.orderConfirmApi(token: authData.user_token.toString(),body: data).then((value) {
                    Navigator.push(context, MaterialPageRoute(
                     builder: (context) =>  ThankYouPageScreen(ordId: widget.orderId,cstId: widget.custIdd )));
                  });
                    }
    },
                child: const Center(
                  child: Text(
                    'Place Order',
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
    }
    else {
      return const Center(child: Text('No Data'));
    }
  },
),
        ),

);
  }
//   showChangeAddressDialog(BuildContext context) {
//     String? selectedValue; // Change the type to String?
//     //int? gValue = -1;
//     return showCustomBottomSheet(
//       context,
//       title: 'Select Delivery Address',
//       BlocProvider(
//     create:  (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
//       ..add(PickupDeliveryAddressFetchEvent(
//           authData.user_token.toString(), widget.custIdd.toString())),
//      child: StatefulBuilder(
//      builder: (BuildContext context, StateSetter setState) {
//        return Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            BlocBuilder<PickerBloc, PickerState>(
//                builder: (context, state) {
//                  if (state is PickupDeliveryAddressFetching) {
//                    return const Center(child: CircularProgressIndicator(
//                      color: pickerGoldColor,));
//                  } else if (state is PickupDeliveryAddressFetched) {
//                    final dataValue = state.deliveryAddress;
//                    return ListView.separated(
//                      shrinkWrap: true,
//                      physics: const BouncingScrollPhysics(),
//                      padding: EdgeInsets.zero,
//                      separatorBuilder: (context, index) =>
//                      const Divider(color: Colors.transparent),
//                      itemCount: dataValue!.length,
//                      itemBuilder: (context, index) {
//                        //final address = snapshot.data!.data![index];
//                        print('addd ${dataValue[index].name}');
//                        return Row(
//                          children: [
//                            Radio(
//                              onChanged: (int? value) {
//                                debugPrint('### value --- $value');
//                                setState(() {
//                                  gValue = value;
//                                });
//                              },
//                              value: index,
//                              visualDensity: const VisualDensity(
//                                  horizontal: -4, vertical: 0),
//                              activeColor: pickerGoldColor,
//                              groupValue: gValue,
//                            ),
//                            Text('${dataValue[index].name} ${dataValue[index]
//                                .buildingNameNo} ${dataValue[index]
//                                .floorNo} ${dataValue[index]
//                                .flatNoHouseNo} ${dataValue[index]
//                                .personInchargeMob}',
//                                style: const TextStyle(
//                                    fontSize: 13, color: pickerBlackColor)),
//                          ],
//                        );
//                      },
//                    );
//                  } else {
//                    return const Center(child: Text('No Data'));
//                  }
//                }
//            ),
//          ],
//        );
//      }
//      ),
// ),
//     );
//   }
  //
  showChangeAddressDialog(BuildContext context,CartList listData) {
    String? selectedValueData;
    BuildContext mainContext = context;
    return showCustomBottomSheet(
      context,
      title: 'Select Delivery Address',
      FutureBuilder<DeliveryAddressList>(
        future: pickerRepository.getDeliveryAddressListData(
            token: authData.user_token!, customerId: widget.custIdd),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: pickerGoldColor);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.data == null ||
              snapshot.data!.data!.isEmpty) {
            return const Text('No delivery address available');
          } else {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        final address = snapshot.data!.data![index];
                        print('addd ${address}');
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedValueData = address["pickup_address_id"].toString();
                            });
                          },
                          child: RadioListTile(
                            activeColor: pickerGoldColor,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                                '${address["name"]} ${address["building_name_no"]} ${address["floor_no"]} ${address["flat_no_house_no"]} ${address["person_incharge_mob"]}',
                                style: const TextStyle(fontSize: 13, color: pickerBlackColor)),
                            value: address["pickup_address_id"].toString(),
                            groupValue: selectedValueData,
                            onChanged: (value) {
                              print('444');
                              mainContext.read<PickerBloc>().add(PickupDeliveryAddressFetchEvent(listData, address));
                              setState(() {
                                selectedValueData = value.toString();
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            );
          }
        },
      ),
    );
  }
}







