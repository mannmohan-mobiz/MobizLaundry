import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/select_sub_category.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';

class SelectCategory extends StatefulWidget {
 final String orderID;
 final String customerID;
 final bool isFromCollect;
  const SelectCategory({super.key,required this.orderID,required this.customerID,this.isFromCollect = false,});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {

  @override
  Widget build(BuildContext context) {
    print('######ORDERID#${widget.orderID}');
    print('######CUSTOMERID#${widget.customerID}');
    print('######COLLECT#${widget.isFromCollect}');

    return  BlocProvider(
    create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context),)
      ..add(PckCategoryFetchEvent(authData.user_token.toString(), authData.user_id.toString())),
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
            'Select Service',
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
        body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Desired Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                  const SizedBox(height: 12),
                  const Text('Choose the Laundry Services, which you are interested in today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: pickerBlackColor)),
                  const SizedBox(height: 28),
                  BlocBuilder<PickerBloc, PickerState>(
              builder: (context, state) {
                if (state is PckCategoryFetchingState) {
                  print(state.toString());
                  return const Center(
                      child: CircularProgressIndicator(
                    color: pickerGoldColor,
                  ));
                } else if (state is PckCategoryFetchedState) {
                  return state.categList.isEmpty == true ? const Center(
                      child: Text("No Data")) : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: state.categList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          authData.setCatId(state.categList[index].categoryId);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  SelectSubCategory(ordId: widget.orderID,
                                      categId: state.categList[index]
                                          .categoryId,
                                      custId: widget.customerID,
                                      isFromCollItem : widget.isFromCollect
                                  )));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: pickerWhiteColor,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Image.network(baseUrl +
                                  state.categList[index].serviceMaster
                                      .categoryImage, fit: BoxFit.fill,)),
                              const SizedBox(height: 8),
                              Text((state.categList[index].serviceMaster
                                  .categoryName),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: pickerTextColor,
                                      height: 1.2)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else{
                  return const Center(child: Text("No Data"),);
                }
  },
),
                ],
              ),
            )
        ),
    ),
);
  }
}
