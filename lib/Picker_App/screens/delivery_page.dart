import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  List<String> typeList = ['Normal','Express','Urgent'];
  List<Color> colorList = [pickerGreyTypeColor,pickerYellowTypeColor,pickerOrangeTypeColor];
  List<Color> colorListSub = [pickerOrangeTypeColor,pickerYellowTypeColor,pickerGreyTypeColor];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
            onPressed: () {
              close(context);
            },
            icon: Image.asset('Assets/Images/back_arrow.png')
        ),
        title: const Text('Delivery',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) =>
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Container(
                                  decoration:  BoxDecoration(
                                    color: colorList[index],
                                    border: Border.all(color: pickerGoldColor),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Text(typeList[index],style: const TextStyle(color: pickerBlackColor,fontWeight: FontWeight.bold,fontSize: 10),),
                          ],
                        ),
                  ),
                )
              ],
            ),
            const Text('Out for Delivery(3 items)',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.bold,fontSize: 18),),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius:  BorderRadius.circular(12),
                        border: Border.all(color: pickerWhiteColor),
                        boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
                    ),
                    child:   ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          decoration:  BoxDecoration(
                            color: colorListSub[index],
                            borderRadius: const BorderRadius.only( topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),),
                          ),
                          child: const Column(
                            children: [
                              RowItem( label: 'Customer name:',value: 'Jason Roy',),
                              RowItem(label: 'Building Name/No:',value: '',),
                              RowItem(label: 'Floor No:',value: '',),
                              RowItem(label: 'Room No/House No:',value: '',),
                              RowItem(label: 'Mobile No:',value: '',),
                              RowItem(label: 'Pickup time:',value: '7am to 9am',isShow: true,),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: const Text( 'Deliver', style: TextStyle(fontSize: 14, color: pickerBlackColor,  fontWeight: FontWeight.w600)),
                                onTap: () {
                                  //showConfirmDialog();
                                },
                              ),
                              Container(width: 2, height: 20, color: pickerVerticalDividerColor),
                              const Text( 'Door Lock', style: TextStyle(fontSize: 14, color: pickerBlackColor,  fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
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
