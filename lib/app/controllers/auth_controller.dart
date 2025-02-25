import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projectmagang/app/routes/app_pages.dart';
import 'package:projectmagang/main.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = main_auth;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void resetPassword(String email) async {
    if (email!=""&& GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
       Get.defaultDialog(
        title: "Berhasil", 
        middleText: "Kami telah mengirimkan reset password ke email $email.",
        onConfirm: () {
          Get.back(); // close dialog 
          Get.back(); // go to login
        },
        textConfirm: "Ya, Aku mengerti" ); 
      }catch (e) {
        Get.defaultDialog(
        title: "Terjadi Kesalahan", 
        middleText: "Tidak dapat mengirimkan reset password."
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan", 
        middleText: "Email tidak valid."
        );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential myUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (myUser.user != null && myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verification email",
          middleText: 
          "Kamu perlu verifikasi email terlebih dahulu. Apakah kamu ingin dikirimkan verifikasi ulang ?",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "Kembali",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Wrong password provided for that user1.",
        );
      } else {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Email atau password yang anda masukkan mungkin salah",
        );
      }
    } catch(e){
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat login dengan akun ini.",
        );
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      UserCredential myUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await myUser.user!.sendEmailVerification();
      
      Get.defaultDialog(
        title: "Verification email",
        middleText: "Kami telah mengirimkan email verifikasi $email.",
        onConfirm: () {
          Get.back(); // close dialog
          Get.offAllNamed(Routes.LOGIN); // go to login
        },
        textConfirm: "Ya, saya akan cek email.",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mendaftarkan akun ini.",
      );
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void verifikasi(String email, String password) {}
}
