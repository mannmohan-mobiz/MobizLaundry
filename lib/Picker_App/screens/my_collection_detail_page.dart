import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_value.dart';
import '../util/table_row.dart';

class MyCollectionDetailsPage extends StatefulWidget {
  final String? fromDate;
  final String? toDate;
  const MyCollectionDetailsPage({super.key,this.fromDate,this.toDate});

  @override
  State<MyCollectionDetailsPage> createState() => _MyCollectionDetailsPageState();
}

class _MyCollectionDetailsPageState extends State<MyCollectionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    print('###21#${widget.fromDate}');
    print('###21#${widget.toDate}');
    return BlocProvider(
    create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context),)..add(PckCollectionsFetchEvent(
        authData.user_token.toString(),widget.fromDate.toString(),widget.toDate.toString())),
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
        title: const Text('My Collections',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is PckCollectionsFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is PckCollectionsFetchedState) {
      final tData = state.pickerCollectionsList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Text('Showing all your collections', style: TextStyle(
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
            const SizedBox(height: 8,),
            const Text('Your Overall due', style: TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.w300,
                fontSize: 14),),
            const SizedBox(height: 8,),
             Text('AED ${tData?.overallCollectedAmount}', style: const TextStyle(color: pickerBlackColor,
                fontWeight: FontWeight.w400,
                fontSize: 20),),
            const Text('Customer List', style: TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.w300,
                fontSize: 14),),
            const SizedBox(height: 15,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tData?.customerlist.length,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('Assets/Images/profile_icon.png'),
                                  const SizedBox(width: 10,),
                                   Text('${tData?.customerlist[index].customerName}', style: const TextStyle(
                                      color: pickerBlackColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),),
                                ],
                              ),
                               TableWidget(text: 'Amount',
                                  value: 'AED ${tData?.customerlist[index].amount} ',
                                  fontSize: 12,
                                  fontSizeValue: 12,
                                  fontWeight: FontWeight.w300,
                                  fontWeightValue: FontWeight.w300),
                               TableWidget(text: 'Amount collected',
                                  value: 'AED ${tData?.customerlist[index].amountCollected}',
                                  fontSize: 12,
                                  fontSizeValue: 12,
                                  fontWeight: FontWeight.w300,
                                  fontWeightValue: FontWeight.w300),
                               TableWidget(text: 'Balance amount',
                                  value: 'AED ${tData?.customerlist[index].balanceAmount}',
                                  fontSize: 12,
                                  fontSizeValue: 12,
                                  fontWeight: FontWeight.w300,
                                  fontWeightValue: FontWeight.w300),
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
    } else{
      return const Center(child: Text('No Data'));
    }
  },
),
    ),
);
  }
}
