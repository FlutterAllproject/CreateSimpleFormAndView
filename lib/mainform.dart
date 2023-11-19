import 'package:create_simple_form/details.dart';
import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MyFormState();
}

class _MyFormState extends State<MainForm> {
  var _productName;
  final _productController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _productController.dispose();
    super.dispose();
  }

  void _updateText() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
          actions: [],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(children: [
            //  TextField(
            //   decoration: InputDecoration(
            //     hintText: "Product Name",
            //     //icon: Icon(Icons.verified_user_outlined),
            //     prefixIcon: Icon(Icons.add_alarm_sharp),
            //   ),
            // ),
            TextFormField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: "Product Name",
                prefixIcon: Icon(Icons.verified_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            myBtn(context),
          ]),
        ));
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Details(
            productName: _productController.text,
          );
        }));
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
