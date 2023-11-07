import 'package:flutter/material.dart';
import 'package:to_do_tasks/services/auth.dart';
import 'package:to_do_tasks/shared/constants.dart';
import 'package:to_do_tasks/shared/loading.dart';

class SignIn extends StatefulWidget {


  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final AuthSevice _auth = AuthSevice();
  bool loading = false;


  // ignore: prefer_final_fields
  TextEditingController _email = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _password = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 20,),

              textItem('Email...',context,false,_email),

              const SizedBox(height: 20.0,),

              textItem('Password', context,true,_password),

              const SizedBox(height: 20.0,),

              SigninButton(context, 'Sign In'),

            
                const SizedBox(height: 15,),
                
                Text(error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16
                ),),


              const SizedBox(height: 35.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){
                        widget.toggleView();
                      },
                      child: const Text('Create new Account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }



  Widget SigninButton(BuildContext context,String label){
    return InkWell(
      onTap: () async{
        setState(() {
          loading = true;
        });
        dynamic result = await _auth.signInWithEmailAndPassword(_email.text, _password.text);
        if(result == null){
          setState(() {
            loading = false;
            error = 'please supply a valid email';
          });
        }
      },
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9)
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
        ),
      ),
    );
  }
}