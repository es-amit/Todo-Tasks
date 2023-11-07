import 'package:flutter/material.dart';
import 'package:to_do_tasks/screen/wrapper.dart';
import 'package:to_do_tasks/shared/loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
      super.initState();
      _navigatorToHome();
    }

    void _navigatorToHome() async{
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Wrapper()));
    }

  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(  
          child: Column(  
            children: <Widget>[  
              Image.asset('assets/logo.png'),
              Loading(),
            ],  
          ),  
        ),   
      );
  }
}