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
  String selectedMode = '';
  final PickerRepository pickerRepository = PickerRepository();
  final String mode = '';

  @override
  Widget build(BuildContext context) {
    print('#######111##${widget.customerID}');

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
                  //selectedMode = data[0].mode;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        print('#######1111#$mode');
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                selectedMode = data[index].mode;

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
                      if(selectedMode.isEmpty) {
                        snackBar(
                            context, message: 'Please choose delivery mode');
                      } else {
                        pickerRepository.getDeliveryDateList(token: authData
                            .user_token.toString(), mode: selectedMode);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            SelectDeliveryTimePage(mode: selectedMode,custID: widget.customerID
                            )));
                      }

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
