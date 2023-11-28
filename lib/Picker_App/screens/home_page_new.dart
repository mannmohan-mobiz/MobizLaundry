import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/bottom_navigation_new.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
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
    List<String> labelButtonText1 = ['New Order', 'Delivery', 'Collection'];
    List<String> labelButtonText2 = ['Create Client', 'My Clients','Undelivered'];

    return   Scaffold(
     backgroundColor:pickerBackgroundColor,
      appBar: AppBar(
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 150.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
          onPressed: () {
            //Scaffold.of(context).openDrawer();
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
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 30
              ),
              itemCount: labelText.length,
              itemBuilder: (context, index) =>
            Container(
                width: 50,
                height: 120,
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
            const SizedBox(height: 25,),
             Row(
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
            ),
          ],
        ),
      ),

    );
  }
}
