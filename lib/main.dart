//import 'package:create_simple_form/form.dart';
//import 'package:create_simple_form/forms.dart';
import 'package:create_simple_form/mainform.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Form",
        theme: ThemeData.light(),
        //home: MyForm()
        //home: MyForms());
        home: MainForm());
  }
}
