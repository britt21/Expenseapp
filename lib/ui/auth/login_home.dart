import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myexpense/service/auth_service.dart';
import 'package:myexpense/ui/HomeMain.dart';
import 'package:myexpense/ui/auth/signup_home.dart';
import 'package:myexpense/utils/app_edit_text.dart';
import 'package:myexpense/utils/apptexts.dart';
import 'package:myexpense/utils/password_Et.dart';
import '../../../../assets/img/pngs.dart';
import '../../../../data/cache/datamanager.dart';
import '../../assets/svgs/svg.dart';
import '../../colors/colors.dart';
import '../../utils/snackbar.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {

  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var authService = AuthService();
  var dataManager = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       BlurryModalProgressHUD(
          inAsyncCall: authService.isLoading.value,
          child: Scaffold(
            body: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  apptextcstboldest(
                                      "Hi, Welcome Back", 20.0, Colors.black),
                                ],
                              ),
                              AppEditTextIcon(
                                  etcontroller: emailcontroller,
                                  eticon: userimg,
                                  tophint: "Email Address",
                                  innerhint: "test@gmail.com"),
                              passEt(
                                  etcontroller: passcontroller,
                                  eticon: pass,
                                  tophint: "Password",
                                  innerhint: "Password"),
                              GestureDetector(
                                onTap: () async {
                                  if(validator()){
                                    login(context);

                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 28.0),
                                  child: appbutton("Login"),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: textcst(
                                        "Don’t have an account?", 14.0,black,true),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => SignupHome());
                                        },
                                        child: apptextcst(
                                            " Sign Up", 14.0, app_blu)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void login(context)async{
    FocusScope.of(context).unfocus();


    var response = await authService.login(
        emailcontroller.text,
        passcontroller.text);

    print("LOGIN_RESP: " + response);
    if (response.contains(
        "User logged in successfully")) {
      showtopmessage(context, "User logged in successfully");
      Get.offAll(() => Homemain());

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
      if(passcontroller.text.length < 4 ){
      showtopmessage(context, "Password must be a valid password");
      return false;
    }

      return true;

  }


}

