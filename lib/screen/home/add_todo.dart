import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  addtasktofirebase() async{
    FirebaseAuth auth=FirebaseAuth.instance;
    // ignore: unused_local_variable
    User? user = auth.currentUser;
    String uid = user!.uid;
    var time= DateTime.now();
    await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(time.toString()).set(
      {'title':titleController.text,
      'description':descriptionController.text,
      'time':time.toString(),
      'isCompleted':false});
      Fluttertoast.showToast(msg: "Task Added!!",gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ])
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              IconButton(onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 28,)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4
                    ),),
                    const SizedBox(height: 6,),
                    const Text('New Todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                    ),),
                    const SizedBox(height: 20,),
                    label('Task Title'),

                    const SizedBox(height: 10,),

                    title(context,'Task Title',titleController),

                    const SizedBox(height: 30,),


                    label('Description'),

                    const SizedBox(height: 12,),

                    description(context, 'Description',descriptionController),

                    const SizedBox(height: 30,),

                     button(context),
                  
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget description(BuildContext context,String text,TextEditingController controller){
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.blue,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
          )
        ),
      ),
    );
  }

  Widget button(BuildContext context){
    return InkWell(
      onTap: (){
        addtasktofirebase();
        Navigator.pop(context);
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9)
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text('Add Todo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
        ),
      ),
    );
  }

  Widget title(BuildContext context,String text,TextEditingController controller){
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.blue,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
          )
        ),
      ),
    );
  }

  Widget label(String label){
    return Text(label,
      style: const TextStyle(
      color: Colors.white,
      fontSize: 16.5,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2
      ),);
  }
}