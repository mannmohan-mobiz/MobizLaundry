import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Receipt.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool isExpanded = false;
  bool isPressed = false;
   String selectedOption='';
  String Bank = 'Select Your Bank';
  List<String> elements = ['Select Your Bank','State Bank of India','Federal Bank','Canara Bank','Punjab National Bank',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.blue),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.blue,
                )),
          )
        ],
        title: Center(
            child: Column(
              children: const [
                Text('LOGO', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),),
                Text('Welcome Back Deepesh !',
                  style: TextStyle(fontSize: 18, color: Colors.blue),)
              ],
            )),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text('WALLET',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900]
                  ),),
              ),
            ),
            Container(
              height: 150,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Your Current Balance : 100"),
                ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 15),
                          child: ElevatedButton(onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                          },
                            child: Text('TOP UP',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                          ),
                        ),
                      ],
                    ),
              ]),
            ),
            if(isPressed)
            Padding(
              padding: const EdgeInsets.only(right: 160),
              child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(CupertinoIcons.chevron_down,color: Colors.blue[900],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Icon(CupertinoIcons.chevron_down,color: Colors.blue),
                    )
                  ]
              ),
            ),
            if(isPressed)
            Container(
              height: isExpanded ? 450 : 250,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('TOP UP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue[900]
                          ),),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Amount'),
                        ),
                        Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide.none),
                                hintText: '0'
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    Text('Mode of payment'),
                    Row(
                      children: [
                      Radio<String>(
                        value: 'cash',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = false;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Cash'),
                      Radio<String>(
                        value: 'cheque',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = true;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Cheque'),
                      Radio<String>(
                        value: 'online',
                        groupValue: selectedOption,
                        onChanged: (value) {
                        setState(() {
                          isExpanded = false;
                        selectedOption = value!;
                    });
                    },
                    ),
                      Text('Online'),
                    ],
                    ),
                      if(isExpanded)
                            Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blue),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(),
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: 'Enter Cheque No.'
                                ),
                              ),
                            ),
                    if(isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(),
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: 'Enter Cheque Date'
                          ),
                        ),
                      ),
                    ),
                    if(isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: DropdownButtonFormField(
                            validator: (d) {
                              if (d!.contains('Select Your Bank')) {
                                return 'Select Your Bank';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.only(),
                              prefix: SizedBox(
                                width: 10,
                              ),
                                hintText: 'Select Your Bank',
                            ),
                            value: Bank,
                            items: elements.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
                            onChanged: (v) {
                              setState(() {
                                Bank = v!;
                              });
                            }),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20,bottom: 15),
                          child: ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Receipt(),));
                          },
                            child: Text('CONTINUE',style: TextStyle(color: Colors.white)),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
