import 'package:create_simple_form/details.dart';
import 'package:flutter/material.dart';

class MyForms extends StatefulWidget {
  const MyForms({super.key});

  @override
  State<MyForms> createState() => _MyFormState();
}

class _MyFormState extends State<MyForms> {
  var _productName;
  final _productController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productController.text;
    });
  }

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
            Text("Product Name is ${_productController.text}"),
          ]),
        ));
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Details();
        }));
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
