import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myexpense/images.dart';
import 'package:myexpense/ui/AddExpense.dart';
import 'package:myexpense/utils/apptexts.dart';

import '../assets/img/pngs.dart';
import '../colors/colors.dart';

class Homemain extends StatefulWidget {
  @override
  State<Homemain> createState() => _HomemainState();
}

class _HomemainState extends State<Homemain> {
  var names = ["Youtube","Netflix","Paypal"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>Addexpense());
      },backgroundColor: app_blu_drk,
        child: const Icon(Icons.add,color: Colors.white,),

      ),
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
                        left: 16.0, right: 16.0,top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        apptextcstbold("Welcome Back!", 18.0, Colors.white),
                        // First Text
                        SizedBox(height: 8),
                        // Spacing between texts
                        apptextcstbold("Your dashboard summary is below", 14.0,
                            Colors.white70),
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
                        height: 168,
                        // Slightly smaller than outer container
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        // Centered with padding
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              cardbg, // Light blue
                              cardbg, // Dark blue
                            ],
                            begin: Alignment.topLeft, // Start of the gradient
                            end: Alignment.bottomRight, // End of the gradient
                          ),
                          borderRadius: BorderRadius.circular(12), //
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade200, // Blue shadow color
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(children: [
                                Row(children: [
                                  apptextcstbold("Total Balance", 12.0, white)
                                ]),
                                Row(children: [
                                  apptextcstbold("\$2,540.00", 20.0, white)
                                ]),
                              ]),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      apptextcstbold("Income", 13.0, white),
                                      apptextcstbold("Expense", 13.0, white),
                                    ],
                                  ),


                                     Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      apptextcstbold("\$33,000.00", 16.0, white),
                                      apptextcstbold("\$5,000.00", 16.0, white),
                                    ],
                                  ),



                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textboldcst("Transactions history", 15.0, black, false),
                  textmidcst("See all", 13.0, hintgrey, false),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20), // No padding at the top
              child: Container(
                height: 350,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 0), // Remove default padding from ListView
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return expenseitem("Paypal", upw);
                  },
                ),
              ),
            ),


            // apptextcst("Good afternoon", 12, white)
          ],
        ),
      ),
    );
  }
}


Widget expenseitem(title,image){
  return Padding(
    padding: EdgeInsets.only(left: 18, right: 18, top: 0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: addimage(image),
                ),
                SizedBox(width: 8),
                // Add spacing between the image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textmidcst("${title}", 16.0, black, false),
                    textmidcst("Today", 13.0, hintgrey, false),
                  ],
                ),
              ],
            ),
            textmidcst("\$800", 16.0, green, false),
          ],
        ),
        Divider(thickness: 0.5,)
      ],
    ),
  );
}