import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/models/entry.dart';

class BillTile extends StatelessWidget {
  final Bill item;
  BillTile(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      trailing: Text(item.createdTime.toString()),
      subtitle: Text('${item.members.length} members'),
    );
  }
}
