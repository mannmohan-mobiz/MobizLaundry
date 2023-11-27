import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/Service_Client_List.dart';

import '../Repositories/AuthRepo/auth_repository.dart';

class ClientDetailsView extends StatefulWidget {
  final Map<String, String> body;
  const ClientDetailsView({super.key, required this.body});

  @override
  State<ClientDetailsView> createState() => _ClientDetailsViewState();
}

class _ClientDetailsViewState extends State<ClientDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceBloc(
        RepositoryProvider.of<ServiceRepository>(context)
      )..add(ServiceClientDetailsEvent(authData.user_token.toString(), widget.body)),
      child: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            print(state.toString());
            if (state is ServiceClientDetailsFetchingState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                  elevation: 0,
                  leading: BackButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyClients(),
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
                body: Center(child: CircularProgressIndicator(),),
              );
            } else if (state is ServiceClientDetailsFetchedState) {
              print(state.toString());
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                  elevation: 0,
                  leading: BackButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyClients(),
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
                      child: IconButton(onPressed: () => BlocProvider.of<ServiceBloc>(context).add(ServiceClientDetailsEvent(authData.user_token.toString(), widget.body)), icon: Icon(Icons.refresh_outlined, color: Colors.deepPurple,)),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(leading: Text("Name :"), trailing: Text("${state.clientData.customer.name}"),),
                        ListTile(leading: Text("Email :"), trailing: Text("${state.clientData.customer.user.email}"),),
                        ListTile(leading: Text("Phone :"), trailing: Text("${state.clientData.customer.mobile}"),),
                        ListTile(leading: Text("Customer Type :"), trailing: Text("${state.clientData.customer.customerType}"),),
                        ListTile(leading: Text("Wallet :"), trailing: Text("${state.clientData.wallet.walletBalance}"),),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              print(state.toString());
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.deepPurple, size: 30),
                  elevation: 0,
                  leading: BackButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyClients(),
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
                body: Center(child: Text("Something went wrong!"),),
              );
            }
          },
      ),
    );
  }
}
