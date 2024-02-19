import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/custom_radio.dart';
import '../util/customer_divider.dart';
import '../util/table_row.dart';

class DeliverToCustomers extends StatefulWidget {
  final String? ordId;
  final String? customerId;
  const DeliverToCustomers({super.key,this.ordId,this.customerId});

  @override
  State<DeliverToCustomers> createState() => _DeliverToCustomersState();
}

class _DeliverToCustomersState extends State<DeliverToCustomers> {
  List<String> paymentName = ['Cash','Wallet'];
  final PickerRepository pickerRepository = PickerRepository();
  TextEditingController amountReceivedController = TextEditingController();
  int selectedIndex = -1;
  String selectedPayment = '';
  String? newWalletBalance;
  num? newPreviousBalance;
  String? newTodayAmount;
  num? newTotalAmount;
  @override
  Widget build(BuildContext context) {
    print('ORDID####${widget.ordId}');
    print('CST####${widget.customerId}');

    return BlocProvider(
    create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context)
    )..add(DeliverToCustomersFetchEvent(
        authData.user_token.toString(),widget.ordId.toString())),
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
          'Deliver to Customer',
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
      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is DeliverToCustomersFetchingState) {
    return const Center(
    child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    }else if (state is DeliverToCustomersFetchedState) {
      final data = state.deliveryToCustomer;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)),
              child:  Column(
                children: [
                  const Text(
                    'Order Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Golden falcon laundry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  const MySeparator(color: pickerDividerColor, height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'INV.No', value: '${data?.invoiceNumber}',),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'INV.Date', value: DateFormat('dd-MM-yyyy').format(DateTime.parse('${data?.invoiceDate}')),),
                  ),
                  const MySeparator(color: pickerDividerColor, height: 2),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Total Amount', value: '${data?.totalAmount} AED',),
                  ),
                  const SizedBox(height: 5,),
                  const MySeparator(color: pickerDividerColor, height: 2),
                  const SizedBox(height: 3,),
                  const Text(
                    'Towards laundry service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pickerBlackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Select Mode of payment',
              style: TextStyle(
                color: pickerBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('Assets/Images/payment_image.png'),
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (itemBuilder, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: Checkbox(
                                        activeColor: pickerGoldColor,
                                        value: selectedIndex == index,
                                        side: const BorderSide(
                                            color: pickerGoldColor),
                                        onChanged: (bool? value) {
                                          if (value != null && value) {
                                            setState(() {
                                              selectedIndex = index;
                                              selectedPayment = paymentName[index];
                                            });
                                          }
                                          Map<String, String> data = {
                                            "order_id": widget.ordId.toString(),
                                            "customer_id": widget.customerId.toString(),
                                            "mode_of_payment": selectedPayment,
                                          };
                                          print('#########${(data)}');
                                          pickerRepository.deliverToCustomerPaymentApi(token: authData.user_token.toString(),body: data).then((value) {
                                            setState(() {
                                              newWalletBalance = value.data.walletBal;
                                              newPreviousBalance = value.data.previousBalance;
                                              newTodayAmount = value.data.todayAmount;
                                              newTotalAmount = value.data.totalAmount;
                                            });

                                            print('#########${(newWalletBalance)}');
                                            print('#########${(newPreviousBalance)}');
                                            print('#########${(newTodayAmount)}');
                                            print('#########${(newTotalAmount)}');

                                          });
                                        }
                                    ),
                                  ),
                                  Text(
                                    paymentName[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: pickerBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(
                      text: 'Wallet Balance', value: 'AED ${newWalletBalance ?? "0"}',),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(
                      text: 'Previous Balance', value: 'AED ${newPreviousBalance ?? "0"}',),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Today Amount', value: 'AED ${newTodayAmount ?? "0"} '),
                  ),
                  const MySeparator(color: pickerDividerColor, height: 2),
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TableWidget(text: 'Total Amount', value: 'AED ${newTotalAmount ?? "0"}',),
                  ),
                  const SizedBox(height: 5,),
                  const MySeparator(color: pickerDividerColor, height: 2),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Amount Received',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: pickerBlackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: TextField(
                            controller: amountReceivedController,
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
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the desired border radius
                  ),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    color: pickerWhiteColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),),
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

