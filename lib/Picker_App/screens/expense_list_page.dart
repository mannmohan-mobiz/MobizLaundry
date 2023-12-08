import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/table_row.dart';
import 'add_expense_page.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
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
        title: const Text('Expenses',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Text('Showing all your expenses',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),),
            const SizedBox(height: 8,),
            const Row(
              children: [
                Row(
                  children: [
                    Text(
                      'From',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      '01.12.2023',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Text(
                      'To',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      '05.12.2023',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Text(
                  'Total Amount',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w400,fontSize: 15),
                ),
                const SizedBox(width: 15,),
                Container(
                  width: 110,
                  height: 38,
                  decoration: BoxDecoration(
                    color: pickerWhiteColor,
                    border: Border.all(color: pickerGoldColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:const Center(
                    child: Text(
                      'AED 300',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.w700,fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pickerGoldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpensePage()));
              },
              child: const Text('ADD EXPENSE',style: TextStyle(color: pickerWhiteColor,fontWeight: FontWeight.w500,fontSize: 15),),),
            const SizedBox(height: 15,),
            Container(
              decoration:  BoxDecoration(
              color: pickerWhiteColor,borderRadius: BorderRadius.circular(12),
              ),
              child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children:  [
                        const TableWidget(text: 'Expense type',colorText: pickerGoldColor,value: 'Amount',colorValue: pickerGoldColor,),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 15,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (itemBuilder, index) =>

                            const TableWidget(text: 'Expense 1',value: '5 AED'),

                        ),
                      ],
                    ),
                  ),
            )


          ],
        ),
      ),
    );
  }
}
