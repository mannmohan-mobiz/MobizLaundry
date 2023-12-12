import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/search_widget.dart';

class NewOrderSearchPage extends StatefulWidget {
  const NewOrderSearchPage({super.key});

  @override
  State<NewOrderSearchPage> createState() => _NewOrderSearchPageState();
}

class _NewOrderSearchPageState extends State<NewOrderSearchPage> {
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
          'Confirmed Orders',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
           children:  [
             SearchWidget(
               hintText: 'Customer Id/phone',
               searchCtrl: TextEditingController(),
               //onChanged: (String myString){},
             ),
             ListView.builder(
               shrinkWrap: true,
               itemCount: 3,
               physics: const BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
               itemBuilder: (itemBuilder, index) =>
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                     margin: const EdgeInsets.symmetric(vertical: 18),
                     decoration: BoxDecoration(
                         color: pickerWhiteColor,
                         borderRadius:  BorderRadius.circular(12),
                         border: Border.all(color: pickerWhiteColor),
                         boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
                     ),
                     child:  Column(
                       children: [
                         const RowItem( label: 'Customer name:',value: 'Jason Roy',),
                         const RowItem( label: 'Customer type:',value: 'Home',),
                         const RowItem(label: 'Building Name/No:',value: '',),
                         const RowItem(label: 'Floor No:',value: '',),
                         const RowItem(label: 'House No:',value: '',),
                         const RowItem(label: 'Mobile No:',value: '',),
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(9),
                             ),
                             side: const BorderSide(color: pickerGoldColor, width: 2.0),
                           ),
                           onPressed: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpensePage()));
                           },
                           child: const Text('CREATE NEW ORDER',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 15),),),


                       ],
                     ),
                   ),
             ),


           ],
        ),
      ),
    );
  }
}
