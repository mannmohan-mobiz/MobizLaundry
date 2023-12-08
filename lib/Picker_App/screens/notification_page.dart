import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
        title: const Text('Notifications',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView.separated(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
        Card(
            child: Container(
              decoration: BoxDecoration(
                color: pickerWhiteColor,
                border: Border.all(color: pickerGoldColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child:   Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('19-11-2023 10.00AM',style: TextStyle(color: pickerGoldColor,fontSize: 12),textAlign: TextAlign.start,),
                        InkWell(
                          onTap: () =>  showDeleteDialog(),
                            child: Image.asset('Assets/Images/delete_icon.png',height: 20,))
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text('AED 20 Received',style: TextStyle(color: pickerBlackColor,fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    const Text('Loreum Ipsum simply dummy text',style: TextStyle(color: pickerSubTextColor,fontSize: 12),textAlign: TextAlign.start,),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context,
              int index) => const SizedBox(height: 10),
        )
      ),
    );
  }

  showDeleteDialog(){
    return showDialog(
        context: context,
        builder: (mContext) =>  AlertDialog(
          backgroundColor: pickerWhiteColor,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(12),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('Assets/Images/not_confirm.png'),
                const Text(
                  'Do you really want to delete this Notification ?',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(onPressed: (){
                          close(context);
                        },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: pickerGoldColor, width: 2.0),
                          ),
                          child: const Text(
                            'No',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                          ),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pickerGoldColor,
                          ),
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: pickerWhiteColor,fontSize: 16,fontWeight: FontWeight.w600),
                          ),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
