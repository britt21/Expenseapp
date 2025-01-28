import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myexpense/utils/apptexts.dart';

import '../../assets/svgs/svg.dart';
import '../../colors/colors.dart';
import '../../data/cache/datamanager.dart';
import '../../service/auth_service.dart';
import '../../service/user_service.dart';
import '../../utils/app_edit_text.dart';
import '../../utils/password_Et.dart';
import '../../utils/snackbar.dart';
import 'login_home.dart';



class SignupHome extends StatefulWidget {
  const SignupHome({super.key});

  @override
  State<SignupHome> createState() => _SignupHomeState();
}

class _SignupHomeState extends State<SignupHome> {

  TextEditingController nameEt = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  var db = GetStorage();


  var authService = AuthService();
  var userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Obx(

      ()=> BlurryModalProgressHUD(
        inAsyncCall: authService.isLoading.value,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left:20,right: 20,top: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Row(
                        children: [
                          Text("Hi, let’s get started",style: GoogleFonts.inter(fontSize: 23,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    AppEditTextIcon(etcontroller: emailcontroller,tophint: "Email Address",eticon: emailic,innerhint: "test@gmail.com",),
                    passEt(etcontroller: passcontroller,tophint: "Password",eticon: pass,innerhint: "Password",),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          if (validator()) {
                            signup(context);
                            db.write(NAME, nameEt.text);
                            db.write(EMAIL, emailcontroller.text);
                          }
                        },

                          child: appbutton("Get Started")),
                    ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: textcst("Already have an account?", 14.0,black,true),
                                       ),

                           Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: GestureDetector(
                              onTap: (){

                                Navigator.pop(context);

                              },
                              child: apptextcst(" Login", 14.0,app_blu)),
                                       ),


                       ],
                     )


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(context)async{
    FocusScope.of(context).unfocus();

    var response = await authService.signup(
        emailcontroller.text,
        passcontroller.text);

    print("LOGIN_RESP: " + response);
    if (response.contains(
        "User signed up successfully")) {


      Navigator.pop(context);
      showtopmessage(context, "Success proceed to login");
    } else {
      showtopmessage(context, response);
      print("ERR: " + response);
    }
  }






  bool validator(){
    if(emailcontroller.text.isEmpty){
      showtopmessage(context, "Email must not be empty");
      return false;
    }
    if(passcontroller.text.isEmpty ){
      showtopmessage(context, "Password must not be empty");
      return false;
    }
    if(passcontroller.text.length <= 5 ){
      showtopmessage(context, "Password length be greater than 5 characters");
      return false;
    }







    return true;

  }



}
