import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';

class ServiceComplaint extends StatefulWidget {
  const ServiceComplaint({Key? key}) : super(key: key);

  @override
  State<ServiceComplaint> createState() => _ServiceComplaintState();
}

class _ServiceComplaintState extends State<ServiceComplaint> {

  bool isVisible = false;
  int selectedRowIndex = -1;

  void toggleButtonVisibility() {
    setState(() {
      isVisible = true;
    });
  }

  void selectRow(int index) {
    setState(() {
      selectedRowIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("COMPLAINT",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.w500))),
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
      body: BlocProvider(
        create: (context) => ServiceBloc(RepositoryProvider.of<ServiceRepository>(context))..add(ComplaintListFetchEvent(authData.user_token.toString(), authData.user_id.toString())),
        child: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state is ServiceComplaintListFetchingState) {
              return Center(child: CircularProgressIndicator(),);
            } else if (state is ServiceComplaintListFetchedState) {
              return state.complantData.isNotEmpty ?
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        columns: [
                          DataColumn(label: Center(child: Text("Sl.No"),)),
                          DataColumn(label: Center(child: Text("Order.No"),)),
                          DataColumn(label: Center(child: Text("Order Type"),)),
                          DataColumn(label: Center(child: Text("Staff Name"),)),
                          DataColumn(label: Center(child: Text("Customer Name"),)),
                          DataColumn(label: Center(child: Text("Status"),)),
                          DataColumn(label: Center(child: Text("Remarks"),)),
                        ],
                        rows: List<DataRow>.generate(
                          state.complantData.length,
                          (index) {
                            return DataRow(
                              cells: [
                                DataCell(Center(child: Text('${index + 1}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].order.orderNumber}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].order.orderType}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].order.staff.name}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].order.customer.name}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].status}'),)),
                                DataCell(Center(child: Text('${state.complantData[index].remarks}'),)),
                              ]
                            );
                          },
                        ),
                    ),
                  ),
                ),
              ) :
              Center(child: Text('No complaints listed!'),);
            } else {
              return Center(child: Text("Something went wrong!"),);
            }
          },
        ),
      ),
    );
  }
}
