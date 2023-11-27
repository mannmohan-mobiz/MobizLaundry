import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';

import '../util/appBar.dart';

class SelectDeliveryTypes extends StatefulWidget {
  const SelectDeliveryTypes({super.key});

  @override
  State<SelectDeliveryTypes> createState() => _SelectDeliveryTypesState();
}

class _SelectDeliveryTypesState extends State<SelectDeliveryTypes> {

  List<String> selectTypes = ['Normal Delivery', 'Express Delivery', 'Urgent Delivery'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Appbar(
          text: 'Select Type',
        ),
      ),
      body:   Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0,bottom: 10),
            child: Text('Choose Mode of Delivery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
         child: ListView.builder(
           itemCount: selectTypes.length,
           itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                 height: 90,
                 width: MediaQuery
                     .of(context)
                     .size
                     .width,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all(color: pickerPrimaryColor)
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         selectTypes[index],
                         style: const TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Container(
                         height: 60,
                         width: 60,
                         decoration: const BoxDecoration(
                           image: DecorationImage(
                               image: AssetImage('Assets/Images/round.png'), fit: BoxFit.fill),
                         ),
                         child: Center(child: Image.asset('Assets/Images/tick.png')),
                       ),
                      //Image.asset('Assets/Images/round.png')
                     ],
                   ),
                 ),
               ),
            );
           }
         ),
        ),
          const SizedBox(height: 20,),
          Positioned(
            bottom: 80,
              left: 60,
              right: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pickerPrimaryColor,
                  ),
                  onPressed: (){}, child: const Text('PROCEED',style: TextStyle(color: Colors.white),)))
        ],
      ),
    );
  }
}
