import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/table_row.dart';
import 'home_page_new.dart';

class ComplaintDetailsPage extends StatefulWidget {
  final String? complaintId;
  const ComplaintDetailsPage({super.key,this.complaintId});

  @override
  State<ComplaintDetailsPage> createState() => _ComplaintDetailsPageState();
}

class _ComplaintDetailsPageState extends State<ComplaintDetailsPage> {
  final PickerRepository pickerRepository = PickerRepository();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('CmpTID##${widget.complaintId}');
    return  BlocProvider(
    create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context),)..add(ComplaintDetailPckFetchEvent(
        authData.user_token.toString(), widget.complaintId.toString())),
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
        title: const Text('Complaints Details',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
    if (state is ComplaintOrderDetailPckFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is ComplaintOrderDetailPckFetchedState) {
      final tData = state.complaintDetails;
      commentController.text = tData.pickerStatus ? tData.remarkFromPicker : '';
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Complaint heading', style: TextStyle(
                        color: pickerBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),),
                    const SizedBox(height: 5,),
                    TableWidget(text: 'Complaint No',
                        value: tData.complaintNumber,
                        colorValue: pickerGoldColor),
                    TableWidget(text: 'Status',
                        value: tData.status,
                        colorValue: pickerGoldColor),
                    TableWidget(text: 'Date',
                        value: DateFormat('yyyy-MM-dd').format(DateTime.parse('${tData?.createdDate}')),
                        colorValue: pickerGoldColor),
                    TableWidget(text: 'Order Number',
                        value: tData.order,
                        colorValue: pickerGoldColor),
                    TableWidget(text: 'Type',
                        value: tData.complaintType,
                        colorValue: pickerGoldColor),
                    TableWidget(text: 'Remark',
                        value: tData.remarks,
                        colorValue: pickerGoldColor),
                    const Divider(color: pickerDivColor,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Reply from company', style: TextStyle(
                          color: pickerBlackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'We apologize for the delay in your laundry supply. Unforeseen circumstances occurred. Rest assured, we\'re working diligently to resolve this promptly.',
                      style: TextStyle(color: pickerBlackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Center(child: Text('My Remark',
              style: TextStyle(color: pickerBlackColor, fontWeight: FontWeight
                  .w400, fontSize: 15),)),
            const SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      close(context);
                    },
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
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                    ),

                  ),
                ),
                const SizedBox(width: 10),
                Visibility(
                  visible: tData.pickerStatus == false,
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Map<String, String> data = {
                          "complaint_id": tData.complaintId,
                          "remark_from_picker": commentController.text,
                        };
                        print('#########${(data)}');
                        pickerRepository.complaintDetailSaveApi(token: authData.user_token.toString(),body: data).then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>  const HomePageNew(),
                              ));
                        });
                      },
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
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                      ),

                    ),
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
