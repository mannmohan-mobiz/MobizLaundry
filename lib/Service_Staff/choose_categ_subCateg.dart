import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
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
            child: Icon(
              Icons.refresh_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
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
                  builder: (context, state) {
                    if (state is ServiceCategoryFetchingState) {
                      return CircularProgressIndicator();
                    } else if (state is ServiceCategoryFetchedState) {
                      return Column(
                        children: [
                          Text("Choose Category"),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              itemCount: state.categdata.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    print("Tapped: ${state.categdata[index].categoryId}");
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
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Something went wrong!"),
                      );
                    }
                  },
                ),
              ),
              if (isCategChoose)
                SizedBox(height: 12.0),
              if (isCategChoose)
                Text("TEST"),
            ],
          ),
        ),
      ),
    );
  }
}
