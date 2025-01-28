import 'package:flutter/material.dart';
import 'package:myexpense/assets/img/pngs.dart';
import 'package:myexpense/assets/svgs/svg.dart';
import 'package:myexpense/images.dart';

import '../colors/colors.dart';
import '../data/utls/utils.dart';
import '../utils/apptexts.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});


  @override
  State<Addexpense> createState() => _HomeState();
}

class _HomeState extends State<Addexpense> {

  String selectedValue = "Netflix";
  final FocusNode _focusNode = FocusNode();


  final List<Map<String, String>> items = [
    {"name": "Netflix", "image": "${nf}"},
    {"name": "Youtube", "image": "${yt}"},
    {"name": "Paypal", "image": "${ppl}"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Stack(
        children: [
        Container(
        height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: app_blu_drk,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(40, 15),
              bottomRight: Radius.elliptical(40, 15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: addsvg(back)),
                      apptextcstbold("Add Expense", 15.0, Colors.white),
                      addsvg(more),

                    ]),
                // First Text
                SizedBox(height: 8),
                // Spacing between texts

                // Second Text
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 450,
                // Slightly smaller than outer container
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16),
                // Centered with padding
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white, // Light blue
                      Colors.white, // Dark blue
                    ],
                    begin: Alignment.topLeft, // Start of the gradient
                    end: Alignment.bottomRight, // End of the gradient
                  ),
                  borderRadius: BorderRadius.circular(12), //
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Blue shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0,
                          5), // Shadow position (horizontal, vertical)
                    ),
                  ], // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      children: [

                        Row(
                          children: [
                            textmidcst("Name", 13.0, blackgrey, false),
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.6, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the container
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true, // Ensures the dropdown stretches to fill available space
                                  value: selectedValue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  underline: SizedBox(), // Remove default underline
                                  items: items.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item["name"],
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                                        children: [
                                          Image.asset(
                                            item["image"]!,
                                            height: 24,
                                            width: 24,
                                          ),
                                          SizedBox(width: 8), // Slight gap between image and text
                                          Text(item["name"]!), // Text immediately follows the image
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        sh20(),

                        Row(
                          children: [
                            textmidcst("Amount", 13.0, blackgrey, false),
                          ],
                        ),

                  sh10(),
                  TextField(
                  keyboardType: TextInputType.number,

                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        labelText: "\$0.0",
                        labelStyle: TextStyle(color: Colors.grey,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.grey, // Default border color
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: app_blu_drk, // Green border when in focus
                            width: 1.4,
                          ),
                        ),
                      ),
                  ),

                        sh20(),
                        appbutton("Record")
                  ]

                ),
              ),


            )
            ),
    ),


    // apptextcst("Good afternoon", 12, white)
    ]
    ,
    )
    ]
    )
    ,
    )
    );
  }
}
