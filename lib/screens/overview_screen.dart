import 'package:flutter/material.dart';
import 'package:flutter_bill_split/screens/bill_screen.dart';
import 'package:flutter_bill_split/widgets/bill_tile.dart';

import '../data/DUMMY_DATA.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, i) => Container(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BillScreen(DUMMY_BILLS[i]),
                ),
              );
            },
            child: BillTile(DUMMY_BILLS[i]),
          ),
        ),
        itemCount: DUMMY_BILLS.length,
      ),
    );
  }
}
