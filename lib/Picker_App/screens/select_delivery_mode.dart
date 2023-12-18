import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/select_delivery_time_page.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../util/common_methods.dart';

class SelectDeliveryMode extends StatefulWidget {

  final String customerID;
  const SelectDeliveryMode({super.key, this.customerID = ''});

  @override

  State<SelectDeliveryMode> createState() => _SelectDeliveryModeState();

}

class _SelectDeliveryModeState extends State<SelectDeliveryMode> {
  int selectedIndex = -1;
  final PickerRepository pickerRepository = PickerRepository();
  final String mode = '';
  List<DateTime> dateTime = [];

  List<String> selectModeList = ['Normal (Delivery with in 42 hrs)',
    'Express(Delivery with in 24 hrs)',
    'Urgent(Delivery within 8hrs)'];

  List<String> modeSurchargeData = ['',
  '50% surcharge will apply',
    '100% surcharge will apply'];



  @override
  Widget build(BuildContext context) {
    print('#######${widget.customerID}');

    return  BlocProvider(
  create: (context) => PickerBloc(
    RepositoryProvider.of<PickerRepository>(context)
  )..add(PickupDeliveryModeFetchEvent(
      authData.user_token.toString())),
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
        title:  const Text(
           // widget.customerID,
          'Delivery Modes',
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
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose Mode of Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                const SizedBox(height: 12),
                BlocBuilder<PickerBloc, PickerState>(
              builder: (context, state) {
                print('res${state}');
                if (state is PickupDeliveryModeFetching) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: pickerGoldColor,
                      ));
                }else if (state is PickupDeliveryModeFetched) {
                  final data = state.deliveryModes;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        print('#######1111#${selectedIndex == index}');
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              //height: 59,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(34),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              data[index].name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: pickerTextColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            data[index].extraValue == ''
                                                ? const SizedBox()
                                                : Text(
                                              data[index].extraValue,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: pickerGoldColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      selectedIndex == index
                                          ? const CircleAvatar(
                                        backgroundColor: pickerGoldColor,
                                        child: Icon(Icons.check_rounded,
                                            color: Colors.white),
                                      )
                                          :
                                      const CircleAvatar(
                                        backgroundColor: pickerGoldColor,
                                        child: SizedBox(),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  );
                } else {
                  return const Center(child: Text('No Data'));
                }
  },
),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      //BlocProvider.of<PickerBloc>(context).add(PickupDeliveryDateListFetchEvent(authData.user_token.toString(),selectedIndex.mode));
                      print('#######MODE#$mode');
                      pickerRepository.getDeliveryDateList(token: authData.user_token.toString(), mode: 'Normal' );

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectDeliveryTimePage(
                      )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerGoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(fontSize: 16.0, color:pickerWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    ),
);
  }
}