import 'package:hive/hive.dart';
part 'member.g.dart';

@HiveType(typeId: 0)
class Member {
  @HiveField(0)
  String name;
  @HiveField(1)
  String id;

  Member(
    this.name,
    this.id,
  );
}
