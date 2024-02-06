import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import 'customer_home_page.dart';

class TopUpRequestPage extends StatefulWidget {
  const TopUpRequestPage({super.key});

  @override
  State<TopUpRequestPage> createState() => _TopUpRequestPageState();
}

class _TopUpRequestPageState extends State<TopUpRequestPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
            onPressed: () {
              close(context);
            },
            icon: Image.asset('Assets/Images/back_arrow.png')),
        title: const Text(
          'Top up requests',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Image.asset('Assets/Images/topup.png'),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jason Roy',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontSize: 15),
                      ),
                      Text('Requested AED 100',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontSize: 14),
                      ),
                      Text('6 minutes ago....',
                        style: TextStyle(
                            color: pickerBlackColor,
                            fontSize: 14),
                      ),
                    ],
                  ),
                 trailing:  InkWell(
                   onTap: (){
                     showCustomBottomSheet(
                         context,
                         title: 'Track customer name and top up',
                         Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(
                                     child: ElevatedButton(
                                       onPressed: () {},
                                       style: ElevatedButton.styleFrom(
                                         elevation: 0,
                                         backgroundColor: Colors.white,
                                         surfaceTintColor: Colors.white,
                                         side: const BorderSide(
                                           width: 1.6,
                                           color: pickerGoldColor,
                                         ),
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(12.0),
                                         ),
                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Image.asset('Assets/Images/nav.png'),
                                           const SizedBox(width: 10,),
                                           const Text(
                                             'Navigate',
                                             style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                   const SizedBox(width: 18,),
                                   Expanded(
                                     child: ElevatedButton(
                                       onPressed: () {
                                         // Navigator.push(
                                         //   context,
                                         //   MaterialPageRoute(builder: (context) => const AddToWalletPage()),
                                         // );
                                       },
                                       style: ElevatedButton.styleFrom(
                                         elevation: 0,
                                         backgroundColor: Colors.white,
                                         surfaceTintColor: Colors.white,
                                         side: const BorderSide(
                                           width: 1.6,
                                           color: pickerGoldColor,
                                         ),
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(12.0),
                                         ),
                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Image.asset('Assets/Images/call.png'),
                                           const SizedBox(width: 10,),
                                           const Text(
                                             'Call',
                                             style: TextStyle(fontSize: 12.0, color: pickerBlackColor),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             const SizedBox(height: 20,),
                             SizedBox(
                               width: double.infinity,
                               height: 54,
                               child: ElevatedButton(
                                 onPressed: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => const CustomerHomePageScreen()),
                                   );
                                 },
                                 style: ElevatedButton.styleFrom(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(12), // <-- Radius
                                   ),
                                   backgroundColor: pickerGoldColor,
                                 ),
                                 child: const Text(
                                   'Go to customer home & top-up',
                                   style: TextStyle(fontSize: 12.0, color: pickerWhiteColor),
                                 ),
                               ),
                             ),
                           ],
                         )
                     );
                   },
                   child: Container(
                      width: 110,
                      height: 38,
                      decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        border: Border.all(color: pickerGoldColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:const Center(
                        child: Text(
                          'Manage',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                        ),
                      ),
                    ),
                 ),
                ),
              )
          ),
        )
    );
  }
}
