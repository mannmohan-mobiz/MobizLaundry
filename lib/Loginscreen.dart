import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/BLoCs/AuthBloc/auth_bloc.dart';
import 'package:golden_falcon/Owners/Dashboard/Navigation.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Customers/Customer_Home.dart';
import 'Owners/Dashboard/Owner_dashboard.dart';
import 'Picker_App/screens/homepage.dart';
import 'Service_Staff/Service_staff_dashboard_75.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: Center(
                child: Text(
              'Exit App !',
              style: TextStyle(color: Colors.pinkAccent[400]),
            )),
            content: SizedBox(
                height: 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Text('Do you Really Want to'),
                        const Text('Close the App ?')
                      ],
                    ),
                  ),
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.green[700]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.pinkAccent[400]),
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _login() {
    print("Enter");
    String username = _usernameController.text;
    String password = _passwordController.text;

    BlocProvider.of<AuthBloc>(context).add(UserLoginEvent(username, password));
    // if (username == '111' && password == '111') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => CustomerHomeScreen()),
    //   );
    // } else if (username == '222' && password == '222') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => StaffServiceDashboard()),
    //   );
    // } else if (username == '333' && password == '333') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Navigation()),
    //   );
    // } else if (username == '444' && password == '444') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyHomePage()),
    //   );
    // } else {
    //   setState(() {
    //     _errorMessage = 'Invalid username or password';
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: BlocProvider(
        create: (context) =>
            AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
        child: Scaffold(
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                switch (state.usertype) {
                  case "Customer":
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerHomeScreen()),
                    );
                    break;

                  case "Staff":
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StaffServiceDashboard()),
                    );
                    break;

                  case "Picker":
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  HomePage()),
                    );
                    break;

                  case "Admin":
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Navigation()),
                    );
                    break;
                }
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is LoginInitialState) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF48a3c2),
                          Color(0xFF1A344F),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Welcome",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              labelText: 'User name',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 24.0),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Signing In',
                          //         style: TextStyle(fontSize: 18.0),
                          //       ),
                          //       CircularProgressIndicator()
                          //     ],
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //     primary: Colors.white,
                          //     onPrimary: Color(0xFF2B4C6F),
                          //     padding: EdgeInsets.symmetric(horizontal: 64.0),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(32.0),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: CircularProgressIndicator(
                              color: Colors.greenAccent,
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Text("Powered By Mobiz")
                        ],
                      ),
                    ),
                  );
                } else {
                  print('##### ${state.toString()}');
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF48a3c2),
                          Color(0xFF1A344F),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              labelText: 'User name',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 24.0),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(UserLoginEvent(_usernameController.text, _passwordController.text));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Color(0xFF2B4C6F),
                              padding: EdgeInsets.symmetric(horizontal: 64.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Text("Powered By Mobiz")
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
