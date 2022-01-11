import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/widgets/entry_tile.dart';

class BillScreen extends StatelessWidget {
  final Bill mybill;

  BillScreen(this.mybill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mybill.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Date: ${mybill.createdTime.day}/${mybill.createdTime.month}'),
            Text('Members:'),
            ...mybill.members.map((e) => Text(e.name)).toList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Title'),
                Text('Quantity'),
                Text('Price'),
                Text('Sum'),
              ],
            ),
            ...mybill.entries.map((e) => EntryTile(e)).toList(),
          ],
        ),
      ),
    );
  }
}
