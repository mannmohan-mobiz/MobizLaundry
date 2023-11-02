import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrate_3screens/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:integrate_3screens/Repositories/AuthRepo/auth_repository.dart';
import 'package:integrate_3screens/Repositories/PickerRepo/picker_repo.dart';

import '../../Utils/common.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class NewOrderScreen2 extends StatefulWidget {
  const NewOrderScreen2({super.key});

  @override
  State<NewOrderScreen2> createState() => _NewOrderScreen2State();
}

class _NewOrderScreen2State extends State<NewOrderScreen2> {
  String mode = "category";
  @override
  Widget build(BuildContext context) {
    final PickerRepository pickerRepository = PickerRepository();
    if (mode == "category")
      return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'New Order Form - 2',
          ),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
          ),
          child: BottomDrawer(),
        ),
        body: FutureBuilder(
          future: pickerRepository.getPickerCategs(
              id: authData.user_id.toString(),
              token: authData.user_token.toString()),
          builder: (context, snapshot) {
            if (snapshot.data!.data.isNotEmpty) {
              return Column(
                children: [
                  Center(child: Text("Select Category"),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            authData.setCatId(snapshot.data!.data[index].categoryId);
                            if (authData.pck_cat_id.isNotEmpty) {
                              setState(() {
                                mode = "sub_category";
                              });
                            }
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
                                                baseUrl+snapshot.data!.data[index].serviceMaster.categoryImage,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.data[index].categoryName,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ));
    if (mode == "sub_category")
      return Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'New Order Form - 2',
          ),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
          ),
          child: BottomDrawer(),
        ),
        body: FutureBuilder(
          future: pickerRepository.getPickerSubCategs(categ_id: authData.pck_cat_id, token: authData.user_token.toString()),
          builder: (context, snapshot) {
            if (snapshot.data!.data.isNotEmpty) {
              return Column(
                children: [
                  Center(child: Text("Select Sub Category"),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            authData.setSubCatId(snapshot.data!.data[index].subCatId);
                            if (authData.pck_sub_cat_id.isNotEmpty) {
                              setState(() {
                                mode = "items";
                              });
                            }
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
                                                baseUrl+snapshot.data!.data[index].subServiceMaster.subCatImage,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.data[index].subCatName,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      );
    if (mode == "items")
      return Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Appbar(
            text: 'New Order Form - 2',
          ),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
          ),
          child: BottomDrawer(),
        ),
        body: FutureBuilder(
          future: pickerRepository.getItemsPrice(
            body: {
              "sub_cat_id" : authData.pck_sub_cat_id,
              "category_id" : authData.pck_cat_id,
              "customer_id" :authData.pck_ord_cstmr_id
            },
            token: authData.user_token.toString()
          ),
          builder: (context, snapshot) {
            if (snapshot.data!.data.length > 0) {
              return Column(
                children: [
                  Center(child: Text("Select Sub Category"),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
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
                                                baseUrl+snapshot.data!.data[index][index].itemServices.item.itemImage,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.data[index][index].itemServices.item.itemName,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      );
    else
      return Scaffold();
  }
}
