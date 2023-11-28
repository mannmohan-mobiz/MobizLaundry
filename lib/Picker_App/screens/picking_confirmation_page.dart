import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class PickingConfirmationPage extends StatefulWidget {
  const PickingConfirmationPage({super.key});

  @override
  State<PickingConfirmationPage> createState() => _PickingConfirmationPageState();
}

class _PickingConfirmationPageState extends State<PickingConfirmationPage> {
  List<String> typeList = ['Normal','Express','Urgent'];
  List<Color> colorList = [pickerWhiteColor,pickerYellowTypeColor,pickerOrangeTypeColor];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 150.0,
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
        title: const Text('Pending Confirmation',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
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
            const Text('Pending for Confirmation',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.bold,fontSize: 18),),
             Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(color: pickerOrangeTypeColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: pickerWhiteColor)),
                child:   Center(
                    child: Column(
                      children: [
                        const RowItem( label: 'Customer name:',value: 'Jason Roy',),
                        const RowItem(label: 'Building Name/No:',value: '',),
                        const RowItem(label: 'Floor No:',value: '',),
                        const RowItem(label: 'Floor No/House No:',value: '',),
                        const RowItem(label: 'Mobile No:',value: '',),
                        const RowItem(label: 'Pickup time:',value: '7am to 9am',),
                        const Divider(
                          color: pickerWhiteColor,
                          thickness: 1,
                        ),
                        Container(
                          color: pickerWhiteColor,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text( 'saveLater', style: TextStyle(fontSize: 10, color: pickerBlackColor,  fontWeight: FontWeight.w500)),
                                    Container(width: 2, height: 20, color: pickerBlackColor),
                                    const Text( 'saveLater', style: TextStyle(fontSize: 10, color: pickerBlackColor,  fontWeight: FontWeight.w500)),
                                  ],
                                ),
                        )
                      ],
                    )),
              ),
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String label;
  final String value;
  const RowItem({super.key,required this.value,required this.label});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            // fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  value,
                  // fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              )),
        ],
      ),
    );
  }
}

