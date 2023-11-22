import 'package:create_simple_form/mainform.dart';
import 'package:create_simple_form/models/product_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details(
      // {super.key, required this.productName, required this.productDescription});
      {Key? key,
      required this.productDetails})
      : super(key: key);
  //String productName,productDescription;
  ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productDetails.isTopProduct
                        ? (const Chip(
                            label: Text("Top Product"),
                            backgroundColor: Colors.deepPurple,
                            labelStyle: TextStyle(color: Colors.white),
                          ))
                        : Text("Hello"),
                    Text(
                      productDetails.productName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text(productDetails.productDetails),
                    Row(
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                primary: Colors.purple),
                            child: Text(
                              //"cdffd",
                              productDetails.productType.name as String,
                              // productDetails.productSize,
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
                //title: Text(productName),
              )
            ],
          ),
        ));
  }
}
