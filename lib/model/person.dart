// the thinks we need to entered to the database
import 'package:hive_flutter/adapters.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  String contry;

  Person({required this.name, required this.contry});
}
