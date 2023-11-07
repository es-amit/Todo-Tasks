import 'package:flutter/material.dart';
import 'package:to_do_tasks/models/user.dart';
import 'package:to_do_tasks/screen/home/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_tasks/services/auth.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCX19GcQbuia8k27mOYEJRUtA6ehXzOpy4", 
      appId: "1:90587113428:android:299470dfb267ff83735841", 
      messagingSenderId: "90587113428", 
      projectId: "todo-tasks-bac18")
  );
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      value: AuthSevice().user,
      initialData: null, 
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}