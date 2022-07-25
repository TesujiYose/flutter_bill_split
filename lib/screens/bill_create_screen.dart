import 'package:flutter/material.dart';
import 'package:flutter_bill_split/data/DUMMY_DATA.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/models/entry.dart';
import 'package:flutter_bill_split/models/member.dart';

class BillCreateScreen extends StatefulWidget {
  const BillCreateScreen({Key? key}) : super(key: key);

  @override
  State<BillCreateScreen> createState() => _BillCreateScreenState();
}

class _BillCreateScreenState extends State<BillCreateScreen> {
  final nameController = TextEditingController();
  final memberController = TextEditingController();
  BillData bd = BillData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating bill'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  DotWidget('1'),
                  Text('Enter Name: '),
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: nameController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  DotWidget('2'),
                  Text('Enter Date: _______'),
                ],
              ),
              Row(
                children: [
                  DotWidget('3'),
                  Text('Add members(0123or03):'),
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: memberController,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  DotWidget('4'),
                  Text('Add items to fiels:'),
                ],
              ),
              ...bd.listOfItems,
              TextButton(
                onPressed: () {
                  List<Member> _mems = [];
                  memberController.text.split('').forEach((element) {
                    _mems.add(dummy_members[int.tryParse(element) ?? 0]);
                  });
                  DUMMY_BILLS.add(Bill(
                      title: nameController.text,
                      createdTime: DateTime.now(),
                      entries: BillData.getTries(),
                      members: _mems));
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
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  String _number;
  DotWidget(this._number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[200],
      ),
      child: Center(
          child: Text('$_number.',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    );
  }
}

class BillData {
  static List<Entry> tries = [];
  List<Widget> listOfItems = [EntryRow(), EntryRow(), EntryRow()];
  addItem() {
    listOfItems.add(EntryRow());
  }

  static List<Entry> getTries() {
    return tries;
  }
}

class EntryRow extends StatefulWidget {
  @override
  State<EntryRow> createState() => _EntryRowState();
}

class _EntryRowState extends State<EntryRow> {
  final entryNameController = TextEditingController();
  final entryPriceController = TextEditingController();

  int _quality = 1;

  int _subsum = 0;
  Entry _currentEntry = Entry('', 0, 0);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          child: TextFormField(
            controller: entryNameController,
          ),
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
        Container(
          width: 25,
          child: TextFormField(
            controller: entryPriceController,
          ),
        ),
        SizedBox(width: 16),
        Text('${_currentEntry.price * _quality}'),
        TextButton(
          onPressed: () {
            var x = double.tryParse(entryPriceController.text);
            // BillData().addItem();
            BillData.tries
                .add(Entry(entryNameController.text, _quality, x ?? 0));
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
