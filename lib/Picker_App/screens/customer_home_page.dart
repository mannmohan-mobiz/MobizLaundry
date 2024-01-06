import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_falcon/Picker_App/screens/statemnt_account_page.dart';
import 'package:golden_falcon/Picker_App/screens/wallet_page.dart';

import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/customer_divider.dart';
import '../util/row_item.dart';
import '../util/table_row.dart';

class CustomerHomePageScreen extends StatefulWidget {
  const CustomerHomePageScreen({super.key});

  @override
  State<CustomerHomePageScreen> createState() => _CustomerHomePageScreenState();
}

class _CustomerHomePageScreenState extends State<CustomerHomePageScreen> {
  List<String> buttonText1 = [
    'Edit Client',
    'New Order',
    'Order History',
    'Add to Wallet',
    'Complaint',
    'New Bag Orders'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Customer Home',
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
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
              child: Column(
                children:   [
                  const RowItem( label: 'Name:',value: '',),
                  const RowItem( label: 'Address:',value: '',),
                  const RowItem( label: 'Birth day:',value: '',),
                  const RowItem( label: 'Mobile Number:',value: '',),
                  const RowItem( label: 'Email Id:',value: '',),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerWidget(count: '100',text:'Current Outstanding' ),
                      ContainerWidget(count: '150', text:'Wallet Balance'),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    itemCount: buttonText1.length,
                    itemBuilder: (context, index) => Center(
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6), // <-- Radius
                          ),
                          backgroundColor: pickerGoldColor,
                          fixedSize: const Size(150, 50),
                          side: const BorderSide(color: pickerWhiteColor, width: 2.0),
                        ),
                        onPressed: () => onButtonTap(index, context),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 2.0, bottom: 2, right: 0),
                          child: Text(
                            buttonText1[index],
                            style: const TextStyle(
                                color: pickerWhiteColor, fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6), // <-- Radius
                          ),
                          backgroundColor: pickerWhiteColor,
                          side: const BorderSide(color: pickerGoldColor, width: 1.0),
                        ),
                        onPressed: () {},
                        child: const Center(
                          child: Text(
                            'Door Lock',
                            style: TextStyle(
                                color: pickerGoldColor, fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6), // <-- Radius
                          ),
                          backgroundColor: pickerWhiteColor,
                          side: const BorderSide(color: pickerGoldColor, width: 1.0),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const StatementOfAccountPage()));
                        },
                        child: const Center(
                          child: Text(
                            'Statement of account',
                            style: TextStyle(
                                color: pickerGoldColor, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('Today\'s Delivery'),),
                      Tab(child: Text('Pending Orders'),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ],
                  ),
                  ),
                  ];
                },
                    body: TabBarView(
                      children: [
                        ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (itemBuilder, index) =>
                      Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(color: pickerWhiteColor, borderRadius: BorderRadius.circular(12)),
                            child:   Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Order Number',value:  'SCVG78952',),
                                ),
                                const Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Inv No',value:  'INX89079',),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'No of items',value:  '5',),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Order Date',value:  '12.12.2025',),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Invoice Date',value:  '12.12.2025',),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Type of laundry',value:  'Sub Category/Category',),
                                ),
                                const MySeparator(color: pickerDividerColor,height: 2),
                                const SizedBox(height: 5,),
                                const Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Total Amount',value:  'AED***',),
                                ),
                                const SizedBox(height: 5,),
                                const MySeparator(color: pickerDividerColor,height: 2),
                                const SizedBox(height: 3,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'Amount Paid',
                                      style: TextStyle(
                                        color: pickerBlackColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 84,
                                        height: 46,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: pickerBackgroundColor
                                        ),
                                        child:  const Center(
                                          child: Text(
                                            'AED***',
                                            style: TextStyle(
                                              color: pickerBlackColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                const MySeparator(color: pickerDividerColor,height: 2),
                                const SizedBox(height: 3,),
                                const Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Balance Amount',value:  'AED***',),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6), // <-- Radius
                                    ),
                                    backgroundColor: pickerWhiteColor,
                                    side: const BorderSide(color: pickerGoldColor, width: 1.0),
                                  ),
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text(
                                      'Update Delivery',
                                      style: TextStyle(
                                          color: pickerGoldColor, fontSize: 13),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (itemBuilder, index) =>
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(color: pickerWhiteColor, borderRadius: BorderRadius.circular(12)),
                            child:   const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Order Number',value:  'PCVG78952',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Inv No',value:  'PNX89079',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'No of items',value:  '5',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Order Date',value:  '12.12.2025',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Invoice Date',value:  '12.12.2025',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Type of laundry',value:  'Sub Category/Category',colorValue: pickerGoldColor),
                                ),
                                Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TableWidget(text: 'Current Status',value:  'Pending',colorValue: pickerDarRedColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
            ),
          ),
        )
    );
  }

  onButtonTap(int index, BuildContext context) {
     switch (index) {
    //   case 0:
    //     open(context, const NewOrderSearchPage());
    //     break;
    //   case 1:
    //     open(context, const DeliveryPage());
    //     break;
      case 3:
        open(context, const WalletNewPage());
        break;
    //   case 5:
    //     open(context, const UnDeliveredPage());
      //  break;
    }
  }
}


class ContainerWidget extends StatelessWidget {
  final String count;
  final String text;
  const ContainerWidget({super.key,this.count = '',this.text = ''});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: pickerWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: pickerGoldColor)),
      child:  Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            thickness: 2,
            color: pickerGoldColor,
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: pickerBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
  }

