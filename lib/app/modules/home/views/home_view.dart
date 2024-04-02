import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectmagang/app/modules/login/views/login_view.dart';
import 'package:projectmagang/app/modules/signup/views/signup_view.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int myIndex = 0;
  var user; // Variable user

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String uid= user?.uid ?? ''; // Handle case if user is null

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello! ${user?.email}', // Menampilkan email pengguna atau "Guest" jika tidak ada pengguna
                    style: TextStyle(color: Color.fromARGB(255, 57, 122, 175)),
                  ),
                  subtitle: Text(
                    'This is your day 75 internship here',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user.jpg'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 63, 125, 176),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            }
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.white),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.white),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add, color: Colors.white),
            label: 'Register',
          ),
        ],
        selectedItemColor: Colors.white, // Warna ikon terpilih
        unselectedItemColor:
            Colors.white.withOpacity(0.5), // Warna ikon tidak terpilih
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold), // Gaya teks terpilih
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal), // Gaya teks tidak terpilih
      ),
    );
  }
}