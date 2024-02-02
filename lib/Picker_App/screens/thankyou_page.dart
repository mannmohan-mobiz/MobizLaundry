import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/home_page_new.dart';
import 'package:intl/intl.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';

class ThankYouPageScreen extends StatefulWidget {
  final String ordId;
  final String cstId;
  const ThankYouPageScreen({super.key,required this.ordId,required this.cstId});

  @override
  State<ThankYouPageScreen> createState() => _ThankYouPageScreenState();
}

class _ThankYouPageScreenState extends State<ThankYouPageScreen> {
  @override
  Widget build(BuildContext context) {
    print('#####ORDERID###${widget.ordId}');
    print('#####CUSTID###${widget.cstId}');
    return  BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context)
    )..add(PckThankListFetchEvent(
        authData.user_token.toString(), widget.ordId.toString(),widget.cstId.toString(),)),
    child: Scaffold(
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
          'Order Confirmed',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Image.asset('Assets/Images/success.png'),
          ),
         // const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Hai!',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          //const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Thank You for the\npurchase from us',
              style: TextStyle(
                  color: pickerBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
          ),
          const SizedBox(height: 4,),
          BlocBuilder<PickerBloc, PickerState>(
  builder: (context, state) {
    if (state is PckThankyouFetchingState) {
      return const Center(
          child: CircularProgressIndicator(
            color: pickerGoldColor,
          ));
    } else if(state is PckThankyouFetchedState) {
      final data = state.thankYouDetail;
      return Expanded(
        child: Container(
          width: double.infinity,
          color: pickerWhiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Order Details',
                  style: TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                 RowItem(label: 'Date of purchase:',
                    value: DateFormat('dd-MM-yyyy').format(data!.orderDate),
                    fontSize: 12,
                    fontSizeValue: 12),
                 RowItem(label: 'Mode of Delivery:',
                    value: '${data?.orderType}',
                    fontSize: 12,
                    fontSizeValue: 12),
                 RowItem(label: 'Delivery date:',
                    value:  DateFormat('dd-MM-yyyy').format(data!.deliveryDate),
                    fontSize: 12,
                    fontSizeValue: 12),
                 // RowItem(label: 'Delivery time:',
                 //    value: '${data?.deliveryTime}',
                 //    fontSize: 12,
                 //    fontSizeValue: 12),
                 RowItem(label: 'Order Total:',
                    value: '${data?.totalAmount}',
                    fontSize: 12,
                    fontSizeValue: 12),
                 RowItem(label: 'Order No:',
                    value: '${data?.orderNumber}',
                    fontSize: 12,
                    fontSizeValue: 12),
                const SizedBox(height: 10,),
                 Text(
                  'Great news! Your order is confirmed with order id ${data?.orderNumber}. Sit back and relax as we handle the rest. Expect top-notch service and the convenience of doorstep pick-up. Your garments are in good hands. Thank you for choosing Golden Falcon Laundry!',
                  style: const TextStyle(
                      color: pickerBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                    backgroundColor: pickerWhiteColor,
                    side: const BorderSide(
                        color: pickerGoldColor, width: 1.0),),
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const HomePageNew())),
                  child: const Center(
                    child: Text(
                      'BACK TO HOME',
                      style: TextStyle(
                        color: pickerBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Center(child: Text(''));
    }
  },
)
        ],
      ),

    ),
);
  }
}
