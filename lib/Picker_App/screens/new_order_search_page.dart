import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/search_deligate.dart';
import 'package:golden_falcon/Picker_App/screens/select_delivery_mode.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/search.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';

class NewOrderSearchPage extends StatefulWidget {
  const NewOrderSearchPage({super.key});

  @override
  State<NewOrderSearchPage> createState() => _NewOrderSearchPageState();
}

class _NewOrderSearchPageState extends State<NewOrderSearchPage> {
  TextEditingController searchController = TextEditingController();
  List<CustomerData> customerData = [];
  final PickerRepository pickerRepository = PickerRepository();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context),
      )..add(PickupSearchCustomerListFetchEvent(
          authData.user_token.toString(), authData.user_id.toString())),
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
          'Confirmed Orders',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          children: [
            SearchWidget(
              onTap: (){
                pickerRepository.getSearchResults(token: authData.user_token.toString(), searchKey: searchController.text).then((value) {
                  setState(() {
                    customerData = [];
                  });
                  if (value.status == true) {
                    setState(() {
                      customerData = value.data;
                    });
                    print('#######ssss${value.data[0].name}');
                  }
                });
              },
              hintText: 'Customer Id/phone',
              searchCtrl: searchController
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: customerData.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: pickerWhiteColor),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(0, 4))
                        ]
                    ),
                    child: Column(
                      children: [
                        RowItem(
                          label: 'Customer name:', value: customerData[index].name),
                        RowItem(label: 'Customer type:', value: customerData[index].customerType),
                        RowItem(label: 'Building Name/No:', value: customerData[index].buildingNo),
                        RowItem(label: 'Floor No:', value: customerData[index].roomNo ?? ''),
                        RowItem(label: 'House No:', value: customerData[index].roomNo ?? ''),
                        RowItem(label: 'Mobile No:', value: customerData[index].mobile),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            side: const BorderSide(
                                color: pickerGoldColor, width: 2.0),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectDeliveryMode()));
                          },
                          child: const Text('CREATE NEW ORDER',
                            style: TextStyle(color: pickerBlackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),),),


                      ],
                    ),
                  ),
            ),


          ],
        ),
      )
    // } else {
    //   return const Center(child: Text('No Data'));
    // }

),

);
  }
}
