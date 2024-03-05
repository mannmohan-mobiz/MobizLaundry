import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/personal_screen.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import 'corporate_screen.dart';

class ChooseAccountType extends StatefulWidget {
  const ChooseAccountType({super.key});

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  int selectedIndex = -1;
  List<String> imagesList = ["Assets/Images/personal.png", "Assets/Images/corporate.png"];

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
        title: const Text('Choose account type',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24, // Horizontal spacing between items
                    mainAxisSpacing: 30, // Vertical spacing between items
                  ),
                  itemCount: 2, // Number of items in the grid
                  shrinkWrap: true, // Allow the GridView to fit its content
                  physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Update the selected index when an item is tapped
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AccountTypeContainer(
                        imagePath: imagesList[index],
                        title: index == 0 ? 'Personal' : 'Corporate',
                        isSelected: selectedIndex == index, // Check if the item is selected
                      ),
                    );
                  },
                ),
                const SizedBox(height: 38),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedIndex == 0) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonalScreen()));
                      } else if (selectedIndex == 1) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CorporateScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerGoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('Continue'.toUpperCase(),
                      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class AccountTypeContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;

  AccountTypeContainer({
    required this.imagePath,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138, width: 138,
      decoration: BoxDecoration(
        color: isSelected ? pickerGoldColor : Colors.white, // Change background color when selected
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
              child: Image.asset(imagePath),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF99A4AA),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
