


import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../data/cache/datamanager.dart';


class AuthService extends GetxController {
  var isLoading = false.obs;
  var verificationId = ''.obs;


  var dataManager = GetStorage();

  Future<String> signup(String email, String pass) async {
     isLoading.value = true;

    try {
      // Create a user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);

      // Success: Return a success message
      isLoading.value = false;

      return "User signed up successfully. User ID: ${userCredential.user?.uid}";
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors and return appropriate messages
      switch (e.code) {
      case "email-already-in-use":
        isLoading.value = false;

        return "Error: The email address is already in use by another account.";
        case "invalid-email":
          isLoading.value = false;

          return "Error: The email address is not valid.";
        case "weak-password":
          isLoading.value = false;

          return "Error: The password provided is too weak.";
        case "operation-not-allowed":
          isLoading.value = false;

          return "Error: Email/password accounts are not enabled.";
        default:
          isLoading.value = false;

          return "Error: ${e.message}";
      }
    } catch (e) {
      isLoading.value = false;

      // Handle other types of errors and return a generic error message
      return "An unknown error occurred: $e";
    }
  }

  Future<String> login(String email, String pass) async {
    isLoading(true);

    try {
      // Sign in the user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      isLoading(false);
      return "User logged in successfully. User ID: ${userCredential.user?.uid}";
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors and return appropriate messages
      switch (e.code) {
        case "user-not-found":
          isLoading(false);

          return "Error: No user found with this email.";
        case "wrong-password":
          isLoading(false);

          return "Error: Incorrect password.";
        case "invalid-email":
          isLoading(false);

          return "Error: The email address is not valid.";
        case "user-disabled":
          isLoading(false);

          return "Error: This user account has been disabled.";
        default:
          isLoading(false);

          return "Error: ${e.message}";
      }
    } catch (e) {
      isLoading(false);

      // Handle other types of errors and return a generic error message
      return "An unknown error occurred: $e";
    }
  }

  Future<OtpResult> sendOtp(String phoneNumber) async {
    isLoading(true);

    final Completer<OtpResult> completer = Completer<OtpResult>();

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically called when verification is completed
          await signInWithCredential(credential);
          isLoading(false);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle error and complete with failure
          print('Verification failed: ${e.message}');
          isLoading(false);
          completer.complete(OtpResult(
            otpresult: null,
            errorMessage: e.message,
          ));
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store the verification ID and complete with success
          this.verificationId.value = verificationId;
          print("VERIFICATIONIDVALUE: ${this.verificationId.value}");
          dataManager.write(OTPVERIFY, this.verificationId.value);

          print("OFFLINER:: : ${dataManager.read(OTPVERIFY)}");

          isLoading(false);
          completer.complete(OtpResult(
            otpresult: verificationId,
            errorMessage: null,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout if needed
          this.verificationId.value = verificationId;
          isLoading(false);
        },
      );
    } catch (e) {
      isLoading(false);
      completer.complete(OtpResult(
        otpresult: null,
        errorMessage: e.toString(),
      ));
    }

    // Wait for the result from the completer
    return completer.future;
  }

  // Sign in with OTP
  Future<SignInResult?> signInWithOtp(String otp,verifyid) async {
    isLoading(true);

    print("OTP:::VERIFICATIONID" +verifyid);

    try {

      // Create PhoneAuthCredential using the verification ID and OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyid,
        smsCode: otp,
      );

      // Sign in the user with the credential
      UserCredential response = await FirebaseAuth.instance.signInWithCredential(credential);

      isLoading(false);

      print('Successfully signed in');
      return SignInResult(userCredential: response,errorMessage: ""); // Return the UserCredential object on success
    } catch (e) {
      isLoading(false);

      print('Sign-in failed: $e');

      return SignInResult(userCredential: null,errorMessage: e.toString()); // Return null on failure
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);  // Corrected line
    } catch (e) {
      print('Sign-in error: $e');
    }
  }

}

class SignInResult {
  final UserCredential? userCredential;
  final String? errorMessage;

  SignInResult({this.userCredential, this.errorMessage});
}

class OtpResult {
  final String? otpresult;
  final String? errorMessage;

  OtpResult({this.otpresult, this.errorMessage});
  @override
  String toStringvalue() {
    return 'OtpResult(otpresult: $otpresult, errorMessage: $errorMessage)';
  }
}
