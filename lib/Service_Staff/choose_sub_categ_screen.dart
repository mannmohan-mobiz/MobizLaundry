import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/choose_categ_subCateg.dart';
import 'package:golden_falcon/Service_Staff/choose_item.dart';

import '../Utils/common.dart';

class ChooseSubCategoryScreen extends StatefulWidget {
  const ChooseSubCategoryScreen({super.key});

  @override
  State<ChooseSubCategoryScreen> createState() => _ChooseSubCategoryScreenState();
}

class _ChooseSubCategoryScreenState extends State<ChooseSubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CategorySubCategoryScreen(),), (route) => false),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => ServiceBloc(
                  RepositoryProvider.of<ServiceRepository>(context),
                )..add(ServiceSubCategoryFetchingEvent(authData.user_token.toString(),
                    {'id' : authData.user_id.toString(), 'category_id' : authData.pck_cat_id})),
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    if (state is ServiceSubCategoryFetchingState) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (state is ServiceSubCategoryFetchedState) {
                      return state.subCategData.isNotEmpty ? Column(
                        children: [
                          Text("Choose Sub Category"),
                          Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .8,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              child: ListView.builder(
                                itemCount: state.subCategData.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      // body = {
                                      //   'id': authData.user_id.toString(),
                                      //   'category_id' : state.categdata[index].categoryId
                                      // };
                                      // if (body.isNotEmpty) {
                                      //   setState(() {
                                      //     isCategChoose = true;
                                      //   });
                                      // }
                                      authData.setSubCatId(state.subCategData[index].subCatId);
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ChooseItemScreen(),), (route) => false);
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
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            child: Image.network(
                                              '$baseUrl${state.subCategData[index].subServiceMaster.subCatImage}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Center(
                                            child: Text(
                                              '${state.subCategData[index].subServiceMaster.subCatName}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
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
