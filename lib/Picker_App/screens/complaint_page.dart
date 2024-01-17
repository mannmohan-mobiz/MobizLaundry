import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/util/table_row.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import 'add_complaint_detail_page.dart';
import 'complaint_detail_page.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
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
    title: const Text('Complaints',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
    actions: [
    Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Image.asset('Assets/Images/notification_icon.png'),
    )
    ],
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddComplaintDetailPage()),
                      );
                    },
                    child: Container(
                      height:  MediaQuery.of(context).size.height * 0.24,
                      width:MediaQuery.of(context).size.width *  0.5,
                      decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,top: 25,bottom: 5),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: pickerBackgroundColor
                              ),
                              child: Center(child: Image.asset('Assets/Images/add.png')),
                            ),
                            const SizedBox(height: 5,),
                            const Text('Add New',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w600,fontSize: 13),),
                            const SizedBox(height: 10,),
                            const Text('Add a new complaint here and send directly to us.',style: TextStyle(color: pickerTextColor,fontWeight: FontWeight.w400,fontSize: 13),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    height:  MediaQuery.of(context).size.height * 0.24,
                    width:MediaQuery.of(context).size.width *  0.5,
                    decoration: BoxDecoration(
                      color: pickerWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(left: 10.0,right: 10,top: 30,bottom: 5),
                      child: Column(
                        children: [
                          Text('2',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w800,fontSize: 30),),
                          SizedBox(height: 15,),
                          Text('Complaints',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w600,fontSize: 13),),
                          SizedBox(height: 10,),
                          Text('These are the complaints which are already been registered.',style: TextStyle(color: pickerTextColor,fontWeight: FontWeight.w400,fontSize: 13),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: pickerWhiteColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (itemBuilder, index) =>
               ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Complaint heading',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ComplaintDetailsPage()));
                            },
                              child: Image.asset('Assets/Images/for_arrow.png'))
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const TableWidget(text: 'Date', value: '1.3.2023',colorValue: pickerGoldColor),
                      const TableWidget(text: 'Complaint No', value: 'NXT5689715',colorValue: pickerGoldColor),
                      const TableWidget(text: 'Type', value: 'Delayed Delivery',colorValue: pickerGoldColor),
                      const TableWidget(text: 'Status', value: 'Pending',colorValue: pickerGoldColor),
                      const TableWidget(text: 'Remark', value: 'Nil',colorValue: pickerGoldColor),
                      const Divider(color: pickerDivColor,)

                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),

    );
  }
}
