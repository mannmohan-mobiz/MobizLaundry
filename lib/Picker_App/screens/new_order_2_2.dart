import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/add_to_cart.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';

import '../../Utils/common.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/common_methods.dart';
import '../util/drawer.dart';

class NewOrderScreen_2_2 extends StatefulWidget {
  const NewOrderScreen_2_2({super.key});

  @override
  State<NewOrderScreen_2_2> createState() => _NewOrderScreen_2_2State();
}

class _NewOrderScreen_2_2State extends State<NewOrderScreen_2_2> {
  TextEditingController qtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pickerPrimaryColor,
        leading: BackButton(color: Colors.white, onPressed: () => Navigator.pop(context),),
        title: const Text("Choose Items", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      drawer: const MenuDrawer(),

      body: BlocProvider(
        create: (context) => PickerBloc(
          RepositoryProvider.of<PickerRepository>(context),
        )..add(PckItemFetchEvent(authData.user_token.toString(), authData.pck_cat_id, authData.pck_sub_cat_id, authData.pck_ord_cstmr_id)),
        child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
            if (state is PckItemFetchingState) {
              print(state.toString());
              return const Center(child: Text("Loading..."),);
            } else if (state is PckItemFetchedState) {
              print(state.toString());
              print('##### LENGTH${state.pckItemList.length}');
              if (state.pckItemList.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 30),
                  child: Stack(
                    // physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    children: [
                      const Text(
                        'Mode of Delivery',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: pickerPrimaryColor)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                            child: Text(
                                'Normal/Express/Urgent'
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: ListView.builder(
                        itemCount: state.pckItemList.length,
                        itemBuilder: (context, index) {
                          final lstData = state.pckItemList[index];
                          return InkWell(
                            onTap: () {
                              // authData.setSubCatId(state.pckItemList[index][index].priceListId);
                              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NewOrderScreen_2_2(),), (route) => false);
                            //   {
                            //     "price_list_id": "dccee787-9c9a-4630-b90f-b0b8bd8374b6",
                            //   "item_ser_id": "636914fb-e8c7-4d09-98b9-bfb3155d9967",
                            //   "quantity":4,
                            //   "amount":40,
                            //   "order_id":"d1108501-7906-4702-8d72-e068b7677be3"
                            //
                            // }
                              print(authData.pck_ord_id);
                              print(state.pckItemList[index].amount);
                              print(state.pckItemList[index].itemServices.itemSerId);
                              print(state.pckItemList[index].priceListId);

                              showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  title: new Text('Enter Item quantity'),
                                  content: Container(
                                    height:100,
                                    width:200,
                                    child:Padding(
                                      padding: const EdgeInsets.only(top:9.0),
                                      child: TextField(
                                          textCapitalization: TextCapitalization.sentences,
                                          controller: qtyController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8),),
                                            ),
                                            labelText: "Item Quantity",
                                          )),
                                    )),
                                  actions: <Widget>[
                                    new ElevatedButton(
                                      onPressed: () {
                                        int itm_prc = int.parse(state.pckItemList[index].amount);
                                        int itm_qty = int.parse(qtyController.text);
                                        int total_prc = itm_qty * itm_prc;
                                        List data = [
                                          {
                                            "price_list_id": state
                                                .pckItemList[index].priceListId,
                                            "item_ser_id": state
                                                .pckItemList[index]
                                                .itemServices
                                                .itemSerId,
                                            "quantity": qtyController.text.trim(),
                                            "amount": total_prc.toString(),
                                            "order_id": authData.pck_ord_id
                                          }
                                        ];
                                        qtyController.clear();
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AddToCartScreen(data: data),), (route) => false); // dismisses only the dialog and returns nothing
                                      },
                                      child: new Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[100],
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                ),
                                                child: Image.network(
                                                  // baseUrl+state.pckItemList[index][index].itemServices.item.itemImage,
                                                  // baseUrl+lstData[index].itemServices.item.itemImage,
                                                  baseUrl+lstData.itemServices.item.itemImage,
                                                  fit: BoxFit.fill,
                                                )),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.pckItemList[index].itemServices.item.itemName,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'No of items',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            'Assets/Images/decrement.png',
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 4.0),
                                                            child: Text(
                                                              '1',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ),
                                                          Image.asset(
                                                            'Assets/Images/increment.png',
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Rate',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'AED ${state.pckItemList[index].amount}',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: pickerButtonColor,
                                                          ),
                                                          onPressed: () =>
                                                           showSDeliveryTimeSheet(context),

                                                          child: const Text('Edit')),
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: pickerButtonColor,
                                                          ),
                                                          onPressed: () {},
                                                          child: const Text('Delete')),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
              ),
                      ),
                     // Align(alignment: Alignment.center,child: Container(height: 30,width: 40,color: Colors.red,)),
                     /* Positioned(
                        bottom: 150,
                          child:
                          Column(
                            // shrinkWrap: true,
                            // physics: BouncingScrollPhysics(),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text("No List Data"),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(0.2),
                                    hintText: 'Today/Tomorrow/Day after tomorrow',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const Text("Time"),
                              // GridView.builder(
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   shrinkWrap: true,
                              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              //       crossAxisCount: 2),
                              //   itemCount: 1,
                              //   itemBuilder: (context, index) =>
                             Container(
                                  width: 150,
                                  height: 30,
                                  decoration: BoxDecoration(
                                  color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(child: Text("6:00 AM-8.00AM")),
                                ),
                              //)

                            ],
                          ),
                          // Container(
                          //   height: 30,width: 40,color: Colors.red,
                          // )
                      )*/
                    ],
                  ),
                );
              } else
                return Center(child: Text("No List Data"));
            } else {
              print(state.toString());
              return const Center(child: Text("No Data"));
            }
          },
        ),
      ),
    );
  }
}


showSDeliveryTimeSheet(BuildContext context) {
  return showCustomBottomSheet(
      context,
      bgColor: Colors.transparent,
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 32),
              height: MediaQuery.of(context).size.width * 0.99,
              child:  ListView(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("To be delivered on"),
                    TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        hintText: 'Today/Tomorrow/Day after tomorrow',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Text("Time"),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 30
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) =>
                  Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: pickerPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Text("6:00 AM-8.00AM")),
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pickerPrimaryColor,
                        ),
                        onPressed: () {},
                        child: const Text('Save', style: TextStyle(
                         color: Colors.white
                        ),)),

                  ]),
            ),
          ],
        ),
      ));
}


