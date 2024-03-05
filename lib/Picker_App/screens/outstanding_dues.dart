import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/column_item.dart';
import '../util/common_methods.dart';
import '../util/row_item.dart';
import '../util/row_value.dart';
import 'customer_home_page.dart';

class OutStandingDuesPage extends StatefulWidget {
  const OutStandingDuesPage({super.key});

  @override
  State<OutStandingDuesPage> createState() => _OutStandingDuesPageState();
}

class _OutStandingDuesPageState extends State<OutStandingDuesPage> {
  @override
  Widget build(BuildContext context) {
      return  BlocProvider(
      create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
        ..add(PickupOutStandingFetchEvent(authData.user_token.toString())),
      child: Scaffold(
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
          title: const Text('OutStanding Dues',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        body: BlocBuilder<PickerBloc, PickerState>(
        builder: (context, state) {
    if (state is PickupOutStandingFetching) {
    return const Center(child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    } else if (state is PickupOutStandingFetched) {
      final tData = state.pickerOutStandingList;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Text('Your Overall due', style: TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.w300,
                fontSize: 14),),
            const SizedBox(height: 8,),
             Text('AED ${tData.overallDue}', style: const TextStyle(color: pickerBlackColor,
                fontWeight: FontWeight.w400,
                fontSize: 20),),
            const Text('Customer List', style: TextStyle(
                color: pickerBlackColor,
                fontWeight: FontWeight.w300,
                fontSize: 14),),
            const SizedBox(height: 15,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tData.pendingAmout.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (itemBuilder, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          color: pickerWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('Assets/Images/profile_icon.png'),
                                  const SizedBox(width: 10,),
                                   Text(tData.pendingAmout[index].customerName, style: const TextStyle(
                                      color: pickerBlackColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),),
                                ],
                              ),
                               RowValue(
                                label: 'Number of pending Invoices',
                                labelValue: '${tData.pendingAmout[index].pendingInvoices}',
                                labelValueColor: pickerBlackColor,),
                               RowValue(label: 'Total pending amount',
                                labelValue: 'AED ${tData.pendingAmout[index].totalShortSum}',
                                labelValueColor: pickerBlackColor,),
                              const Divider(color: pickerGreyColor,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  ColumItem(
                                      image: 'Assets/Images/home_img.png',
                                      height: 25,
                                      label: 'Customer Home',
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (
                                            context) =>  CustomerHomePageScreen(custId:tData.pendingAmout[index].customerId)),
                                      );
                                    },
                                  ),
                                  ColumItem(image: 'Assets/Images/nav_icon.png',
                                      label: 'Navigate',
                                    onTap: () async {
                                      // Uri googleUrl = Uri.parse(
                                      //     'https://www.google.com/maps/search/?api=1&query=${'${tData.pendingAmout[index].gpse},${tData.pendingAmout[index].gpsn}'}');
                                      // if (await canLaunchUrl(googleUrl)) {
                                      // await launchUrl(googleUrl);
                                      // } else {
                                      // throw 'Could not open the map';
                                      // }
                                    },
                                  ),
                                  ColumItem(
                                      image: 'Assets/Images/call_icon.png',
                                      label: 'Call',
                                    onTap: (){
                                      openDialer(tData.pendingAmout[index].mobileNumber);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            )
          ],
        ),
      );
    } else {
      return const Center(child: Text("No Data!"),);
    }
  },
),
      ),
);
  }
}
