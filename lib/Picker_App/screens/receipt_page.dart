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

class ReceiptRechargePage extends StatefulWidget {
  final String? transId;
  const ReceiptRechargePage({super.key,this.transId});

  @override
  State<ReceiptRechargePage> createState() => _ReceiptRechargePageState();
}

class _ReceiptRechargePageState extends State<ReceiptRechargePage> {
  @override
  Widget build(BuildContext context) {
    print('222###${widget.transId}');
    return  BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context)
    )..add(WalletRechargeReceiptFetchEvent(
      authData.user_token.toString(),widget.transId.toString(),)),
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
          'Receipt for wallet recharge',
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
    if (state is WalletRechargeReceiptFetchingState) {
    return const Center(
    child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    } else if(state is WalletRechargeReceiptFetchedState) {
      final data = state.walletRechargeReceiptData;
      return Padding(
        padding: const EdgeInsets.only(
            left: 24, right: 20, bottom: 20, top: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: pickerWhiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('Assets/Images/success.png'),
                      const Text(
                        'Recharged successfully',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                       Text(
                        'AED ${data?.amount}',
                        style: const TextStyle(
                            color: pickerBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                      const Divider(color: pickerGoldColor,),
                       Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12),
                        child: Column(
                          children: [
                            RowItem(label: 'Reference Number ',
                              value: '${data?.referenceNumber}',),
                            RowItem(label: 'Payment date',
                              value: DateFormat('dd-MM-yyyy').format(DateTime.parse('${data?.paymentDate}')),),
                            RowItem(label: 'Payment method ', value: '${data?.modeOfPayment}',),
                            RowItem(
                              label: 'Recharged for ', value: '${data?.rechargedFor}',),
                            RowItem(label: 'Recharge by ', value: '${data?.rechargedBy}',),

                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    side: const BorderSide(
                      width: 1.6,
                      color: pickerGoldColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('Assets/Images/pdf_img.png'),
                      const Text(
                        'Download PDF',
                        style: TextStyle(
                            fontSize: 12.0, color: pickerBlackColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    side: const BorderSide(
                      width: 1.6,
                      color: pickerGoldColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('Assets/Images/share.png'),
                      const Text(
                        'Share receipt',
                        style: TextStyle(
                            fontSize: 12.0, color: pickerBlackColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
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
