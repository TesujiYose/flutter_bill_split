import './member.dart';
import './entry.dart';

class SubBill {
  final Member member;
  final List<Entry> entries;
  final DateTime createdTime;

  SubBill({
    required this.member,
    required this.createdTime,
    required this.entries,
  });
}
