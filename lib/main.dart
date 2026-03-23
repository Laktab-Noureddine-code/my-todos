import "package:flutter/material.dart";
import "package:todo/todo.dart";


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Todo(),
  ));
}