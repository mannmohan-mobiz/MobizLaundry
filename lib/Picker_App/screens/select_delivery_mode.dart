import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/select_delivery_time_page.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';
import '../util/common_methods.dart';

class SelectDeliveryMode extends StatefulWidget {
  const SelectDeliveryMode({super.key});

  @override
  State<SelectDeliveryMode> createState() => _SelectDeliveryModeState();
}

class _SelectDeliveryModeState extends State<SelectDeliveryMode> {


  List<String> selectModeList = ['Normal (Delivery with in 42 hrs)',
    'Express(Delivery with in 24 hrs)',
    'Urgent(Delivery within 8hrs)'];

  List<String> modeSurchargeData = ['',
  '50% surcharge will apply',
    '100% surcharge will apply'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:  pickerBackgroundColor,
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
          'Delivery Modes',
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
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose Mode of Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                const SizedBox(height: 12),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: selectModeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          //height: 59,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(34),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment : CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          selectModeList[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 13, color: pickerTextColor, fontWeight: FontWeight.w600),
                                        ),
                                        modeSurchargeData[index] == '' ? const SizedBox() : Text(
                                          modeSurchargeData[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 13, color: pickerGoldColor, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const CircleAvatar(
                                    backgroundColor: pickerGoldColor,
                                    child: Icon(Icons.check_rounded, color: Colors.white),
                                  )
                                ],
                              ),
                            )
                        ),
                      );
                    }
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectDeliveryTimePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerGoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(fontSize: 16.0, color:pickerWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
