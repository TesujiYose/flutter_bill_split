import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/models/entry.dart';

class SplitScreen extends StatefulWidget {
  Bill mybill;

  SplitScreen(this.mybill);
  @override
  _SplitScreenState createState() => _SplitScreenState();
}

List<Widget> listOfEntries = [];

class _SplitScreenState extends State<SplitScreen> {
  String hintText = '';
  String hintTitle = 'title';
  int _quality = 1;
  int _subsum = 0;
  Entry _currentEntry = Entry('', 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    listOfEntries.add(EntryRow(widget.mybill));
                  });
                },
              ),
            ],
          ),
          Container(
            color: Colors.blueGrey[50],
            height: 500,
            child: ListView(
              children: [...listOfEntries],
            ),
          ),

          //...listOfEntries,
          Container(
            width: double.infinity,
            height: 55,
            color: Color.fromARGB(247, 196, 190, 129),
            child: TextButton(
              onPressed: () {},
              child: Text('Submit!'),
            ),
          ),
          // widget.mybill.entries
        ],
      ),
    );
  }
}

class EntryRow extends StatefulWidget {
  Bill mybill;

  EntryRow(this.mybill);
  @override
  @override
  State<EntryRow> createState() => _EntryRowState();
}

class _EntryRowState extends State<EntryRow> {
  List<Widget> _listOfEntries = [];
  String hintTitle = 'title';
  int _quality = 1;

  int _subsum = 0;
  Entry _currentEntry = Entry('', 0, 0);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton(
          hint: Text(hintTitle),
          items: widget.mybill.entries.map((e) {
            return DropdownMenuItem(
              value: e.title,
              child: Text(e.title),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              _currentEntry = widget.mybill.entries
                  .where((element) => element.title == val)
                  .first;
              print('${_currentEntry.price}');
              hintTitle = val.toString();
            });
          },
        ),
        InkWell(
            child: Container(
              child: Text('-'),
              color: Colors.red[200],
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(8),
            ),
            onTap: () {
              setState(() {
                _quality -= 1;
              });
            }),
        Text('$_quality'),
        InkWell(
          child: Container(
            child: Text('+'),
            color: Colors.blue[200],
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(8),
          ),
          onTap: () {
            setState(() {
              _quality += 1;
            });
          },
        ),
        Text('${_currentEntry.price}'),
        SizedBox(width: 16),
        Text('${_currentEntry.price * _quality}'),
        TextButton(
          onPressed: () {
            listOfEntries.add(EntryRow(widget.mybill));
            setState(() {});
          },
          child: Text('GO'),
        ),
      ],
    );
  }
}
