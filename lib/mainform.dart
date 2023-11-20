import 'package:create_simple_form/details.dart';
import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MyFormState();
}

class _MyFormState extends State<MainForm> {
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  bool? _checkBox, _listTileCheckBox = false;
  @override
  void dispose() {
    // TODO: implement dispose
    _productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(children: [
            const Text("Add product details in the form below"),
            const SizedBox(height: 10.0),
            MyTextField(
                myController: _productController,
                fieldName: "Product Name",
                myIcon: Icons.propane_outlined,
                prefixIconColor: Colors.deepPurple.shade300),
            const SizedBox(height: 10.0),
            MyTextField(
                myController: _productDesController,
                fieldName: "Product Description",
                myIcon: Icons.propane_outlined,
                prefixIconColor: Colors.deepPurple.shade300),
            // CheckBox
            Checkbox(
                activeColor: Colors.yellow,
                checkColor: Colors.black,
                tristate: true,
                value: _checkBox,
                onChanged: (val) {
                  setState(() {
                    _checkBox = val;
                  });
                }),

            // checkBox ListTile
            CheckboxListTile(
              title: Text("Top Product"),
              value: _listTileCheckBox,
              onChanged: (val) {
                setState(() {
                  _listTileCheckBox = val;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            // Submit Button
            const SizedBox(height: 10.0),
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

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(
            myIcon,
            color: prefixIconColor,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}
