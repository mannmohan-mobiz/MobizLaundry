import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/area_list_model.dart';
import '../../Models/PickerModel/emirates_list_model.dart';
import '../../Models/PickerModel/location_list_model.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'home_page_new.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final TextEditingController emiratesController = TextEditingController();
  final TextEditingController emiratesIDController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController areaIDController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationIDController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController buildingNoController = TextEditingController();
  final TextEditingController buildingAddressController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  final TextEditingController flatNoController = TextEditingController();
  final TextEditingController trnNoController = TextEditingController();
  final TextEditingController locationNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController creditLimitController = TextEditingController();
  final TextEditingController creditDaysController = TextEditingController();
  final TextEditingController creditInvoicesController = TextEditingController();
  final TextEditingController gpseController = TextEditingController();
  final TextEditingController gpsnController = TextEditingController();
  final TextEditingController gpsLatitudeController = TextEditingController();
  final TextEditingController gpsLongitudeController = TextEditingController();
  Position? currentPosition;
  var emirateResponse;
  var areaResponse;
  var locationResponse;
  var personalSaveResponse;
  bool isFetchingGPS = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => PickerBloc(RepositoryProvider.of<PickerRepository>(context))
        ..add(GetEmiratesEvent()),
       child: BlocBuilder<PickerBloc, PickerState>(
    builder: (context, state) {
      print('state2222 ${state}');
      if (state is EmiratesFetching || state is AreaFetching || state is LocationFetching || state is PersonalSaveFetching) {
        return Container(color: Colors.white, child: const Center(child: CircularProgressIndicator()));
      }
      else if (state is EmiratesFetched) {
        emirateResponse = state.emiratesData;
      }
      else if (state is AreaFetched) {
        areaResponse = state.areaData;
      }
      else if (state is LocationFetched) {
        locationResponse = state.locationData;
      }
      else if (state is PersonalSaveFetched) {
        personalSaveResponse = state.personalSaveData;
      }
      else {
        return Container(color: Colors.white, child: const Center(child: Text('No Data', style: TextStyle(fontSize: 14.0, color: pickerBlackColor, fontWeight: FontWeight.w600))));
      }
    return Scaffold(
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
        title: const Text('Personal',style: TextStyle(color: pickerGoldColor,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: Column(
              children: [
                PickerDropDownTextFormField(
                  controller: emiratesController,
                  imagePaths: 'Assets/Images/emirate_icon.png',
                  labelText: 'Choose Emirates',
                  onTap: () {
                    if(emirateResponse != null) {
                      showEmiratesListDialog(context, emirateResponse!.emiratesList!, (value) {
                        BlocProvider.of<PickerBloc>(context).add(GetAreaEvent(value));
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                PickerDropDownTextFormField(
                  controller: areaController,
                  imagePaths: 'Assets/Images/area_icon.png',
                  labelText: 'Choose Area',
                  onTap: () {
                    setState(() {
                      if (emiratesController.text.isEmpty) {
                        snackBar(context, message: 'Please select emirates');
                      } else {
                        if(areaResponse != null) {
                          showAreaListDialog(context, areaResponse.areaList!, (value) {
                            BlocProvider.of<PickerBloc>(context).add(GetLocationEvent(value));
                          });
                        }
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                PickerDropDownTextFormField(
                  controller: locationController,
                  imagePaths: 'Assets/Images/locate_icon.png',
                  labelText: 'Choose Locality',
                  onTap: () {
                    setState(() {
                      if (emiratesController.text.isEmpty) {
                        snackBar(context, message: 'Please select emirates');
                      } else if (areaController.text.isEmpty) {
                        snackBar(context, message: 'Please select area');
                      } else {
                        if(locationResponse != null) {
                          showLocationListDialog(context, locationResponse.locationList!);
                        }
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFetchingGPS = true;
                          });
                          getCurrentLocation();
                        },
                        child: Row(
                          children: [
                            Image.asset('Assets/Images/gps_icon.png', width: 24, height: 24),
                            const SizedBox(width: 20),
                            const Text('Fetch GPS', style: TextStyle(color: pickerBlackColor, fontSize: 12, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (isFetchingGPS)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PickerRegisterTextFormField(
                              getController: gpsLatitudeController,
                              labelText: 'Latitude',
                              imagePaths: 'Assets/Images/locate_icon.png',
                              keyboardType: TextInputType.none,
                              inputFormat: [FilteringTextInputFormatter.digitsOnly],
                              readOnly: true,
                              onTap: () {
                                getCurrentLocation();
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: PickerRegisterTextFormField(
                              getController: gpsLongitudeController,
                              labelText: 'Longitude',
                              imagePaths: 'Assets/Images/locate_icon.png',
                              keyboardType: TextInputType.none,
                              inputFormat: [FilteringTextInputFormatter.digitsOnly],
                              readOnly: true,
                              onTap: () {
                                getCurrentLocation();
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                isFetchingGPS == true ? const SizedBox(height: 16) : Container(),
                PickerRegisterTextFormField(
                  getController: nameController,
                  labelText: 'Name',
                  imagePaths: 'Assets/Images/user_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: mobileController,
                    labelText: 'Phone',
                    imagePaths: 'Assets/Images/mob_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: whatsAppController,
                    labelText: 'Whatsapp No:',
                    imagePaths: 'Assets/Images/whatsapp_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: buildingNoController,
                    labelText: 'Building No:',
                    imagePaths: 'Assets/Images/build_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: buildingAddressController,
                  labelText: 'Building Name',
                  imagePaths: 'Assets/Images/build_icon.png',
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: floorNoController,
                    labelText: 'Floor No:',
                    imagePaths: 'Assets/Images/flat_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                    getController: flatNoController,
                    labelText: 'Flat No: / House No:',
                    imagePaths: 'Assets/Images/build_icon.png',
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: mobileController,
                  labelText: 'User Name',
                  imagePaths: 'Assets/Images/user_name.png',
                  keyboardType: TextInputType.none,
                ),
                const SizedBox(height: 16),
                PickerRegisterTextFormField(
                  getController: passwordController,
                  labelText: 'Password',
                  imagePaths: 'Assets/Images/pswrd_icon.png',
                  obscureText: isVisible ? false : true,
                  suffixIcon:  IconButton(onPressed: (){
                    if (isVisible) {
                      setState(() {
                        isVisible = false;
                      });
                    } else {
                      setState(() {
                        isVisible = true;
                      });
                    }
                  }, icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    color: pickerGoldColor,
                  ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (emiratesController.text.isEmpty) {
                        snackBar(context, message: 'Please select emirates');
                      } else if (areaController.text.isEmpty) {
                        snackBar(context, message: 'Please select area');
                      } else if (locationController.text.isEmpty) {
                        snackBar(context, message: 'Please select locality');
                      } else if (gpsLatitudeController.text.isEmpty) {
                        snackBar(context, message: 'Please click fetch GPS');
                      } else if (gpsLongitudeController.text.isEmpty) {
                        snackBar(context, message: 'Please click fetch GPS');
                      } else if (nameController.text.isEmpty) {
                        snackBar(context, message: 'Please enter name');
                      } else if (mobileController.text.isEmpty) {
                        snackBar(context, message: 'Please enter phone number');
                      } else if (mobileController.text.length != 10) {
                        snackBar(context, message: 'Please enter valid phone number');
                      } else if (whatsAppController.text.isEmpty) {
                        snackBar(context, message: 'Please enter whats app number');
                      } else if (whatsAppController.text.length != 10) {
                        snackBar(context, message: 'Please enter valid whats app number');
                      } else if (buildingNoController.text.isEmpty) {
                        snackBar(context, message: 'Please enter building no:');
                      } else if (buildingAddressController.text.isEmpty) {
                        snackBar(context, message: 'Please enter building name');
                      } else if (floorNoController.text.isEmpty) {
                        snackBar(context, message: 'Please enter floor number');
                      } else if (flatNoController.text.isEmpty) {
                        snackBar(context, message: 'Please enter flat number');
                      } else if (passwordController.text.isEmpty) {
                        snackBar(context, message: 'Please enter password');
                      } else {
                        BlocProvider.of<PickerBloc>(context).add(GetPersonalSaveEvent(
                            double.parse(mobileController.text).toInt().toString(),
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            'Home',
                            double.parse(buildingNoController.text).toInt(),
                            roomNoController.text,
                            double.parse(mobileController.text).toInt(),
                            0,
                            double.parse(whatsAppController.text).toInt(),
                            0,
                            0,
                            0,
                            double.parse(gpsLatitudeController.text).toInt(),
                            double.parse(gpsLongitudeController.text).toInt(),
                            locationIDController.text,
                            trnNoController.text,
                            buildingAddressController.text,
                            designationController.text,
                            mobileController.text,
                            floorNoController.text,
                            flatNoController.text));
                        snackBar(context, message: 'Registration completed successfully', type: MessageType.success);
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageNew()));
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pickerGoldColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('SAVE',
                      style: TextStyle(fontSize: 16.0, color:Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const Text('Location permissions are denied, allow from settings');
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      const Text('Location permissions are denied, allow from settings');
      return null;
    }
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('longitude: ${location.longitude}, Latitude: ${location.latitude}');
    currentPosition = location;
    gpsLatitudeController.text = '${location.latitude}';
    gpsLongitudeController.text =' ${location.longitude}';
  }

  showEmiratesListDialog(BuildContext context, List<EmiratesList> emirateList, Function(String) callback) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Emirate',
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: emirateList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                emiratesController.text = emirateList[index].name!;
                emiratesIDController.text = emirateList[index].emirateId!;
                Navigator.pop(context);
                callback( emiratesIDController.text);
              } ,
              child: Text((emirateList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: pickerBlackColor, fontWeight: FontWeight.w600)),
            )));
  }

  showAreaListDialog(BuildContext context, List<AreaList> areaList, Function(String) callback) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Area',
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: areaList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                areaController.text = areaList[index].name!;
                areaIDController.text = areaList[index].areaId!;
                Navigator.pop(context);
                callback(areaIDController.text);
              } ,
              child: Text((areaList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: pickerBlackColor, fontWeight: FontWeight.w600)),
            )));
  }

  showLocationListDialog(BuildContext context, List<LocationList> locationList) {
    return showCustomBottomSheet(
        context,
        title: 'Please choose a Area',
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
            itemCount: locationList.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                locationController.text = locationList[index].name!;
                locationIDController.text = locationList[index].locationId!;
                Navigator.pop(context);
                //callback(locationIDController.text);
              } ,
              child: Text((locationList[index].name)!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: pickerBlackColor, fontWeight: FontWeight.w600)),
            )));
  }
}




class PickerRegisterTextFormField extends StatelessWidget {
  final TextEditingController getController;
  final String labelText;
  final String imagePaths;
  void Function()? onTap;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;


  PickerRegisterTextFormField({required this.getController,this.suffixIcon, required this.labelText,this.obscureText = false, required this.imagePaths, this.inputFormat, this.keyboardType, this.readOnly=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        readOnly: readOnly,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onTap: onTap,
        controller: getController,
        obscureText:obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: pickerBlackColor, fontSize: 12, fontWeight: FontWeight.w500),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            //child: Image.asset(imagePaths),
            child: SizedBox(width:24, height: 24, child: Image.asset(imagePaths, width:24, height: 24)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: pickerBlackColor, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}


class PickerDropDownTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? text;
  final IconData? suffixIcon;
  final Function()? onTap;
  final TextInputType inputType;
  final String? hintText;
  final int maxLines;
  final String imagePaths;

  const PickerDropDownTextFormField(
      {Key? key,
        required this.controller,
        this.labelText,
        this.suffixIcon,
        this.text,
        this.onTap,
        required this.imagePaths,
        this.inputType = TextInputType.text,
        this.hintText, this.maxLines=1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        readOnly: true,
        keyboardType: inputType,
        onTap: onTap,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(color: pickerBlackColor, fontSize: 12, fontWeight: FontWeight.w500),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(width:24, height: 24, child: Image.asset(imagePaths, width:24, height: 24)),
            // child: Image.asset(imagePaths),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down, color: pickerGoldColor, size: 28),
        ),
        style: const TextStyle(color: pickerBlackColor, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

showCustomBottomSheet(BuildContext context, Widget content,
    {Color bgColor = Colors.white, required String title}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      isDismissible: false,
      //isScrollControlled: true,
      enableDrag: false,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(
                alignment: Alignment.centerRight,
                child:
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: pickerGoldColor))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: pickerBlackColor))),
            if(title!='') const SizedBox(height: 8),
            if(title!='') const Divider(thickness: 1.0, color: pickerBlackColor),
            Expanded(
              child: SingleChildScrollView(
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  child: content),
            )
          ]),
        );
      });
}