
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});

  // Collection reference

  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');

  Future addNewTask(String title,String description,String time,bool isCompleted) async{

    return await taskCollection.doc(uid).collection('mytasks').doc(time).set({
      'title':title,
      'description':description,
      'time':time,
      'isCompleted':isCompleted,
    });

  }

  Stream <QuerySnapshot> get tasks{
    return taskCollection.snapshots();
  }
}