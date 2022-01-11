import './member.dart';
import './entry.dart';

class Bill {
  final String title;
  List<Member> members;
  final List<Entry> entries;
  final DateTime createdTime;

  Bill({
    required this.title,
    this.members = const [],
    required this.createdTime,
    required this.entries,
  });
}
