import 'package:flutter/material.dart';
import 'package:to_do_tasks/models/user.dart';
import 'package:to_do_tasks/screen/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:to_do_tasks/screen/home/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context); 
    if(user == null){
      return const Authenticate();
    }
    return Home();
  }
}