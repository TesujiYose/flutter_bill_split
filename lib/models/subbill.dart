import './member.dart';
import './entry.dart';
import 'package:hive/hive.dart';

part 'subbill.g.dart';

@HiveType(typeId: 0)
class SubBill {
  @HiveField(0)
  final Member member;
  @HiveField(1)
  final List<Entry> entries;

  SubBill({
    required this.member,
    required this.entries,
  });
}
