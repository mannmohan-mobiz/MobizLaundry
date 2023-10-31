import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrate_3screens/Repositories/AuthRepo/auth_repository.dart';
import 'package:integrate_3screens/Repositories/CustomerRepo/customer_repository.dart';
import 'package:integrate_3screens/Utils/common.dart';

import '../../BLoCs/CustomerBloc/customer_bloc.dart';
import 'Transaction_History.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  _PricingState createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  String selectedCategory = 'Select Category';
  String selectedCategoryId = '';
  String selectedSubCategory = 'Select Sub Category';
  List<String> categoryList = [];
  List<String> sub_categoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(
            child: Text("PRICING",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (context) => CustomerBloc(
                RepositoryProvider.of<CustomerRepository>(context),
              )..add(GetCategoryEvent(
                  authData.user_token!, authData.user_id.toString())),
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CategoryGettingState) {
                    print(state.toString());
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == 'Select Category') {
                              return 'Select Category';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          value: selectedCategory,
                          items: categoryList.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value.toString();
                            });
                          },
                        ),
                      ),
                    );
                  } else if (state is CategoryGotState) {
                    print(state.toString());
                    if (categoryList.isEmpty) {
                      categoryList.add('Select Category');
                      state.cList.forEach((category) {
                        categoryList.add(category.categoryName);
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == 'Select Category') {
                              return 'Select Category';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          value: selectedCategory,
                          items: categoryList.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value.toString();
                            });
                            state.cList.forEach((categ) {
                              if (value == categ.categoryName) {
                                setState(() {
                                  selectedCategoryId = categ.categoryId;
                                });
                              }
                            });
                          },
                        ),
                      ),
                    );
                  } else {
                    print(state.toString());
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == 'Select Category') {
                              return 'Select Category';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          value: selectedCategory,
                          items: categoryList.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value.toString();
                            });
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            if (selectedCategoryId.isNotEmpty)
              BlocProvider(
                create: (context) => CustomerBloc(
                  RepositoryProvider.of<CustomerRepository>(context),
                )..add(GetSubCategoryEvent(
                    authData.user_token!, selectedCategoryId)),
                child: BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is SubCategoryGettingState) {
                      print(state.toString());
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == 'Select Sub Category') {
                                return 'Select Sub Category';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                            value: selectedCategory,
                            items: sub_categoryList.map((s_category) {
                              return DropdownMenuItem(
                                value: s_category,
                                child: Text(s_category),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSubCategory = value.toString();
                              });
                            },
                          ),
                        ),
                      );
                    } else if (state is SubCategoryGotState) {
                      print(state.toString());
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: state.scList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                print(state.scList[index].subCatName);
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
                                                    baseUrl+state.scList[index].subServiceMaster.subCatImage,
                                                    fit: BoxFit.fill,
                                                  )),
                                              SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.scList[index].subCatName,
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
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
