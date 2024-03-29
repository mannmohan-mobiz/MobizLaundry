import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'item_list_page.dart';
import 'new_order_2_2.dart';

class SelectSubCategory extends StatefulWidget {
  final String ordId;
  final String categId;
  final String custId;
  final bool isFromCollItem;
  const SelectSubCategory({super.key,required this.categId,required this.ordId,required this.custId,this.isFromCollItem = false});

  @override
  State<SelectSubCategory> createState() => _SelectSubCategoryState();
}

class _SelectSubCategoryState extends State<SelectSubCategory> {
  @override
  Widget build(BuildContext context) {
    print('##CATEGORYID##${widget.categId}');
    print('##COLECTITEMS##${widget.isFromCollItem}');

    return  BlocProvider(
  create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
    ..add(PckSubCategoryFetchEvent(authData.user_token.toString(), widget.categId)),
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
          'Select Sub-Service',
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
                const Text('Select Desired Sub-Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pickerBlackColor)),
                const SizedBox(height: 12),
                const Text('Choose the Laundry Sub-Service, which you are interested in today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: pickerBlackColor)),
                const SizedBox(height: 28),
                BlocBuilder<PickerBloc, PickerState>(
            builder: (context, state) {
              if (state is PckSubCategoryFetchingState) {
                return const Center(child: CircularProgressIndicator(
                  color: pickerGoldColor,
                ));
              } else if (state is PckSubCategoryFetchedState) {

                return state.subCategList.isEmpty == true ? const Center(
                    child: Text("No Data")) : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: state.subCategList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    print(state.subCategList.length);
                    print('#SUBCATEGORYID#${state.subCategList[index].subCatId}');
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  ItemsListPage(isFromSelect: widget.isFromCollItem,ordIdd:widget.ordId, catId: widget.categId, subCatId: state.subCategList[index].subCatId,customId: widget.custId)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: pickerWhiteColor,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image.network(baseUrl+state.subCategList[index].subServiceMaster.subCatImage)),
                            const SizedBox(height: 8),
                            Text(state.subCategList[index].subServiceMaster.subCatName,
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
              } else {
                return const Center(child: Text("No Data!"),);
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
