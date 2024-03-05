import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';

class CreateClientTextFormField extends StatelessWidget {
  final TextEditingController getController;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  const CreateClientTextFormField({super.key,required this.getController,this.suffixIcon, required this.labelText,  this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: getController,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: pickerBlackColor, fontSize: 15, fontWeight: FontWeight.w400),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: pickerBlackColor, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
