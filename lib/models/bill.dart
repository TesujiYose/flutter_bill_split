import 'package:flutter_bill_split/models/subbill.dart';

import './member.dart';
import './entry.dart';

import 'package:hive/hive.dart';

part 'bill.g.dart';

@HiveType(typeId: 0)
class Bill {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final DateTime createdTime;
  @HiveField(3)
  List<Member> members;
  @HiveField(4)
  List<Entry> entries;
  @HiveField(5)
  List<SubBill> subBills;

  Bill({
    required this.title,
    required this.id,
    required this.createdTime,
    this.members = const [],
    this.entries = const [],
    this.subBills = const [],
  });
}
