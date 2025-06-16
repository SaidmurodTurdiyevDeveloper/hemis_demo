import 'gender_entity.dart';

class FacultyEntity {
  final int id;
  final String name;
  final String code;
  final GenderEntity structureType;
  final GenderEntity localityType;
  final int parent;
  final bool active;

  FacultyEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.structureType,
    required this.localityType,
    required this.parent,
    required this.active,
  });
}
