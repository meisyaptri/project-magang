import 'package:flutter/material.dart';
import 'package:projectmagang/app/modules/login/views/login_view.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                height: 20,
              ),
              Image.asset("assets/logo.png"),
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 440,
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 238, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 58, 123, 176),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 61, 124, 175)),
                          prefixIcon: Icon(
                            Icons.person_pin,
                            color: const Color.fromARGB(255, 52, 120, 175),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 60, 123, 175)),
                            prefixIcon: Icon(Icons.person_pin,
                                color: Color.fromARGB(255, 69, 128, 176))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 60, 123, 175)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: const Color.fromARGB(255, 64, 126, 176),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
                              color: const Color.fromARGB(255, 64, 126, 176),
                            )),
                      ),
                    ),
                    Container(
                      width: 290,
                      child: TextField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 70, 129, 176),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: const Color.fromARGB(255, 59, 123, 175),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
                              color: const Color.fromARGB(255, 62, 124, 176),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        // Implement registration logic here
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 55, 121, 176),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Register',
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
                      'Already have an account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 54, 121, 175),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login here!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 59, 123, 176),
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