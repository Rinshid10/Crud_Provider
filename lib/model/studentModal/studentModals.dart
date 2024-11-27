import 'package:hive/hive.dart';
part 'studentModals.g.dart';

@HiveType(typeId: 0)
class studentModal {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;
  @HiveField(2)
  String? image;
  studentModal({required this.name, required this.age, this.image});
}
