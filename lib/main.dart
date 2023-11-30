import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/AuthBloc/auth_bloc.dart';
import 'package:golden_falcon/BLoCs/CustomerBloc/customer_bloc.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/BLoCs/ServiceBloc/service_bloc.dart';
import 'package:golden_falcon/Customers/Customer_Home.dart';
import 'package:golden_falcon/Owners/Dashboard/Navigation.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Repositories/CustomerRepo/customer_repository.dart';
import 'package:golden_falcon/Repositories/PickerRepo/picker_repo.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';
import 'package:golden_falcon/Service_Staff/Service_staff_dashboard_75.dart';
import 'package:golden_falcon/Utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loginscreen.dart';
import 'Owners/Dashboard/pages2/21-06/Order_Statistics_120.dart';
import 'Picker_App/screens/attendance_screen.dart';
import 'Picker_App/screens/category_wise_order_report.dart';
import 'Picker_App/screens/deposit.dart';
import 'Picker_App/screens/deposit_history.dart';
import 'Picker_App/screens/expense.dart';
import 'Picker_App/screens/home_page_new.dart';
import 'Picker_App/screens/homepage.dart';
import 'Picker_App/screens/item_wise_order_report.dart';
import 'Picker_App/screens/my_collections.dart';
import 'Picker_App/screens/order_report.dart';
import 'Picker_App/screens/outstanding_due.dart';
import 'Picker_App/screens/ready_dispatch.dart';

void main() {
  final authRepository = AuthRepository();
  final pickerRepository = PickerRepository();
  final customerRepository = CustomerRepository();
  final serviceRepository = ServiceRepository();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthRepository>(create: (context) => authRepository),
      RepositoryProvider<PickerRepository>(
          create: (context) => pickerRepository),
      RepositoryProvider<CustomerRepository>(
          create: (context) => customerRepository),
      RepositoryProvider<ServiceRepository>(
          create: (context) => serviceRepository),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        BlocProvider<PickerBloc>(
            create: (context) => PickerBloc(pickerRepository)),
        BlocProvider<CustomerBloc>(
            create: (context) => CustomerBloc(customerRepository)),
        BlocProvider<ServiceBloc>(
            create: (context) => ServiceBloc(serviceRepository)),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(authData.user_type);
    print(authData.user_id);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.black, seedColor: Colors.white),
      ),
      home: LoginPage(),
      routes: {
        //'Home': (context) => const HomePage(),
        'Home': (context) => const HomePageNew(),
        'Attendance': (context) => AttendanceScreen(),
        'Dispatch Home': (context) => DispatchReadyScreen(),
        'OutStanding Dues': (context) => OutStandinDueScreen(),
        'My Collection': (context) => MyCollectionScreen(),
        'Deposit': (context) => DepositScreen(),
        'Deposit History': (context) => DepsoitHistoryScreen(),
        'Order History': (context) => OrderReportScreen(),
        'Expense': (context) => ExpenseScreen(),
        'Order Statistics': (context) => OrderStatistics(),
        'Category Wise report': (context) => CatogoryWiseReportScreen(),
        'Item Wise report': (context) => ItemWiseReportScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 5),
    //         () => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => HomePage(),
    //         )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple, child: Image.asset('Assets/Images/logo.png'));
  }
}
