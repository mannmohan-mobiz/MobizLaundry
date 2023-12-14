import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/select_sub_category.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<String> serviceList = [
    "Assets/Images/service_1.png",
    "Assets/Images/service_2.png",
    "Assets/Images/service_3.png",
    "Assets/Images/service_4.png",
    "Assets/Images/service_5.png",
    "Assets/Images/service_6.png"];

  List<String> serviceName = [
    "Wash & Fold",
    "Wash & Hang",
    "Dry Cleaning",
    "Curtain Cleaning",
    "Carpet Cleaning",
    "Other Services"];
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
            'Select Service',
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
        body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Desired Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                  const SizedBox(height: 12),
                  const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: pickerBlackColor)),
                  const SizedBox(height: 28),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: serviceList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectSubCategory()));
                            //selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: pickerWhiteColor,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Image.asset(serviceList[index])),
                              const SizedBox(height: 8),
                              Text(serviceName[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: pickerTextColor, height: 1.2)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
        ),
    );
  }
}
