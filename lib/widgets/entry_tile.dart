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
          Expanded(
            child: Text(entry.title),
            flex: 3,
          ),
          Expanded(
            child: Text(entry.quantity.toString()),
          ),
          Expanded(
            child: Text(entry.price.toString()),
          ),
          Expanded(
            child: Text('${(entry.quantity * entry.price).toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
