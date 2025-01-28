import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myexpense/data/utls/utils.dart';
import 'package:myexpense/ui/HomeMain.dart';
import 'package:myexpense/utils/apptexts.dart';

import '../../assets/img/pngs.dart';
import '../../colors/colors.dart';
import '../../images.dart';
import '../auth/login_home.dart';
import '../auth/signup_home.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: iconbg,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            sh40(),
            Center(
              child: Container(
                child: addimage(manic),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -200, // Adjust height dynamically

              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      sh40(),
                      apptextdrkboldcst(
                        "Spend smarter\nsave more",
                        30.0,
                        app_blu_drk,
                        true,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>LoginHome());

                        },
                          child: appbutton("Login")),
                      sh20(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textcst("Don't have an account? ",13.0,black,false),
                          GestureDetector(

                            onTap: (){

                              Get.to(()=>SignupHome());
                            },
                              child: apptextcstbold("Signup", 14.0, app_blu_drk)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )));
  }
}
