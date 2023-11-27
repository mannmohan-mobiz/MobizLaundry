import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/PaymentDetails_Screen.dart';

class ServiceUndeliveredScreen extends StatefulWidget {

  @override
  State<ServiceUndeliveredScreen> createState() => _ServiceUndeliveredScreenState();
}

class _ServiceUndeliveredScreenState extends State<ServiceUndeliveredScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceBloc(
        RepositoryProvider.of<ServiceRepository>(context),
      )..add(ServiceUndeliveredOrderListEvent(authData.user_token.toString(), authData.user_id.toString())),
      child: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state is ServiceUndeliveredOrderListFetchingState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("UNDELIVERED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: Center(child: CircularProgressIndicator(),),
              );
            } else if (state is ServiceUndeliveredOrderListFetchedState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("UNDELIVERED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: state.unDeliverOrder.length > 0 ?
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 2,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width + 200,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width + 200,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  child: Center(
                                                      child: Text('J.No',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold))),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  child: Center(
                                                      child: Text('Order No',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold))),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: SizedBox(
                                                  child: Center(
                                                      child: Text('Customer Name',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold))),
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  child: Center(
                                                      child: Text('Staff Name',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold))),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: SizedBox(
                                                  child: Center(
                                                      child: Text('Delivery Time',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold))),
                                                ),
                                              ),
                                              // Expanded(
                                              //   flex: 3,
                                              //   child: SizedBox(),
                                              // ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              height: 0.5,
                                              width: MediaQuery.of(context).size.width + 200,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          // Add the ListView inside a SizedBox with a specific height
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.7,
                                            child: ListView.builder(
                                              itemCount: 20,
                                              itemBuilder: (context, index) {
                                                Color rowColor;
                                                if (state.unDeliverOrder[index].orderType == "Express") {
                                                  // Set the color of every third row to orange
                                                  rowColor = Colors.orange;
                                                } else if (state.unDeliverOrder[index].orderType == "Urgent") {
                                                  // Set the color of every third row to yellow
                                                  rowColor = Colors.yellow;
                                                } else {
                                                  // Set the color of every third row to white
                                                  rowColor = Colors.white;
                                                }

                                                return Container(
                                                  color: rowColor, // Apply the color to the row container
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: SizedBox(
                                                          child: Center(
                                                            child: Text("${index + 1}"),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          child: Center(
                                                            child: Text("${state.unDeliverOrder[index].orderNumber}"),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: SizedBox(
                                                          child: Center(
                                                            child: Text("${state.unDeliverOrder[index].customer.name}"),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          child: Center(
                                                            child: Text("${state.unDeliverOrder[index].staff.name}"),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: SizedBox(
                                                          height: 40,
                                                          child: Center(
                                                            child: Text("${state.unDeliverOrder[index].deliveryTime}"),
                                                          ),
                                                        ),
                                                      ),
                                                      // Expanded(
                                                      //   flex: 3,
                                                      //   child: Center(
                                                      //       child: ElevatedButton(onPressed: () {
                                                      //         Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetails(),));
                                                      //       },child:Text("Deliver",style: TextStyle(color: Colors.white)) ,style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),)
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ) :
                Center(child: Text("No Undelivered Items!"),),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
                  elevation: 0,
                  backgroundColor: CupertinoColors.white,
                  title: Center(child: Text("UNDELIVERED",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500,))),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                body: Center(child: Text("Something went wrong!"),),
              );
            }
          },
      ),
    );
  }
}
