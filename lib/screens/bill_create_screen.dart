import 'package:flutter/material.dart';
import 'package:flutter_bill_split/data/DUMMY_DATA.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/models/entry.dart';

class BillCreateScreen extends StatelessWidget {
  const BillCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Enter Name: _______'),
            Text('Enter Date: _______'),
            Text('Add members: _______'),
            TextButton(
              onPressed: () {
                DUMMY_BILLS.add(Bill(
                    title: 'ADDED NEW POG',
                    createdTime: DateTime.now(),
                    entries: <Entry>[],
                    members: [
                      dummy_members[0],
                      dummy_members[1],
                      dummy_members[2],
                    ]));
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.amber[200],
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
