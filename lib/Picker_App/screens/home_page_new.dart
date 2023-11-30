import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/picking_confirmation_page.dart';
import 'package:golden_falcon/Picker_App/screens/ready_for_despatch_page.dart';

import '../src/colors.dart';
import '../util/bottom_navigation_new.dart';
import '../util/common_methods.dart';
import '../util/drawer.dart';
import '../util/drawer.dart';
import '../util/side_bar_page.dart';
import 'confirmed_orders_page.dart';
import 'delivery_page.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<String> labelText = [
      'Picking\nConfirmation',
      'Confirmed',
      'Ready for\nDispatch',
      'Outstanding',
      'Delivered',
      'Deposit',
      'Pending for\nprocess',
      'Urgent\nDelivery'
    ];
    List<String> labelButtonText1 = ['New Order', 'Delivery', 'Collection','Create Client', 'My Clients','Undelivered'];
   // List<String> labelButtonText2 = ['Create Client', 'My Clients','Undelivered'];

    return   Scaffold(
      key: _scaffoldKey,
      backgroundColor:pickerBackgroundColor,
      drawer:  const SideMenuPage(),
      appBar: AppBar(
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 150.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: pickerGoldColor,
            size: 30,
          ),
        ),
        title: Image.asset('Assets/Images/golden_logo.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/refresh.png'),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16),
        child: ListView(
          children:  [
            const Center(
              child: Text(
                'Picker Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  color: pickerGoldColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Hai User!',
              style: TextStyle(
                fontSize: 15,
                color: pickerBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 1.35,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 30
              ),
              itemCount: labelText.length,
              itemBuilder: (context, index) =>
            InkWell(
              onTap: ()=> onMenuClicked(index,context),
              child: Container(
                  decoration: BoxDecoration(
                      color: pickerWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:pickerGoldColor )
                  ),
                  child:  Column(
                    children: [
                      const Text(
                        '20',
                        style: TextStyle(
                          fontSize: 20,
                          color: pickerGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(thickness: 2,color: pickerGoldColor,),
                      Flexible(
                        child: Text(
                          labelText[index],
                          style: const TextStyle(
                            fontSize: 10,
                            color: pickerBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            ),
            const SizedBox(height: 25,),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                   childAspectRatio: 3 / 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20
                ),
                itemCount: labelButtonText1.length,
                itemBuilder: (context, index) =>

                     Center(
                       child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: pickerGoldColor,
                fixedSize: const Size(150, 50),
              side: const BorderSide(color: pickerWhiteColor, width: 2.0),
            ),
          onPressed: () {  },
            child:  Padding(
              padding: const EdgeInsets.only(top: 2.0,bottom: 2,right: 0),
              child: Text(
                labelButtonText1[index],
                style: const TextStyle(color: pickerWhiteColor,fontSize: 11),
              ),
            ),
           ),
                     ),
            )
             /*Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Expanded(
                   child: SizedBox(
                     height: 50,
                     child: ListView.builder(
                         itemCount: labelButtonText1.length,
                         shrinkWrap: true,
                         physics: const BouncingScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (itemBuilder, index) =>
                       Padding(
                         padding: const EdgeInsets.symmetric(
                           horizontal: 8),
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                               backgroundColor: pickerGoldColor,
                               fixedSize: const Size.fromWidth(130),
                             side: const BorderSide(color: pickerWhiteColor, width: 2.0),
                           ),
                           onPressed: () {  },
                           child:  Text(
                             labelButtonText1[index],
                             style: const TextStyle(color: Colors.white),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: labelButtonText2.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (itemBuilder, index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: pickerGoldColor,
                                  fixedSize: const Size.fromWidth(130),
                                side: const BorderSide(color: pickerWhiteColor, width: 2.0),
                              ),
                              onPressed: () {  },
                              child:  Text(
                                labelButtonText2[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),

    );
  }


  onMenuClicked(int index, BuildContext context,) {
    switch (index) {
      case 0:
        open(context, const PickingConfirmationPage());
        break;
      case 1:
        open(context, const ConfirmedOrdersPage());
        break;
      case 2:
        open(context, const ReadyForDespatchPage());
        break;
      case 4:
        open(context, const DeliveryPage());
        break;
    }
  }
}
