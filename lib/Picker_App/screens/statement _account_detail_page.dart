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
import '../util/row_value.dart';
import '../util/table_row.dart';

class StatementOfAccountDetailPage extends StatefulWidget {
  final String? customerId;
  final String? fromDate;
  final String? toDate;
  const StatementOfAccountDetailPage({super.key,this.customerId,this.fromDate,this.toDate});

  @override
  State<StatementOfAccountDetailPage> createState() => _StatementOfAccountDetailPageState();
}

class _StatementOfAccountDetailPageState extends State<StatementOfAccountDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.customerId);
    print(widget.fromDate);
    print(widget.toDate);
    return  BlocProvider(
    create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context),)..add(StatementAccountFetchEvent(
        authData.user_token.toString(), widget.customerId.toString(),widget.fromDate.toString(),widget.toDate.toString())),
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
        title: const Text('Statement of account',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is StatementAccountFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is StatementAccountFetchedState) {
      final tData = state.statementAccountList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Text('Showing details', style: TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.w400,
                fontSize: 15),),
            const SizedBox(height: 8,),
             Row(
              children: [
                Row(
                  children: [
                    const Text(
                      'From', style: TextStyle(color: pickerBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    ),
                    const SizedBox(width: 15,),
                    Text(
                      '${widget.fromDate}', style: const TextStyle(color: pickerGoldColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(width: 15,),
                Row(
                  children: [
                    const Text(
                      'To', style: TextStyle(color: pickerBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    ),
                    const SizedBox(width: 15,),
                    Text(
                      '${widget.toDate}', style: const TextStyle(color: pickerGoldColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tData.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          color: pickerWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              RowValue(label: 'Invoice Number',
                                labelValue: '${tData[index].invoiceNumber}',
                                labelValueColor: pickerBlackColor,),
                              RowValue(label: 'Invoice date',
                                labelValue: DateFormat('yyyy-MM-dd').format(tData[index].invoiceDate),
                                labelValueColor: pickerBlackColor,),
                              RowValue(label: 'Order Number',
                                labelValue: tData[index].orderNumber,
                                labelValueColor: pickerBlackColor,),
                              RowValue(label: 'Status',
                                labelValue: tData[index].status,
                                labelValueColor: pickerBlackColor,),
                              const Divider(color: pickerBlackColor,),
                              RowValue(label: 'Amount',
                                labelValue: 'AED ${tData[index].amountPaid}',
                                labelValueColor: pickerBlackColor,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
