import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Customers/Customer_Home.dart';
import '../../Models/PickerModel/customer_list_model.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';
import 'customer_home_page.dart';

class MyClientsPage extends StatefulWidget {
  const MyClientsPage({super.key});

  @override
  State<MyClientsPage> createState() => _MyClientsPageState();
}

class _MyClientsPageState extends State<MyClientsPage> {


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context),
    )..add(ListAllClientsEvent(
        authData.user_id.toString(), authData.user_token.toString())),
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
          'My Clients',
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
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children:  [
            const Text('Search Clients',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),),
            const SizedBox(height: 2,),
            SearchWidget(
              searchCtrl: TextEditingController(),
                onChanged: (String myString){},
            ),
            BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
          if (state is FetchingClientList) {
            print(state.toString());
            return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
          } else if (state is FetchedClientList) {
            return state.customerList.isEmpty == true ? const Center(
                child: Text("No Data")) : ListView.builder(
              shrinkWrap: true,
              itemCount: state.customerList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
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
                            label: 'Customer name:',
                            value: state.customerList[index].name,
                            isShowButton: true,
                            borderColor: pickerGoldColor,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerHomePageScreen()));
                            }

                        ),
                         RowItem(label: 'Customer type:', value: state.customerList[index].customerType,),
                        const RowItem(label: 'Mode of Delivery:',
                            value: 'Urgent',
                            color: pickerOrangeTypeColor,
                            isShowButton: true),
                        const RowItem(label: 'Order ID:', value: '',),
                         RowItem(label: 'Building Name/No:', value: state.customerList[index].buildingNo,),
                         RowItem(label: 'Floor No:', value: state.customerList[index].flatNumber ?? '',),
                         RowItem(label: 'House No:', value: state.customerList[index].floorNumber ?? '',),
                         RowItem(label: 'Mobile No:', value: state.customerList[index].mobile,),
                        const RowItem(
                            label: 'Delivery time:', value: '7am to 9am'),
                        const Divider(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColumItem(image: 'Assets/Images/view_icon.png',
                                label: 'View',onTap: (){}),
                            ColumItem(image: 'Assets/Images/edit_icon.png',
                                label: 'Edit',onTap: (){}),
                            ColumItem(image: 'Assets/Images/nav_icon.png',
                                label: 'Navigate',onTap: (){}),
                            ColumItem(image: 'Assets/Images/call_icon.png',
                                label: 'Call',onTap: (){
                                  openDialer(state.customerList[index].mobile);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
            );
          } else{
            return const Center(child: Text('No Data'));
          }
  },
)
          ],
        ),
      ),

    ),
);
  }
}
