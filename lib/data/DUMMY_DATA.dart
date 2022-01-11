import '../models/bill.dart';
import '../models/entry.dart';
import '../models/member.dart';

final List<Member> dummy_members = [
  Member('Yurii', '1'),
  Member('Roman', '2'),
  Member('Arthur', '3'),
  Member('Valentino', '4'),
];

List<Entry> DUMMY_ENTRIES1 = [
  Entry('Kibler IPA 0.5', 8, 45.0),
  Entry('Kronenburg Blanc 0.5', 2, 55.0),
  Entry('Burger Secretniy', 1, 160.0),
  Entry('Chicken Shawarma', 3, 99.0),
  Entry('Hot Set', 1, 250),
  Entry('Nastoyka Svyatkova', 10, 40.0),
  Entry('Nastoyka Smorodina', 10, 30.0),
];

List<Entry> DUMMY_ENTRIES2 = [
  Entry('Kibler IPA 0.5', 8, 45.0),
  Entry('Kronenburg Blanc 0.5', 2, 55.0),
  Entry('Hashpar 0.5', 15, 38.0),
];

List<Bill> DUMMY_BILLS = [
  Bill(
      title: 'Ostap',
      createdTime: DateTime.parse('2021-11-13 01:01:00.000'),
      entries: DUMMY_ENTRIES1,
      members: [
        dummy_members[0],
        dummy_members[1],
        dummy_members[2],
      ]),
  Bill(
      title: 'Pub house',
      createdTime: DateTime.parse('2021-11-14 01:01:00.000'),
      entries: DUMMY_ENTRIES2,
      members: [
        dummy_members[1],
        dummy_members[2],
        dummy_members[3],
      ]),
  Bill(
      title: 'Godynka',
      createdTime: DateTime.parse('2021-11-25 01:01:00.000'),
      entries: DUMMY_ENTRIES2,
      members: [
        dummy_members[2],
        dummy_members[3],
      ]),
];
