import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'cart_page_new.dart';


class ItemsListPage extends StatefulWidget {
  final String ordIdd;
  final String catId;
  final String subCatId;
  final String customId;
  const ItemsListPage({Key? key,required this.ordIdd,required this.catId,required this.subCatId,required this.customId}) : super(key: key);

  @override
  State<ItemsListPage> createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {
  @override
  Widget build(BuildContext context) {
    print('##CATEGORYID##${widget.catId}');
    print('##SUBCATEGORYID##${widget.subCatId}');
    print('##ORDERID##${widget.ordIdd}');
    print('##CUSTOMID##${widget.customId}');
    return BlocProvider(
   create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context),)
        ..add(PckItemFetchEvent(authData.user_token.toString(), widget.catId, widget.subCatId,widget.customId, widget.ordIdd,)),
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
          title: const Text(
            'New Order',
            style: TextStyle(
                color: pickerGoldColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CartPageScreen())),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset('Assets/Images/cart_icon.png'),
              ),
            )
          ],
        ),

      body: BlocBuilder<PickerBloc, PickerState>(
      builder: (context, state) {
        if (state is PckItemFetchingState) {
          print(state.toString());
          return const Center(child: CircularProgressIndicator(
            color: pickerGoldColor,
          ));
        } else if (state is PckItemFetchedState) {
          return state.pckItemList.isEmpty == true ? const Center(
              child: Text("No Data")) :SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(state.pckItemList[0].itemServices.category.serviceMaster.categoryName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight
                            .w500)),
                    const SizedBox(height: 12),
                    const Text('Pick the Items',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight
                            .w400,)),
                    const SizedBox(height: 28),
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:state.pckItemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Card(
                              elevation: 10,
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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

                                                baseUrl+state.pckItemList[index].itemServices.item.itemImage,
                                                // baseUrl+lstData.itemServices.item.itemImage,
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
                                                        fontWeight: FontWeight
                                                            .w600,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'Assets/Images/decrement.png',
                                                        ),
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 4.0),
                                                          child: Text(
                                                            '1',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight
                                                                  .w600,
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
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .end,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Rate',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'AED ${state.pckItemList[index].amount}',
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 32,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: Colors
                                                          .white,
                                                      surfaceTintColor: Colors
                                                          .white,
                                                      side: const BorderSide(
                                                        width: 1.0,
                                                        color: pickerGoldColor,
                                                      ),
                                                      //padding: EdgeInsets.symmetric(horizontal: 84.0),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(2),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'ADD TO CART',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: pickerGoldColor,
                                                          fontWeight: FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                ),
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
                          );
                        }
                    ),
                  ],
                ),
              )
          );
        } else {
          return const Center(child: Text("No List Data"));
        }
  },
),
    ),
);
  }
}