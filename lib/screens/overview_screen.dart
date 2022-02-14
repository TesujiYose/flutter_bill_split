import 'package:flutter/material.dart';
import 'package:flutter_bill_split/screens/bill_screen.dart';
import 'package:flutter_bill_split/widgets/bill_tile.dart';

import '../data/DUMMY_DATA.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return Scaffold(
      appBar: AppBar(
        title: Text('Login!'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
>>>>>>> 15a3a465992e3360edc8504cf5a4378b69f889a9
          ),
        ),
        itemCount: DUMMY_BILLS.length,
      ),
    );
  }
}
