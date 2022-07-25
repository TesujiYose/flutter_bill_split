import 'package:flutter/material.dart';
import 'package:flutter_bill_split/models/bill.dart';
import 'package:flutter_bill_split/screens/bill_create_screen.dart';
import 'package:flutter_bill_split/screens/bill_screen.dart';
import 'package:flutter_bill_split/widgets/bill_tile.dart';

import '../data/DUMMY_DATA.dart';

class BillHisoryScreen extends StatefulWidget {
  const BillHisoryScreen({Key? key}) : super(key: key);

  @override
  State<BillHisoryScreen> createState() => _BillHisoryScreenState();
}

class _BillHisoryScreenState extends State<BillHisoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
              Text('Previous bill\'s'),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
            IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillCreateScreen(),
                    ),
                  );
                  setState(() {});
                },
                icon: Icon(Icons.add)),
          ]),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) => Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillScreen(DUMMY_BILLS[i]),
                  ),
                ).then((value) => setState(() {}));
              },
              child: BillTile(DUMMY_BILLS[i]),
            ),
          ),
          itemCount: DUMMY_BILLS.length,
        ),
      ),
    );
  }
}
