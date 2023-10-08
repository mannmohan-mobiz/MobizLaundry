import 'package:flutter/material.dart';
import 'package:integrate_3screens/Customers/15-19/Transaction_History.dart';
import 'package:integrate_3screens/Customers/Complaint.dart';
import 'package:integrate_3screens/Customers/Edit.dart';
import 'package:integrate_3screens/Customers/Invoice.dart';
import 'package:integrate_3screens/Customers/Language.dart';
import 'package:integrate_3screens/Customers/Password.dart';
import 'package:integrate_3screens/Customers/Promotions.dart';
import 'package:integrate_3screens/Customers/Services_screen.dart';
import 'package:integrate_3screens/Customers/Share_screen.dart';

import '../Loginscreen.dart';
import '15-19/Order_History.dart';
import '15-19/Order_Status.dart';
import '15-19/Pricing.dart';
import 'NewOrder.dart';
import 'Notifications.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),),(route) => false
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(actionsAlignment: MainAxisAlignment.center,
        title: Center(child: Text('Exit App !',style: TextStyle(color: Colors.pinkAccent[400]),)),
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
        actions:[
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No',style: TextStyle(color: Colors.green[700]),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes',style: TextStyle(color: Colors.pinkAccent[400]),),
            ),
          ),
        ],
      ),
    )??false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          title: Center(child: Text('Mobiz Laundry',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifications(),
                  ),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.notifications,color: Colors.blue,),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwaH1Wvbjn0K9LrL7_WyAfPW85Kl9fUu-mpw&usqp=CAU'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ABHISHEK - HOME',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.edit,color: Colors.blue,),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16,),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Edit()),
                  );
                },
              ),
              Divider(
thickness: .5,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.language,color: Colors.blue,),
                title: Text(
                  'Language',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Language()),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.history_sharp,color: Colors.blue,),
                title: Text(
                  'Order History',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Orderhistory()),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.history,color: Colors.blue,),
                title: Text(
                  'Transaction History',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Transactionhistory(),
                    ),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.error,color: Colors.blue,),
                title: Text(
                  'Customer Complaint',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Complaint()),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.share,color: Colors.blue,),
                title: Text(
                  'Share',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShareScreen()),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.lock,color: Colors.blue,),
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Password()),
                  );
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(Icons.description,color: Colors.blue,),
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  // Handle terms and conditions option
                },
              ),
              Divider(
                thickness: .5,
                height: 0.1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.blue,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                onTap: () {
                  showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'AED 80',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(onPressed: () {},
                            child: Text('TOP UP',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Invoice(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Outstanding',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AED 20',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          /*  ElevatedButton(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Invoice(),
                                ),
                              );
                            },
                              child: Text('Pay Now',style: TextStyle(color: Colors.white),),
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => Orderstushistory(),
                           ),
                         );
                       },
                       child: Column(
                         children: [
                           CircleAvatar(
                             radius: 30,
                             backgroundColor: Colors.blue,
                             child: Icon(
                               Icons.assignment,
                               color: Colors.white,
                               size: 30,
                             ),
                           ),
                           SizedBox(height: 10),
                           Text('Order Status', style: TextStyle(fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => CustomerNewOrder(),
                           ),
                         );
                       },
                       child: Column(
                         children: [
                           CircleAvatar(
                             radius: 30,
                             backgroundColor: Colors.orange,
                             child: Icon(
                               Icons.add_shopping_cart,
                               color: Colors.white,
                               size: 30,
                             ),
                           ),
                           SizedBox(height: 10),
                           Text('New Order', style: TextStyle(fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => Pricing(),
                           ),
                         );
                       },
                       child: Column(
                         children: [
                           CircleAvatar(
                             radius: 30,
                             backgroundColor: Colors.indigo,
                             child: Icon(
                               Icons.payment,
                               color: Colors.white,
                               size: 30,
                             ),
                           ),
                           SizedBox(height: 10),
                           Text('Our Rates', style: TextStyle(fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: 30),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => Promotions(),
                             ),
                           );
                         },
                         child: Column(
                           children: [
                             Card(
                               elevation: 2,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30),
                               ),
                               child: CircleAvatar(
                                 radius: 30,
                                 backgroundColor: Colors.purple,
                                 child: Icon(
                                   Icons.local_offer,
                                   color: Colors.white,
                                   size: 30,
                                 ),
                               ),
                             ),
                             SizedBox(height: 10),
                             Text('Promotions', style: TextStyle(fontWeight: FontWeight.bold)),
                           ],
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           // Handle Services option
                         },
                         child: Column(
                           children: [
                             Card(
                               elevation: 2,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30),
                               ),
                               child: InkWell(
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesScreen(),));
                                 },
                                 child: CircleAvatar(
                                   radius: 30,
                                   backgroundColor: Colors.teal,
                                   child: Icon(
                                     Icons.local_laundry_service_outlined,
                                     color: Colors.white,
                                     size: 30,
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(height: 10),
                             Text('Services', style: TextStyle(fontWeight: FontWeight.bold)),
                           ],
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           // Handle Contact option
                         },
                         child: Column(
                           children: [
                             Card(
                               elevation: 2,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30),
                               ),
                               child: CircleAvatar(
                                 radius: 30,
                                 backgroundColor: Colors.redAccent,
                                 child: Icon(
                                   Icons.phone,
                                   color: Colors.white,
                                   size: 30,
                                 ),
                               ),
                             ),
                             SizedBox(height: 10),
                             Text('Contact', style: TextStyle(fontWeight: FontWeight.bold)),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           )
          ],
        ),
      ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          color: Colors.blue),
                      child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('Assets/Images/coin.png'),
                          Text('50',style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/Images/Wash1.png'), fit: BoxFit.fill),
                  ),
                ),
      ],
      ),
      ),
      ),
    );
  }
}
