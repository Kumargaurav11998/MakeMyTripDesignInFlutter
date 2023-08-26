import 'package:firebase_auth/firebase_auth.dart';
import 'package:flights_app/login_verify/service/localdb.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String verificationID = '';
int resendTokens =0;

//Sign In function
Future<User?> signInWithGoogle() async {
  try {
    //Signing in with Google
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    //Creating credential for firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    //SignIn with Credential and Making a user in firebase getting User class
    final userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    //Checking is On
    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(" $user");
    await LocalDataSaver.saveLoginData(true);
    await LocalDataSaver.saveName(user!.displayName.toString());
    await LocalDataSaver.saveEmail(user.email.toString());
    await LocalDataSaver.saveImg(user.photoURL.toString());
    await LocalDataSaver.savePhone(user.phoneNumber.toString());

    Constant.name = (await LocalDataSaver.getName())!;
    Constant.email = (await LocalDataSaver.getEmail())!;
    Constant.img = (await LocalDataSaver.getImg())!;
    Constant.phone = (await LocalDataSaver.getPhone())!;

    await Fluttertoast.showToast(msg: "Login Successful");

    return user;
  } catch (e) {
    debugPrint("$e");
  }
  return null;
}

Future<String> signOut() async {
  await googleSignIn.signOut();
  await _auth.signOut();

  LocalDataSaver.removePreferences();
  Constant.name = '';
  await Fluttertoast.showToast(msg: "Logout Successful");

  return "Success";
}

Future fetchOTP(controller,context) async {
  try {
    await _auth.verifyPhoneNumber(
        phoneNumber: controller,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);

          LocalDataSaver.savePhone(controller.text.toString());
          Constant.phone = (await LocalDataSaver.getPhone())!;
print("Constant.phone:${Constant.phone}");
          // await Navigator.pushNamed(context, AppRoutes.VerifyPage);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "invalid-phone-number") {
            print("Invalid phone no");

          } else{
            print("FirebaseAuthException code: $e");
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          verificationID = verificationId;

        },
        codeAutoRetrievalTimeout: (String verificationId) {});


    // await Navigator.pushNamed(context, AppRoutes.VerifyPage);
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuthException: $e");
  }
}

Future<void> verifyOTP(controller, context) async {
  PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationID, smsCode: controller.toString());
  print("verificationId: $verificationID");
  // _auth.signInWithCredential(phoneAuthCredential);
  await signInWithPhoneAuthCredential(phoneAuthCredential, context);
}

Future signInWithPhoneAuthCredential(
    PhoneAuthCredential phoneAuthCredential, context) async {
  try {
    final authCredential =
        await _auth.signInWithCredential(phoneAuthCredential);
    if (authCredential.user != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.WelcomeAboardPage);
    }
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuthException:$e");
  }
}
