import 'package:flutter/material.dart';
import 'package:projectmagang/app/controllers/auth_controller.dart';
import 'package:projectmagang/app/controllers/auth_controller.dart';
import '../controllers/verifikasi_controller.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: VerifikasiView(),
  ));
}

class VerifikasiView extends StatefulWidget {
  @override
  _VerifikasiViewState createState() => _VerifikasiViewState();
}

class _VerifikasiViewState extends State<VerifikasiView> {
  final AuthController authC = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true; // Letakkan di dalam kelas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset("assets/verifikasi.jpg"),
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Verifikasi Email Dikirimkan!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 125, 175),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Kami telah mengirimkan email verifikasi ke alamat email',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(204, 198, 198, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Emailname@mail.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 64, 125, 175),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 225, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Kirim ulang verifikasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 51, 120, 175),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Silahkan periksa kotak masuk Anda dan ikuti langkah-langkah',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'verifikasi untuk menyelesaikan proses pendafaran. Klik login',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'jika anda telah melakukan verifikasi',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              GestureDetector(
                onTap: () {
                  // Implement your login logic here
                  authC.login(emailController.text, passwordController.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 59, 123, 176),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Metode untuk melakukan verifikasi
  void _verifikasi() {
    String email = emailController.text;
    String password = passwordController.text;
    // Panggil metode verifikasi dari AuthController
    authC.verifikasi(email, password);
  }
}