import 'package:flutter/material.dart';
import 'package:flutter_bill_split/data/DUMMY_DATA.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/screens/split_screen.dart';
import 'package:flutter_bill_split/widgets/entry_tile.dart';

class BillScreen extends StatelessWidget {
  final Bill mybill;
  double summary = 0;
  BillScreen(this.mybill);

  @override
  Widget build(BuildContext context) {
    for (var e in mybill.entries) {
      summary += e.price * e.quantity;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(mybill.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplitScreen(mybill),
                  ),
                );
              },
              icon: Icon(Icons.pie_chart))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blueGrey[50],
              child: Column(
                children: [
                  Text(
                      'Date: ${mybill.createdTime.day}/${mybill.createdTime.month}'),
                  Text('Members:'),
                  ...mybill.members.map((e) => Text(e.name)).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text('Title'),
                        flex: 3,
                      ),
                      Expanded(child: Text('Quantity')),
                      Expanded(
                        child: Text('Price'),
                      ),
                      Expanded(
                        child: Text('Sum'),
                      ),
                    ],
                  ),
                  ...mybill.entries.map((e) => EntryTile(e)).toList(),
                  Align(
                    child: Text('Summury $summary'),
                    alignment: Alignment.center,
                  ),
                  Container(
                    color: Colors.blueGrey[100],
                    child: Column(
                      children: [
                        for (var item in DUMMY_SUBBILLS)
                          Text('${item.entries.last.title}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
