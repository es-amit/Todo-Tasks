import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_tasks/screen/home/add_todo.dart';
import 'package:to_do_tasks/screen/home/todo_tile.dart';
import 'package:to_do_tasks/services/auth.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String uid ='';
  
  final AuthSevice _auth = AuthSevice();  

  getuid() async{
      FirebaseAuth author = FirebaseAuth.instance;
      User? user = author.currentUser;
      setState(() {
         uid =user!.uid;
    });
  }

  @override
  void initState(){
    getuid();
    super.initState();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {


    // ignore: no_leading_underscores_for_local_identifiers
    void _showAddTaskPanel(){
        showModalBottomSheet(context: context, builder: (context){
        return const AddTodo();
      });
    }


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Today's Schedule",
        style: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          signOutbutton(context),
        ],
      ),
    
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot?>(
          initialData: null,
          stream: FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').snapshots(), 
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              final docs = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: docs.length,
                  
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          TodoTile(title: docs[index]['title'], time: docs[index]['time'], check: true,description: docs[index]['description'],uid: uid,snapshot: snapshot,index: index,),
                        ],
                      ),
                    );
                  },
                );
                            }
          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showAddTaskPanel();
        },
        backgroundColor: const Color(0xff8a32f1),
        child: const Icon(Icons.add,
        color: Colors.white,
        size: 30,),
    
        ),
    );
  }
  Widget signOutbutton(BuildContext context){
    return InkWell(
      onTap: (){
        _auth.signOut();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
        height: 15,
        width: 100,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9)
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text('Sign Out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}