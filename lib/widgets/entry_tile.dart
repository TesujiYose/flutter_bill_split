import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/entry.dart';

class EntryTile extends StatelessWidget {
  final Entry entry;

  EntryTile(this.entry);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(entry.title),
          Text(entry.quantity.toString()),
          Text(entry.price.toString()),
          Text('${(entry.quantity * entry.price).toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
