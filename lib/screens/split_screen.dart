import 'package:flutter/material.dart';
import 'package:flutter_bill_split/data/DUMMY_DATA.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/models/entry.dart';
import 'package:flutter_bill_split/models/subbill.dart';

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
                    var _currentid = 0;
                    dummy_members.asMap().forEach((key, value) {
                      if (val.toString() == value) {
                        _currentid = key;
                      }
                    });
                    ScreenData._currentSubbill.member.id = '$_currentid';
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
              onPressed: () {
                DUMMY_SUBBILLS.add(ScreenData._currentSubbill);
              },
              child: Text('Submit!'),
            ),
          ),
          // widget.mybill.entries
        ],
      ),
    );
  }
}

class ScreenData {
  static SubBill _currentSubbill = SubBill(
      createdTime: DateTime.now(), entries: [], member: dummy_members[0]);
}

class EntryRow extends StatefulWidget {
  Bill mybill;

  EntryRow(this.mybill);

  @override
  State<EntryRow> createState() => _EntryRowState();
}

class _EntryRowState extends State<EntryRow> {
  String hintTitle = 'title';
  int _quality = 1;
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
              hintTitle = val.toString();
            });
          },
        ),
        InkWell(
            child: Container(
              child: const Text('-'),
              color: Colors.red[200],
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(8),
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
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(8),
          ),
          onTap: () {
            setState(() {
              _quality += 1;
            });
          },
        ),
        Text('${_currentEntry.price}'),
        const SizedBox(width: 16),
        Text('${_currentEntry.price * _quality}'),
        TextButton(
          onPressed: () {
            listOfEntries.add(EntryRow(widget.mybill));
            ScreenData._currentSubbill.entries.add(_currentEntry);
            setState(() {});
          },
          child: const Text('SAVE'),
        ),
      ],
    );
  }
}
