import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry {
  @HiveField(0)
  String title;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  double price;

  Entry(this.title, this.quantity, this.price);
}
