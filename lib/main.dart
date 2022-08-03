import 'package:flutter/material.dart';
import 'package:flutter_bill_split/screens/bill_history_screen.dart';

import 'screens/bill_history_screen.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BillHisoryScreen(),
    );
  }
}
