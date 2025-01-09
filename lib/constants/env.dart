import 'package:flutter/material.dart';

class Env {
  static snackBar(context, String content){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(content)));
  }

  static gotoReplacemaent(context, Widget route){
    Navigator.of(context).popUntil((route) => false);
    Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
  }
  
  static goto(context, Widget route){
    Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
  }



}