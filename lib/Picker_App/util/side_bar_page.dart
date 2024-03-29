import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Loginscreen.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../screens/attendance-page.dart';
import '../screens/attendance_screen.dart';
import '../screens/expense_page.dart';
import '../screens/order_history_page.dart';
import '../screens/profile_page.dart';
import '../src/colors.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  // Push the page and remove everything else
  navigateToPage(BuildContext context, String page) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  Widget divider() {
    return const Divider(
      indent: 20,
      endIndent: 20,
      height: 0.2,
      thickness: 1.5,
      color: pickerDividerColor,
    );
  }

  Widget listItem(BuildContext context, String text, String image) {
    return ListTile(
      leading: Image.asset(image), //Image.asset('assets/images/home.png'),
      title: Text(text),
      onTap: () => navigateToPage(context, text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: pickerBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  //padding: const EdgeInsets.symmetric(horizontal: 90),
                  decoration:  BoxDecoration(
                    color: pickerWhiteColor,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
                    border: Border.all(
                      color: pickerGoldColor, // Change this to the desired border color
                      width: 2.0, // Change this to the desired border width
                    ),

                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 1,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Image.asset(
                      'Assets/Images/profile.png'),),
                      const Text(
                        'Hey User!\nWelcome...',
                        style: TextStyle(color: pickerGoldColor,fontSize: 20,fontWeight: FontWeight.bold),

                      ),
                    ],
                  ),
                ),
                // ListTile(
                //   leading: Image.asset('Assets/Images/edit_profile_icon1.png'), //Image.asset('assets/images/home.png'),
                //   title: const Text('Edit profile'),
                //   onTap: () {},
                // ),
                // divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/lang_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Language'),
                  onTap: () {},
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/order_report_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Order Report'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryPage()));
                  },
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/tariffs_img1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Transaction History'),
                  onTap: () {},
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/complaints_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Customer Complaints'),
                  onTap: () {},
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/change_pass_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Attendance'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AttendancePage()));

                  },
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/change_address_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Change Address'),
                  onTap: () {},
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/offers_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Our Offers'),
                  onTap: () {},
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/expense.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Expenses'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpensePage()));
                  },
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/branches_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Our Branches'),
                  onTap: () {


                  },
                ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/share_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Share App'),
                  onTap: () {},
                ),
                // divider(),
                // ListTile(
                //   leading: Image.asset('Assets/Images/terms_icon1.png'), //Image.asset('assets/images/home.png'),
                //   title: const Text('Terms & conditions'),
                //   onTap: () {},
                // ),
                divider(),
                ListTile(
                  leading: Image.asset('Assets/Images/logout_icon1.png'), //Image.asset('assets/images/home.png'),
                  title: const Text('Logout'),
                  onTap: () {
                    final authData = AuthData();
                    authData.logout();
                    if (authData.response ==  "Logged out Successfully!") {
                      authData.clearResponse();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ));

  }
}
