
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/src/colors.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../screens/home_page_new.dart';
import '../screens/homepage.dart';

class BottomNavigation extends StatefulWidget {

  const BottomNavigation(
     {
        Key? key,
      }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: pickerWhiteColor,
      iconSize: 20,
      currentIndex: _currentIndex,
      showUnselectedLabels: true,
      unselectedItemColor: pickerBlackColor,
      selectedItemColor: pickerWhiteColor,
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
      ),
      onTap: (int index) {
        debugPrint('index $index');
        setState(() {
          _currentIndex = index;
        });
       // context.read<MainCubit>().changeIndex(index);
      },
      items:  <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           icon: Image.asset('Assets/Images/home.png'),
          label: 'Home',
       activeIcon: InkWell(
         onTap:  ()=> Navigator.push(context,
             MaterialPageRoute(builder:
                 (context) =>  const HomePageNew(),
             )),
         child: Container(
            decoration: const BoxDecoration(
            color: pickerGoldColor,
            shape: BoxShape.circle
            ),
            child: Padding(
            padding: const EdgeInsets.all(8),
            child:Image.asset('Assets/Images/unfill_home.png'),
            )
            ),
       ),
        ),
              BottomNavigationBarItem(
          icon: Image.asset('Assets/Images/contact_us.png'),
          label: 'Contact Us',
                activeIcon: Container(
                    decoration: const BoxDecoration(
                        color: pickerGoldColor,
                        shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child:Image.asset('Assets/Images/unfill_contact_us.png'),
                    )
                ),

                ),
        BottomNavigationBarItem(
          icon: Image.asset('Assets/Images/exit.png'),
          label: 'Exit',
          activeIcon: Container(
              decoration: const BoxDecoration(
                  color: pickerGoldColor,
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child:Image.asset('Assets/Images/unfill_exit.png'),
              )
          ),
        ),
      ],
    );
  }
}