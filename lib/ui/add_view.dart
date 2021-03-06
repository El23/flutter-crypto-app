import 'package:flutter/material.dart';
import 'package:flutter_app_crypto/net/flutterfire.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "tether",
    "bitcoin",
    "ethereum",
  ];

  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            onChanged: (String value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.3,
            child: TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: " Amount Coin",

              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(dropdownValue, _amountController.text);
    Navigator.of(context).pop();

              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
