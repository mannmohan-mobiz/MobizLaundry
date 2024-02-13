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

class AddComplaintDetailPage extends StatefulWidget {
  final String? customerId;
  const AddComplaintDetailPage({super.key,this.customerId});

  @override
  State<AddComplaintDetailPage> createState() => _AddComplaintDetailPageState();
}

class _AddComplaintDetailPageState extends State<AddComplaintDetailPage> {
  String? selectedValue = 'Select the type of complaint';
  String? selectedValueId = '';
  @override
  Widget build(BuildContext context) {
    print('CSTID##${widget.customerId}');
    return  BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),)..add(AddNewComplaintFetchEvent(
          authData.user_token.toString(), widget.customerId.toString())),
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
        title: const Text('Add new Complaint',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is AddNewComplaintFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is AddNewComplaintFetchedState) {
      final tData = state.addNewComplaintList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: tData?.deliverdOrders.length,
                physics: const BouncingScrollPhysics(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      'Assets/Images/delivered.png'),
                                  title:  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      Text('${tData?.deliverdOrders[index].status}', style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),),
                                      Text('On ${DateFormat('yyyy-MM-dd').format(DateTime.parse('${tData?.deliverdOrders[index].deliveryDate}'))}', style: const TextStyle(
                                          color: pickerBlackColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13),),
                                    ],
                                  ),
                                  trailing: InkWell(
                                      onTap: () {

                                      },
                                      child: Image.asset(
                                          'Assets/Images/rounded.png')),
                                ),
                                 RowItem(label: 'Order Number:',
                                  value: '${tData?.deliverdOrders[index].orderNumber}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                 RowItem(label: 'Number of items:',
                                  value: '${tData?.deliverdOrders[index].quantity}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                                 RowItem(label: 'Amount paid:',
                                  value: 'AED ${tData?.deliverdOrders[index].totalAmount}',
                                  fontSize: 13,
                                  fontSizeValue: 13,
                                  fontWeightValue: FontWeight.w300,
                                  fontWeight: FontWeight.w300,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
            ),
            const SizedBox(height: 15,),
            InkWell(
              onTap: (){
                showCustomBottomSheet(
                    context,
                    title: 'Select the type of complaint',
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                        itemCount: (tData?.typesOfCpmpliance.length)!,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedValue = tData?.typesOfCpmpliance[index].complaintType;
                      selectedValueId = tData?.typesOfCpmpliance[index].complaintId;
                      Navigator.pop(context, selectedValue);
                    });
                  } ,
                  child: Text(
                      tData?.typesOfCpmpliance[index].complaintType ?? '--',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14.0, color: pickerBlackColor,
                          fontWeight: FontWeight.w600)),
                )
                    )
                );
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
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedValue ?? 'Select the type of complaint', style: const TextStyle(
                        fontSize: 14, color: pickerBlackColor
                    ),),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: pickerGoldColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      hintText: 'Note customer complaint here...',
                      border: InputBorder.none,
                    ),
                  )
              ),
            ),
            const SizedBox(height: 20,),
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
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'REGISTER NOW!',
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
