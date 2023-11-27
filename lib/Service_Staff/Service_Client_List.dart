import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/ServiceClientDetailsView.dart';
import 'package:golden_falcon/Service_Staff/Service_add_clients.dart';
import 'package:golden_falcon/Service_Staff/Service_staff_dashboard_75.dart';

import '../Repositories/AuthRepo/auth_repository.dart';

class MyClients extends StatefulWidget {
  const MyClients({super.key});

  @override
  State<MyClients> createState() => _MyClientsState();
}

class _MyClientsState extends State<MyClients> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceBloc(
        RepositoryProvider.of<ServiceRepository>(context),
      )..add(ServiceClientListFetchEvent(
          authData.user_token.toString(), authData.user_id.toString())),
      child: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceClientListFetchingState) {
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                elevation: 0,
                leading: BackButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => StaffServiceDashboard(),
                      ),
                      (route) => false),
                ),
                backgroundColor: CupertinoColors.white,
                title: Center(
                    child: Text("Service Staff Dashboard",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ))),
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
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is ServiceClientListFetchedState) {
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                elevation: 0,
                leading: BackButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => StaffServiceDashboard(),
                      ),
                      (route) => false),
                ),
                backgroundColor: CupertinoColors.white,
                title: Center(
                    child: Text("Service Staff Dashboard",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ))),
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
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceAddClients(),
                                ),
                                (route) => false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                            ),
                            child: Text(
                              "Add New Client",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    SizedBox(height: 12.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          showCheckboxColumn: false,
                          border: TableBorder.all(color: Colors.deepPurple),
                          columns: [
                            DataColumn(label: Center(child: Text("Sl.No"))),
                            DataColumn(label: Center(child: Text("Name"))),
                            DataColumn(label: Center(child: Text("Email"))),
                            DataColumn(label: Center(child: Text("Type"))),
                          ],
                          rows: List<DataRow>.generate(
                            state.clientData.length,
                            (index) {
                              final tData = state.clientData[index];
                              return DataRow(
                                  onSelectChanged: (value) {
                                    Map<String, String> body = {
                                      "id" : authData.user_id.toString(),
                                      "customer_id" : tData.customerId
                                    };
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ClientDetailsView(body: body)), (route) => false);
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (_) => AlertDialog(
                                    //           title: Text('${tData.name}'),
                                    //           content: Container(
                                    //             padding: EdgeInsets.all(10.0),
                                    //             child: Column(
                                    //               mainAxisSize:
                                    //                   MainAxisSize.min,
                                    //               children: [
                                    //                 ListTile(
                                    //                   title: Text("Phone : "),
                                    //                   trailing: Text("${tData.}"),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ));
                                  },
                                  cells: [
                                    DataCell(Center(
                                        child: Text((index + 1).toString()))),
                                    DataCell(Center(child: Text(tData.name))),
                                    DataCell(
                                        Center(child: Text(tData.user.email))),
                                    DataCell(Center(
                                        child: Text(tData.customerType))),
                                  ]);
                            },
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                elevation: 0,
                leading: BackButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => StaffServiceDashboard(),
                      ),
                      (route) => false),
                ),
                backgroundColor: CupertinoColors.white,
                title: Center(
                    child: Text("Service Staff Dashboard",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ))),
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
              body: Center(child: Text("Something Went Wrong")),
            );
          }
        },
      ),
    );
  }
}
