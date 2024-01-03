import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/AuthModel/auth_model.dart';
import '../src/colors.dart';
import '../util/client_textform_field_page.dart';
import '../util/common_methods.dart';

class CreateClientPage extends StatefulWidget {
  const CreateClientPage({super.key});

  @override
  State<CreateClientPage> createState() => _CreateClientPageState();
}

class _CreateClientPageState extends State<CreateClientPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController buildController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController altController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController credLmtController = TextEditingController();
  TextEditingController credDaysController = TextEditingController();
  TextEditingController credInvController = TextEditingController();

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
          'Create Client',
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
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: ListView(
          shrinkWrap: true,
          children: [
            CreateClientTextFormField(
                getController:nameController,
               labelText: 'Name',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:userNameController,
              labelText: 'Username',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:emailController,
              labelText: 'Email',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:passwordController,
              labelText: 'Password',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:buildController,
              labelText: 'Building.No',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:roomController,
              labelText: 'Room No',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:mobileController,
              labelText: 'Mobile',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:altController,
              labelText: 'Alt.Mobile',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:whatsappController,
              labelText: 'WhatsApp',
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (){
                },
                child: const Text('Activate GPS',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            ),
            const SizedBox(height: 16,),
            const Text(
              'Account Details',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Home'),
                      leading:    Radio(
                        onChanged: (int? value) {
                          debugPrint('### value --- $value');
                          setState(() {
                          });
                        },
                        value: 1,
                        visualDensity: const VisualDensity(
                            horizontal: -4, vertical: 0),
                        activeColor: pickerGoldColor,
                        groupValue: 1,
                      ),
                    //   leading: Radio<CustomerType>(
                    //       value: CustomerType.Home,
                    //     groupValue: _animal,
                    // onChanged: (CustomerType? value) {
                    //       setState(() {
                    //         _animal = value;
                    //         custmType = "Home";
                    //       });
                    //       debugPrint(_animal!.name);
                    //     },
                    //   ),
                    )),
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: const Text('Corporate'),
                    leading:    Radio(
                      onChanged: (int? value) {
                        debugPrint('### value --- $value');
                        setState(() {
                        });
                      },
                      value: 1,
                      visualDensity: const VisualDensity(
                          horizontal: -4, vertical: 0),
                      activeColor: pickerGoldColor,
                      groupValue: 1,
                    ),

                    // leading: Radio<CustomerType>(
                    //   value: CustomerType.Corporate,
                    //   groupValue: _animal,
                    //   onChanged: (CustomerType? value) {
                    //     setState(() {
                    //       _animal = value;
                    //       custmType = "Corporate";
                    //     });
                    //     debugPrint(_animal!.name);
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:credLmtController,
              labelText: 'Credit Limit',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:credDaysController,
              labelText: 'Credit Days',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:credInvController,
              labelText: 'Credit Invoice',
            ),
            const SizedBox(height: 16,),
            CreateClientTextFormField(
              getController:credLmtController,
              labelText: 'Select Group',
              suffixIcon: const Icon(Icons.arrow_drop_down,color: pickerGoldColor,),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pickerGoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (){
                },
                child: const Text('Add Data',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            ),

          ],
        ),
      ),
    );
  }
}
