import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';

class SearchWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController searchCtrl;
  final String hintText;
  const SearchWidget({super.key,this.onChanged,
    this.hintText = 'Search',
    required this.searchCtrl,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: pickerWhiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: pickerWhiteColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Set the shadow color
            spreadRadius: 2, // Set the spread radius
            blurRadius: 5, // Set the blur radius
            offset: Offset(0, 3), // Set the offset
          ),
        ],
      ),
      child: TextField(
        controller: searchCtrl,
        onChanged: onChanged,
        decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: pickerHintTextColor, fontSize: 14),
          suffixIcon: Image.asset('Assets/Images/search.png'),
          border: InputBorder.none,
        ),
      ),


    );
  }
}
