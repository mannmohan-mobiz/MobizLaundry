import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/choose_sub_categ_screen.dart';
import 'package:golden_falcon/Utils/common.dart';

class CategorySubCategoryScreen extends StatefulWidget {
  const CategorySubCategoryScreen({super.key});

  @override
  State<CategorySubCategoryScreen> createState() =>
      _CategorySubCategoryScreenState();
}

class _CategorySubCategoryScreenState extends State<CategorySubCategoryScreen> {
  bool isCategChoose = false;
  Map<String, String> body = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
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
                )..add(ServiceCategoryFetchingEvent(
                    authData.user_token.toString(),
                    authData.user_id.toString())),
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  // buildWhen: (previous, current) => !(current is ServiceCategoryFetchedState),
                  builder: (context, state) {
                    if (state is ServiceCategoryFetchingState) {
                      print(state.toString());
                      return CircularProgressIndicator();
                    } else if (state is ServiceCategoryFetchedState) {
                      print(state.toString());
                      return Column(
                        children: [
                          Text("Choose Category"),
                          Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .8,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              child: ListView.builder(
                                itemCount: state.categdata.length,
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
                                      authData.setCatId(state.categdata[index].categoryId);
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ChooseSubCategoryScreen(),), (route) => false);
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
                                              '$baseUrl${state.categdata[index].serviceMaster.categoryImage}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Center(
                                            child: Text(
                                              '${state.categdata[index].serviceMaster.categoryName}',
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
                      );
                    } else {
                      print('ELSE ${state.toString()}');
                      return Center(
                        child: Text("Something went wrong!"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
