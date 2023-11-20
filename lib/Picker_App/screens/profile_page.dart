import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pickerPrimaryColor,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: const BottomDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
        child: Container(
          width: size.width,
          color: Colors.white,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                    color: pickerPrimaryColor,
                    shape: BoxShape.circle
                ),
                // child: Image.asset(''),
              ),
              const Text(
                'Name',
                style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const RowItem(nameList: 'Name:',value: 'Test',),
              const RowItem(nameList: 'Name:',value: 'Test',),
              const RowItem(nameList: 'Name:',value: 'Test',),
              const RowItem(nameList: 'Name:',value: 'Test',),
              Padding(
                padding: const EdgeInsets.all(30),
                child: InkWell(onTap: () {},
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: pickerPrimaryColor,
                    ),
                    child: const Center(
                      child: Text('Update',style: TextStyle(color: Colors.white,
                          fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String nameList;
  final String value;
  const RowItem({super.key,required this.nameList,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: Row(
            children: [
              Text(
                nameList,
                style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
               Text(
                value,
                style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],

      ),
    );
  }
}
