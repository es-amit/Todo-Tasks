import 'package:flutter/material.dart';
import 'package:to_do_tasks/screen/authenticate/sign_up.dart';
import 'package:to_do_tasks/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !(showSignIn);
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
     if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else{
      return Register(toggleView :toggleView);
    }
  }
}