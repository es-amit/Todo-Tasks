import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Widget textItem(String labeltext,BuildContext context,bool secureText,TextEditingController controller) {
    // ignore: sized_box_for_whitespace
    return Container(
      width:  MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? 'Please Enter email ': null,
        
        obscureText: secureText,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
        
          labelText: labeltext,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }


  Widget buttonItem(String imagepath,BuildContext context,String buttonName, double size){
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 60,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagepath,
            height: size,
            width: size,),
            const SizedBox(width: 15,),
            Text(buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0
              ),)
            ],
          ),
      ),
    );
    
  }

   