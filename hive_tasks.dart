import 'package:hive/hive.dart';

part 'hive_tasks.g.dart';

@HiveType(typeId: 1)
class hive_tasks {
  hive_tasks({
    required this.name,
    required this.desc,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;
}
