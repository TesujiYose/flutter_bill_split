import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/bill.dart';

class SplitScreen extends StatefulWidget {
  Bill mybill;

  SplitScreen(this.mybill);
  @override
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  String hintText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Text('Current user is:'),
              DropdownButton(
                hint: Text(hintText),
                items: widget.mybill.members.map((e) {
                  return DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    hintText = val.toString();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
