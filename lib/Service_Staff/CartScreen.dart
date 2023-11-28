import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Service_Staff/Service_staff_dashboard_75.dart';
import 'package:golden_falcon/Utils/common.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        leading: BackButton(
          // onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ChooseSubCategoryScreen(),), (route) => false),
        ),
        title: Center(
            child: Text("My Cart",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w500))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => StaffServiceDashboard(),), (route) => false);
            }, icon: Icon(Icons.home, size: 30, color: Colors.deepPurple,)),
          ),
        ],
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceItemAddedToCartState) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    border: TableBorder.all(color: Colors.deepPurple),
                    showCheckboxColumn: false,
                    columns: const [
                      DataColumn(label: Center(child: Text("Sl.No"))),
                      DataColumn(label: Center(child: Text("Item Name"))),
                      DataColumn(label: Center(child: Text("Item Image"))),
                      DataColumn(label: Center(child: Text("Category"))),
                      DataColumn(label: Center(child: Text("Quantity"))),
                      DataColumn(label: Center(child: Text("Total Amount"))),
                      DataColumn(label: Center(child: Text("Action"))),
                    ],
                      rows: List<DataRow>.generate(
                        state.cartData.length,
                        (index) {
                          return DataRow(
                            cells: [
                              DataCell(Center(child: Text('${index + 1}'))),
                              DataCell(Center(child: Text('${state.cartData[index].itemService.item.itemName}'))),
                              DataCell(Center(child: Container(height: 80, width: 80, child: Image.network('$baseUrl${state.cartData[index].itemService.item.itemImage}'),))),
                              DataCell(Center(child: Text('${state.cartData[index].itemService.category.serviceMaster.categoryName}'))),
                              DataCell(Center(child: Text('${state.cartData[index].quantity}'))),
                              DataCell(Center(child: Text('${state.cartData[index].amount}'))),
                              DataCell(Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.close, color: Colors.red,)))),
                            ]
                          );
                        },
                      ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text("Something went Wrong!"),);
          }
        },
      ),
    );
  }
}
