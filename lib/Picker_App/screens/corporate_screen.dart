import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'add_picking_address_page.dart';

class CorporateScreen extends StatefulWidget {
  const CorporateScreen({super.key});

  @override
  State<CorporateScreen> createState() => _CorporateScreenState();
}

class _CorporateScreenState extends State<CorporateScreen> {

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController trnNoController = TextEditingController();
  final TextEditingController billingAddressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController emailRegController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
   create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context)),
     //..add(GetCorporateSaveEvent()),
   child: BlocBuilder<PickerBloc, PickerState>(
   builder: (context, state) {
     if (state is CorporateSaveFetching) {
       return Container(color: Colors.white, child: const Center(child: CircularProgressIndicator()));
     } else if (state is CorporateSaveError){
       return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: pickerBlackColor, fontWeight: FontWeight.w600))));
     }
    return Scaffold(
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
        title: const Text('Corporate',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PickerRegisterTextFormField(
                  getController: companyNameController,
                  labelText: 'Company Name',
                  imagePaths: 'Assets/Images/build_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: trnNoController,
                    labelText: 'TRN',
                    imagePaths: 'Assets/Images/trn_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: billingAddressController,
                  labelText: 'Billing Address',
                  imagePaths: 'Assets/Images/billing_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: mobileController,
                    labelText: 'Phone Number',
                    imagePaths: 'Assets/Images/mob_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: emailIDController,
                  labelText: 'Email Id',
                  imagePaths: 'Assets/Images/email_icon.png',
                ),
                const SizedBox(height: 26),
                const Divider(
                  color: pickerBlackColor,
                ),
                const SizedBox(height: 12),
                const Text('Registrant Details', style: TextStyle(color: pickerBlackColor, fontSize: 16, fontWeight: FontWeight.w600),),
                const SizedBox(height: 20),
                PickerRegisterTextFormField(
                  getController: nameController,
                  labelText: 'Name',
                  imagePaths: 'Assets/Images/user_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: altMobileController,
                    labelText: 'Phone Number',
                    imagePaths: 'Assets/Images/mob_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: designationController,
                  labelText: 'Designation',
                  imagePaths: 'Assets/Images/desig_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: emailRegController,
                  labelText: 'Email Id',
                  imagePaths: 'Assets/Images/email_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: whatsAppController,
                    labelText: 'Whatsapp No:',
                    imagePaths: 'Assets/Images/whatsapp_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: altMobileController,
                  labelText: 'User Name',
                  imagePaths: 'Assets/Images/user_name.png',
                  keyboardType: TextInputType.none,
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: passwordController,
                  labelText: 'Password',
                  imagePaths: 'Assets/Images/pswrd_icon.png',
                  obscureText: isVisible ? false : true,
                  suffixIcon:  IconButton(onPressed: (){
                    if (isVisible) {
                      setState(() {
                        isVisible = false;
                      });
                    } else {
                      setState(() {
                        isVisible = true;
                      });
                    }
                  }, icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    color: pickerGoldColor,
                  ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (companyNameController.text.isEmpty) {
                        snackBar(context, message: 'Please enter company name');
                      } else if (trnNoController.text.isEmpty) {
                        snackBar(context, message: 'Please enter trn number');
                      } else if (trnNoController.text.length != 15) {
                        snackBar(context, message: 'Please enter valid trn number');
                      } else if (billingAddressController.text.isEmpty) {
                        snackBar(context, message: 'Please enter billing address');
                      } else if (mobileController.text.isEmpty) {
                        snackBar(context, message: 'Please enter phone number');
                      } else if (mobileController.text.length != 10) {
                        snackBar(context, message: 'Please enter valid phone number');
                      } else if (emailIDController.text.isEmpty) {
                        snackBar(context, message: 'Please enter email id');
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailIDController.text) &&
                          emailIDController.text.endsWith('.com')) {
                        snackBar(context, message: 'Please enter valid email id');
                      } else if (nameController.text.isEmpty) {
                        snackBar(context, message: 'Please enter name');
                      } else if (altMobileController.text.isEmpty) {
                        snackBar(context, message: 'Please enter phone number');
                      } else if (altMobileController.text.length != 10) {
                        snackBar(context, message: 'Please enter valid phone number');
                      } else if (designationController.text.isEmpty) {
                        snackBar(context, message: 'Please enter designation');
                      } else if (emailRegController.text.isEmpty) {
                        snackBar(context, message: 'Please enter email id');
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailIDController.text) &&
                          emailRegController.text.endsWith('.com')) {
                        snackBar(context, message: 'Please enter valid email id');
                      } else if (whatsAppController.text.isEmpty) {
                        snackBar(context, message: 'Please enter whats app number');
                      } else if (whatsAppController.text.length != 10) {
                        snackBar(context, message: 'Please enter valid whats app number');
                      } else if (passwordController.text.isEmpty) {
                        snackBar(context, message: 'Please enter password');
                      }
                      else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)
                        => AddPickingAddressPage(
                            companyName: companyNameController.text,
                            trn: trnNoController.text,
                            billingAddress: billingAddressController.text,
                            customerType: 'Co-operate',
                            mobileNumber: int.parse(mobileController.text),
                            emailId: emailIDController.text,
                            name: nameController.text,
                            altMobile: int.parse(altMobileController.text),
                            designation: designationController.text,
                            altEmail: emailRegController.text,
                            whatsApp: int.parse(whatsAppController.text),
                            userName: altMobileController.text,
                            password: passwordController.text
                        )
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerGoldColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('ADD PICKING ADDRESS',
                      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
