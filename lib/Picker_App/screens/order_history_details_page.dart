import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Models/PickerModel/order_report_model.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';
import 'order_details_page.dart';

class OrderHistoryDetailsPage extends StatefulWidget {
 final String? fromDate;
 final String? toDate;
 const OrderHistoryDetailsPage({super.key,this.fromDate,this.toDate});

  @override
  State<OrderHistoryDetailsPage> createState() => _OrderHistoryDetailsPageState();
}

class _OrderHistoryDetailsPageState extends State<OrderHistoryDetailsPage> {
  TextEditingController searchController = TextEditingController();

  List<Customerdatum> customerData = [];
  final PickerRepository pickerRepository = PickerRepository();

  @override
  Widget build(BuildContext context) {
    print('###21#${widget.fromDate}');
    print('###21#${widget.toDate}');
    print('###21#${authData.user_id.toString()}');


    return BlocProvider(
    create: (context) => PickerBloc(
      RepositoryProvider.of<PickerRepository>(context),)..add(PckOrderReportFetchEvent(
        authData.user_token.toString(), authData.user_id.toString(),widget.fromDate.toString(),widget.toDate.toString())),
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
        title: const Text('Order History',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
          print(state);
    if (state is PckOrderReportFetchingState) {
    return const Center(child: CircularProgressIndicator(color: pickerGoldColor,));
    } else if (state is PckOrderReportFetchedState) {
      final tData = state.reportValues;
      customerData = (tData?.customerdata) ?? [];
      print('###$state');
      return ListView(
        shrinkWrap: true,
        children: [
          const Text('Showing all orders', style: TextStyle(
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
          Row(
            children: [
              const Text(
                'Total Orders', style: TextStyle(color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              ),
              const SizedBox(width: 15,),
              Container(
                width: 110,
                height: 38,
                decoration: BoxDecoration(
                  color: pickerWhiteColor,
                  border: Border.all(color: pickerGoldColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${tData?.totalOrders}', style: const TextStyle(color: pickerBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerGoldColor)),
                child:  Column(
                  children: [
                    Text(
                      '${tData?.orderViaApp}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: pickerGoldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: pickerGoldColor,
                    ),
                    const Flexible(
                      child: Text(
                        'Via App',
                        style: TextStyle(
                          fontSize: 9,
                          color: pickerBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerGoldColor)),
                child:  Column(
                  children: [
                    Text(
                      '${tData?.orderViaCall}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: pickerGoldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: pickerGoldColor,
                    ),
                    const Flexible(
                      child: Text(
                        'Via Call',
                        style: TextStyle(
                          fontSize: 9,
                          color: pickerBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerGoldColor)),
                child:  Column(
                  children: [
                    Text(
                      '${tData?.orderViaStaff}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: pickerGoldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: pickerGoldColor,
                    ),
                    const Flexible(
                      child: Text(
                        'Via Staff',
                        style: TextStyle(
                          fontSize: 9,
                          color: pickerBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerGoldColor)),
                child:  Column(
                  children: [
                    Text(
                      '${tData?.newclients}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: pickerGoldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: pickerGoldColor,
                    ),
                    const Flexible(
                      child: Text(
                        'New Clients',
                        style: TextStyle(
                          fontSize: 9,
                          color: pickerBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18,),
          SearchWidget(
            hintText: 'Order Id/phone',
            searchCtrl: searchController,

            onTap: (){
              debugPrint(searchController.text);
              pickerRepository.getSearchOrder(token: authData.user_token.toString(), searchKey: searchController.text).then((value) {
                setState(() {
                  customerData = [];
                });
                if (value.status == true) {
                  setState(() {
                    customerData = value.data?.customerdata ?? [];
                  });
                  print('#######ssss${value.data?.customerdata?[0].deliveryDate}');
                }
                else {
                  value.status == false;
                  snackBar(context, message: value.message.toString());
                }
              });


            },
          ),
          const SizedBox(height: 18,),
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
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  OrderDetailsPage(orderId: customerData[index].orderId)));
                        },
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset('Assets/Images/front_arrow.png')
                        ),
                      ),
                       RowItem(
                        label: 'Customer name:', value: '${customerData[index].customer?.name}',),
                       RowItem(label: 'Customer type:', value: '${customerData[index].customer?.customerType}',),
                       RowItem(label: 'Mode of Delivery:',
                          value: '${customerData[index].orderType}',
                          color: MaterialStateColor.resolveWith((states) {
                            if (customerData[index].orderType == 'Urgent') {
                              print(5555);
                              return pickerOrangeTypeColor;
                            } else
                            if (customerData[index].orderType == 'Express') {
                              print(6666);
                              return pickerYellowTypeColor;
                            } else
                            if (customerData[index].orderType == 'Normal') {
                              print(7777);
                              return pickerGreyTypeColor;
                            } else {
                              print(8888);
                              return Colors.transparent;
                            }
                          }),
                          isShowButton: true),
                       RowItem(label: 'Order No:', value: '${customerData[index].orderNumber}',),
                       RowItem(label: 'Building Name/No:', value: '${customerData[index].customerAddress!["building_name_no"]}',),
                       RowItem(label: 'Floor No:', value: '${customerData[index].customerAddress!["floor_no"]}',),
                       RowItem(label: 'House No:', value: '${customerData[index].customerAddress!["flat_no_house_no"]}',),
                       RowItem(label: 'Mobile No:', value: '${customerData[index].customerAddress!["person_incharge_mob"]}',),
                      const RowItem(label: 'Delivery Status:', value: '',),
                       RowItem(label: 'Pickup date/time:',
                          value:  customerData[index].pickupDate != null ? '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${customerData[index].pickupDate ?? ''}'))} / ${customerData[index].pickupTime ?? ''}' : ''),
                       RowItem(label: 'Delivery date/time:',
                           value:  customerData[index].deliveryDate  != null ? '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${customerData[index].deliveryDate ?? ''}'))} / ${customerData[index].deliveryTime ?? ''}' : ''),
                    ],
                  ),
                ),
          ),
        ],
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if(state is PckOrderReportErrorState) {
          snackBar(context, message: state.message);
        }
      });
      return const Center(child: Text('No Data'));
    }
  },
),
      ),
    ),
);
  }
}
