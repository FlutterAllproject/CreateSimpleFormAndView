import 'package:create_simple_form/details.dart';
import 'package:create_simple_form/models/product_model.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { Downloadable, Deliverable }

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MyFormState();
}

class _MyFormState extends State<MainForm> {
  _MyFormState() {
    //_selectedVal = _productSizesList[0];
    _dropdownSelectedValue = _productSizesList[0];
  }
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  bool? _topProduct = false;
  String? _dropdownSelectedValue = "";

  bool? _checkBox, _listTileCheckBox = false;
  //ProductTypeEnum? _productTypeEnum;
  ProductTypeEnum? _productTypeRadioButton;

  final _productSizesList = ["Small", "Medium", "Large", "XLarge"];
  String? _selectedVal = "";

  final _formKey = GlobalKey<FormState>();

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _productController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text("Form Data",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(children: [
            IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.production_quantity_limits),
              iconSize: 40,
              color: Colors.blue,
              alignment: Alignment.topLeft,
              onPressed: () {
                print("Icon Button clicked");
              },
            ),
            // Icon(
            //   Icons.production_quantity_limits,
            //   size: 50,
            //   color: Colors.purple,
            // ),
            Text(
              "Products",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text("Add product details in the form below"),
            const SizedBox(height: 10.0),
            Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    // Checkbox(
                    //     activeColor: Colors.yellow,
                    //     checkColor: Colors.black,
                    //     tristate: true,
                    //     value: _checkBox,
                    //     onChanged: (val) {
                    //       setState(() {
                    //         _checkBox = val;
                    //       });
                    //     }),

                    // checkBox ListTile
                    CheckboxListTile(
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("Top Product"),
                      //value: _listTileCheckBox,
                      value: _topProduct,
                      onChanged: (val) {
                        setState(() {
                          //_listTileCheckBox = val;
                          _topProduct = val;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 5.0),
                    // Radio<ProductTypeEnum>(
                    //   value: ProductTypeEnum.Deliverable,
                    //   groupValue: _productTypeEnum,
                    //   onChanged: (val) {
                    //     setState(() {
                    //       _productTypeEnum = val;
                    //     });
                    //   },
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            value: ProductTypeEnum.Deliverable,
                            //dense: true,
                            groupValue: _productTypeRadioButton,
                            tileColor: Colors.deepPurple.shade50,
                            title: Text(ProductTypeEnum.Deliverable.name),
                            onChanged: (val) {
                              setState(() {
                                _productTypeRadioButton = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: RadioListTile<ProductTypeEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            tileColor: Colors.deepPurple.shade50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            //dense: true,
                            value: ProductTypeEnum.Downloadable,
                            // groupValue: _productTypeEnum,
                            groupValue: _productTypeRadioButton,
                            title: Text(ProductTypeEnum.Downloadable.name),
                            onChanged: (val) {
                              setState(() {
                                _productTypeRadioButton = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),

                    // DropDownButton
                    // DropdownButton(
                    //     value: _selectedVal,
                    //     items: _productSizesList
                    //         .map((e) => DropdownMenuItem(
                    //               child: Text(e),
                    //               value: e,
                    //             ))
                    //         .toList(),
                    //     onChanged: (val) {
                    //       setState(() {
                    //         _selectedVal = val as String;
                    //       });
                    //     }),

                    DropdownButtonFormField(
                      value: _dropdownSelectedValue,
                      items: _productSizesList
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _dropdownSelectedValue = val as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      dropdownColor: Colors.deepPurple.shade50,
                      decoration: InputDecoration(
                        labelText: "Product Sizes",
                        prefixIcon: Icon(
                          Icons.accessibility_new_rounded,
                          color: Colors.deepPurple,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    // Submit Button
                    const SizedBox(height: 10.0),
                    //myBtn(context),
                    MyButton(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          ProductDetails productDetails = ProductDetails();

                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Processing Data')),
                          // );
                          productDetails.productName = _productController.text;
                          productDetails.productDetails =
                              _productDesController.text;

                          productDetails.isTopProduct = _topProduct!;
                          productDetails.productType = _productTypeRadioButton!;
                          productDetails.productSize = _dropdownSelectedValue!;

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Details(productDetails: productDetails);
                          }));
                        }
                      },
                    )
                  ],
                )),
          ]),
        ));
  }

  // OutlinedButton myBtn(BuildContext context) {
  //   return OutlinedButton(
  //     style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
  //     onPressed: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return Details(
  //            productName: _productController.text,

  //         );
  //       }));
  //     },
  //     child: Text(
  //       "Submit Form".toUpperCase(),
  //       style: const TextStyle(fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }
}

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.onPress,
    // required this.productName,
    // required this.productDescription,
  }) : super(key: key);

  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: onPress,
        child: Text(
          "Submit Form".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          } else
            null;
        },
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
      ),
    );
  }
}
