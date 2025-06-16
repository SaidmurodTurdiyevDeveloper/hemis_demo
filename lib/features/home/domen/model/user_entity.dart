import 'package:hemis_demo/features/home/domen/model/faculty_entity.dart';
import 'package:hemis_demo/features/home/domen/model/gender_entity.dart';
import 'package:hemis_demo/features/home/domen/model/group_entity.dart';
import 'package:hemis_demo/features/home/domen/model/province_entity.dart';
import 'package:hemis_demo/features/home/domen/model/semester_entity.dart';
import 'package:hemis_demo/features/home/domen/model/specialty_entity.dart';

class UserEntity {
  final String firstName;
  final String secondName;
  final String thirdName;
  final String fullName;
  final String shortName;
  final String studentIdNumber;
  final String image;
  final int birthDate;
  final String passportPin;
  final String passportNumber;
  final String email;
  final String phone;
  final GenderEntity gender;
  final String university;
  final SpecialtyEntity specialty;
  final GenderEntity studentStatus;
  final GenderEntity educationForm;
  final GenderEntity educationType;
  final GenderEntity paymentForm;
  final GroupEntity group;
  final FacultyEntity faculty;
  final GenderEntity educationLang;
  final GenderEntity level;
  final SemesterEntity semester;
  final String avgGpa;
  final bool passwordValid;
  final String address;
  final GenderEntity country;
  final ProvinceEntity province;
  final ProvinceEntity district;
  final GenderEntity socialCategory;
  final GenderEntity accommodation;
  final String validateUrl;
  final String hash;

  UserEntity({
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.fullName,
    required this.shortName,
    required this.studentIdNumber,
    required this.image,
    required this.birthDate,
    required this.passportPin,
    required this.passportNumber,
    required this.email,
    required this.phone,
    required this.gender,
    required this.university,
    required this.specialty,
    required this.studentStatus,
    required this.educationForm,
    required this.educationType,
    required this.paymentForm,
    required this.group,
    required this.faculty,
    required this.educationLang,
    required this.level,
    required this.semester,
    required this.avgGpa,
    required this.passwordValid,
    required this.address,
    required this.country,
    required this.province,
    required this.district,
    required this.socialCategory,
    required this.accommodation,
    required this.validateUrl,
    required this.hash,
  });
}
