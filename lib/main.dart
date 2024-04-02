import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmagang/app/controllers/auth_controller.dart';
// import 'package:projectmagang/app/modules/home/views/home_view.dart';
// import 'package:projectmagang/app/modules/login/views/login_view.dart';
import 'package:projectmagang/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

late final FirebaseApp app;
late final FirebaseAuth main_auth;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: 
      "AIzaSyDR-h5Wy53dJaJClOwJzClR3zizReGS2gc", // paste your api key here
      appId: 
      "1:428771397210:android:4f78e7332dac767d4c5263", //paste your app id here
      messagingSenderId: 
      "428771397210", //paste your messagingSenderId here
      projectId: 
      "projectmagang-5e9ba", //paste your project id here
    ),
  );
  main_auth = FirebaseAuth.instanceFor(app: app);

  FirebaseAuth.instance;
  final auth = Get.put(AuthController(), permanent: true);

  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: authC.streamAuthStatus,
     builder: (context, snapshot) {
      print(snapshot);
      if(snapshot.connectionState == ConnectionState.active){
      print(snapshot.data);

        return GetMaterialApp (
         title: 'Application',
        initialRoute: 
            snapshot.data != null && snapshot.data!.emailVerified == true 
        ? Routes.HOME 
        : Routes.LOGIN,
        getPages: AppPages.routes,
        // home: snapshot.data != null ? HomeView() :LoginView(),
     );
     }
     return LoadingView();
    },
  );
 }
}