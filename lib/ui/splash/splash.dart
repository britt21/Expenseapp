import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../assets/img/pngs.dart';
import '../../colors/colors.dart';
import 'get_started.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash>{
  bool _moveRight = false;

  var dataManager = GetStorage();


  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {

      Get.to(()=>GetStarted());

    });
    // Start the animation by changing _moveRight after a short delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _moveRight = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_drk_blu,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "mono",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Spacing between texts
          ],
        ),
      ),
    );
  }
}
