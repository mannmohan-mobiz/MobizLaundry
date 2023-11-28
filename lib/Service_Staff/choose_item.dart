import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/CartScreen.dart';
import 'package:golden_falcon/Service_Staff/choose_sub_categ_screen.dart';

import '../Utils/common.dart';

class ChooseItemScreen extends StatefulWidget {
  const ChooseItemScreen({super.key});

  @override
  State<ChooseItemScreen> createState() => _ChooseItemScreenState();
}

class _ChooseItemScreenState extends State<ChooseItemScreen> {
  int quantity = 0;
  double totalAmount = 0.0;
  int? currentIndex;
  bool isTapped = false;
  Map<String, String> body = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ChooseSubCategoryScreen(),), (route) => false),
        ),
        title: Center(
            child: Text("Add to Cart",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {
            }, icon: Icon(Icons.refresh_outlined, size: 30, color: Colors.deepPurple,)),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height * .06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Total Amount: $totalAmount',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              InkWell(
                onTap: () {
                  isTapped = true;
                  print('$isTapped');

                  BlocProvider.of<ServiceBloc>(context).add(ServiceAddToCartEvent(authData.user_token.toString(), body));
                  Future.delayed(
                    Duration(seconds: 3),
                    () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyCartScreen(),), (route) => false);
                      isTapped = false;
                    },
                  );
                },
                child: isTapped ? CircularProgressIndicator(color: Colors.white) : Text(
                  'ADD TO CART',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => ServiceBloc(
                  RepositoryProvider.of<ServiceRepository>(context),
                )..add(ServiceItemFetchingEvent(
                  authData.user_token.toString(),
                  {
                    'id' : authData.user_id.toString(),
                    'customer_id': authData.pck_ord_cstmr_id,
                    'category_id' : authData.pck_cat_id,
                    'sub_cat_id' : authData.pck_sub_cat_id
                  }
                )),
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    if (state is ServiceItemFetchingState) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (state is ServiceItemFetchedState) {
                      return state.itemData.isNotEmpty ? Column(
                        children: [
                          Text("Choose Items"),
                          Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .8,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              child: ListView.builder(
                                itemCount: state.itemData.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        currentIndex = index;
                                      });
                                      print(currentIndex);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.deepPurple),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                child: Image.network(
                                                  '$baseUrl${state.itemData[index].itemServices.item.itemImage}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                '${state.itemData[index].itemServices.item.itemName}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Text(
                                              'AED ${state.itemData[index].amount}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          if (currentIndex == index)
                                            Container(
                                            width: 150,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(onPressed: (){

                                                    print('${authData.pck_ord_id}');
                                                    var amount = int.parse(state.itemData[index].amount);
                                                    setState(() {
                                                      quantity++;
                                                      totalAmount = amount.toDouble() * quantity.toDouble();
                                                    });
                                                    body = {
                                                      "price_list_id": state.itemData[index].priceListId,
                                                      "item_ser_id": state.itemData[index].itemServices.itemSerId,
                                                      "quantity":quantity.toString(),
                                                      "amount":totalAmount.toString(),
                                                      "order_id":authData.pck_ord_id
                                                    };
                                                  }, icon: Icon(Icons.add_circle_outline_rounded, color: Colors.deepPurple,)),
                                                  Container(
                                                    padding: EdgeInsets.all(12.0),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.blue
                                                      ),
                                                      borderRadius: BorderRadius.circular(3),
                                                    ),
                                                    child: Text( currentIndex == index ?'$quantity' : '0'),
                                                  ),
                                                  IconButton(onPressed: (){

                                                    var amount = int.parse(state.itemData[index].amount);
                                                    if (quantity > 0) {
                                                      setState(() {
                                                        quantity--;
                                                        totalAmount = amount.toDouble() / quantity.toDouble();
                                                      });
                                                    }
                                                    if (quantity == 0) {
                                                      setState(() {
                                                        quantity = 0;
                                                        totalAmount = 0.0;
                                                      });
                                                    }

                                                    body = {
                                                      "price_list_id": state.itemData[index].priceListId,
                                                      "item_ser_id": state.itemData[index].itemServices.itemSerId,
                                                      "quantity":quantity.toString(),
                                                      "amount":totalAmount.toString(),
                                                      "order_id":authData.pck_ord_id
                                                    };
                                                  }, icon: Icon(Icons.remove_circle_outline, color: Colors.deepPurple,)),
                                                ],
                                              ),
                                          )
                                          else
                                            SizedBox(width: 150,)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ) : Center(child: Text("No item listed!"),);
                    } else {
                      return Center(child: Text("Something went wrong!"),);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
