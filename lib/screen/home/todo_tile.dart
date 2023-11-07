import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  String uid = '';
  String title = "";
  String time = '';
  bool check = true;
  String description = '';
  AsyncSnapshot snapshot;
  int index;

  // ignore: use_key_in_widget_constructors
  TodoTile({
    required this.title,
    required this.time,
    required this.check,
    required this.description,
    required this.uid,
    required this.snapshot,
    required this.index,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isChecked = false;
  bool Completed= false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            // ignore: sort_child_properties_last
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: isChecked,
                checkColor: const Color(0xff0e3e26),
                activeColor: const Color(0xff6cf8a9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                
                onChanged: (bool? value) {
                  if (value != null) {
                      setState(() {
                      isChecked = value;
                      Completed = !Completed;
                      FirebaseFirestore.instance
                            .collection('tasks')
                            .doc(widget.uid)
                            .collection('mytasks')
                            .doc(widget.time)
                            .update({'isCompleted':Completed});
                    });
                    
                  }
                },
              ),
            ),
            data: ThemeData(
              primarySwatch: Colors.blue,
              unselectedWidgetColor: const Color(0xff5e616a),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // ignore: sized_box_for_whitespace
          Expanded(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 75,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xff2a2e3d),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: isChecked ? Colors.grey : Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              decoration: isChecked ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(time,
                    //       style: const TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w500,
                    //       letterSpacing: 1,
                    //       color: Colors.white
                    // ),),
                    IconButton(
                      onPressed: () {
                        // ignore: unused_local_variable
                        final docs = widget.snapshot.data!.docs;
                        FirebaseFirestore.instance
                            .collection('tasks')
                            .doc(widget.uid)
                            .collection('mytasks')
                            .doc(widget.time)
                            .delete();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}