import 'package:flutter/material.dart';
import 'package:projectmagang/app/controllers/auth_controller.dart';
import 'package:projectmagang/app/modules/signup/views/signup_view.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authC = AuthController(); // Instance dari AuthController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

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
              Image.asset("assets/logo.jpg"),
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 355,
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 223, 239, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 125, 176),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        controller: emailController, // Menggunakan TextEditingController
                        decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 58, 123, 176)),
                            prefixIcon: Icon(
                              Icons.person_pin,
                              color: Color.fromARGB(255, 61, 124, 176),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        controller: passwordController, // Menggunakan TextEditingController
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 55, 121, 175)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 62, 125, 176),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 60, 124, 176),
                              ),
                              onPressed: _togglePasswordVisibility,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 225, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: TextStyle(
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
                    GestureDetector(
                      onTap: () {
                        // Implement your login logic here
                        authC.login(emailController.text, passwordController.text);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
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
                    Text(
                      'Didnt have an account? ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 125, 175),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to register page here
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register here!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 62, 124, 175),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}