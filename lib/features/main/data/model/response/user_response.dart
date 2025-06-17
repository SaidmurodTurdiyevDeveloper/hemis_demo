class UserResponse {
  bool? success;
  dynamic error;
  UserResponseData? data;
  int? code;

  UserResponse({this.success, this.error, this.data, this.code});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? UserResponseData.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class UserResponseData {
  String? firstName;
  String? secondName;
  String? thirdName;
  String? fullName;
  String? shortName;
  String? studentIdNumber;
  String? image;
  int? birthDate;
  String? passportPin;
  String? passportNumber;
  String? email;
  String? phone;
  UserResponseGender? gender;
  String? university;
  UserResponseSpecialty? specialty;
  UserResponseGender? studentStatus;
  UserResponseGender? educationForm;
  UserResponseGender? educationType;
  UserResponseGender? paymentForm;
  UserResponseGroup? group;
  UserResponseFaculty? faculty;
  UserResponseGender? educationLang;
  UserResponseGender? level;
  UserResponseSemester? semester;
  String? avgGpa;
  bool? passwordValid;
  String? address;
  UserResponseGender? country;
  UserResponseProvince? province;
  UserResponseProvince? district;
  UserResponseGender? socialCategory;
  UserResponseGender? accommodation;
  String? validateUrl;
  String? hash;

  UserResponseData({
    this.firstName,
    this.secondName,
    this.thirdName,
    this.fullName,
    this.shortName,
    this.studentIdNumber,
    this.image,
    this.birthDate,
    this.passportPin,
    this.passportNumber,
    this.email,
    this.phone,
    this.gender,
    this.university,
    this.specialty,
    this.studentStatus,
    this.educationForm,
    this.educationType,
    this.paymentForm,
    this.group,
    this.faculty,
    this.educationLang,
    this.level,
    this.semester,
    this.avgGpa,
    this.passwordValid,
    this.address,
    this.country,
    this.province,
    this.district,
    this.socialCategory,
    this.accommodation,
    this.validateUrl,
    this.hash,
  });

  UserResponseData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    secondName = json['second_name'];
    thirdName = json['third_name'];
    fullName = json['full_name'];
    shortName = json['short_name'];
    studentIdNumber = json['student_id_number'];
    image = json['image'];
    birthDate = json['birth_date'];
    passportPin = json['passport_pin'];
    passportNumber = json['passport_number'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'] != null ? UserResponseGender.fromJson(json['gender']) : null;
    university = json['university'];
    specialty = json['specialty'] != null ? UserResponseSpecialty.fromJson(json['specialty']) : null;
    studentStatus = json['studentStatus'] != null ? UserResponseGender.fromJson(json['studentStatus']) : null;
    educationForm = json['educationForm'] != null ? UserResponseGender.fromJson(json['educationForm']) : null;
    educationType = json['educationType'] != null ? UserResponseGender.fromJson(json['educationType']) : null;
    paymentForm = json['paymentForm'] != null ? UserResponseGender.fromJson(json['paymentForm']) : null;
    group = json['group'] != null ? UserResponseGroup.fromJson(json['group']) : null;
    faculty = json['faculty'] != null ? UserResponseFaculty.fromJson(json['faculty']) : null;
    educationLang = json['educationLang'] != null ? UserResponseGender.fromJson(json['educationLang']) : null;
    level = json['level'] != null ? UserResponseGender.fromJson(json['level']) : null;
    semester = json['semester'] != null ? UserResponseSemester.fromJson(json['semester']) : null;
    avgGpa = json['avg_gpa'];
    passwordValid = json['password_valid'];
    address = json['address'];
    country = json['country'] != null ? UserResponseGender.fromJson(json['country']) : null;
    province = json['province'] != null ? UserResponseProvince.fromJson(json['province']) : null;
    district = json['district'] != null ? UserResponseProvince.fromJson(json['district']) : null;
    socialCategory = json['socialCategory'] != null ? UserResponseGender.fromJson(json['socialCategory']) : null;
    accommodation = json['accommodation'] != null ? UserResponseGender.fromJson(json['accommodation']) : null;
    validateUrl = json['validateUrl'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['third_name'] = thirdName;
    data['full_name'] = fullName;
    data['short_name'] = shortName;
    data['student_id_number'] = studentIdNumber;
    data['image'] = image;
    data['birth_date'] = birthDate;
    data['passport_pin'] = passportPin;
    data['passport_number'] = passportNumber;
    data['email'] = email;
    data['phone'] = phone;
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    data['university'] = university;
    if (specialty != null) {
      data['specialty'] = specialty!.toJson();
    }
    if (studentStatus != null) {
      data['studentStatus'] = studentStatus!.toJson();
    }
    if (educationForm != null) {
      data['educationForm'] = educationForm!.toJson();
    }
    if (educationType != null) {
      data['educationType'] = educationType!.toJson();
    }
    if (paymentForm != null) {
      data['paymentForm'] = paymentForm!.toJson();
    }
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (faculty != null) {
      data['faculty'] = faculty!.toJson();
    }
    if (educationLang != null) {
      data['educationLang'] = educationLang!.toJson();
    }
    if (level != null) {
      data['level'] = level!.toJson();
    }
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    data['avg_gpa'] = avgGpa;
    data['password_valid'] = passwordValid;
    data['address'] = address;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (socialCategory != null) {
      data['socialCategory'] = socialCategory!.toJson();
    }
    if (accommodation != null) {
      data['accommodation'] = accommodation!.toJson();
    }
    data['validateUrl'] = validateUrl;
    data['hash'] = hash;
    return data;
  }
}

class UserResponseGender {
  String? code;
  String? name;

  UserResponseGender({this.code, this.name});

  UserResponseGender.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class UserResponseSpecialty {
  String? id;
  String? code;
  String? name;

  UserResponseSpecialty({this.id, this.code, this.name});

  UserResponseSpecialty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class UserResponseGroup {
  int? id;
  String? name;
  UserResponseGender? educationLang;

  UserResponseGroup({this.id, this.name, this.educationLang});

  UserResponseGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    educationLang = json['educationLang'] != null ? UserResponseGender.fromJson(json['educationLang']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (educationLang != null) {
      data['educationLang'] = educationLang!.toJson();
    }
    return data;
  }
}

class UserResponseFaculty {
  int? id;
  String? name;
  String? code;
  UserResponseGender? structureType;
  UserResponseGender? localityType;
  int? parent;
  bool? active;

  UserResponseFaculty({this.id, this.name, this.code, this.structureType, this.localityType, this.parent, this.active});

  UserResponseFaculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    structureType = json['structureType'] != null ? UserResponseGender.fromJson(json['structureType']) : null;
    localityType = json['localityType'] != null ? UserResponseGender.fromJson(json['localityType']) : null;
    parent = json['parent'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    if (structureType != null) {
      data['structureType'] = structureType!.toJson();
    }
    if (localityType != null) {
      data['localityType'] = localityType!.toJson();
    }
    data['parent'] = parent;
    data['active'] = active;
    return data;
  }
}

class UserResponseSemester {
  int? id;
  String? code;
  String? name;
  bool? current;
  UserResponseEducationYear? educationYear;

  UserResponseSemester({this.id, this.code, this.name, this.current, this.educationYear});

  UserResponseSemester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    current = json['current'];
    educationYear = json['education_year'] != null ? UserResponseEducationYear.fromJson(json['education_year']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['current'] = current;
    if (educationYear != null) {
      data['education_year'] = educationYear!.toJson();
    }
    return data;
  }
}

class UserResponseEducationYear {
  String? code;
  String? name;
  bool? current;

  UserResponseEducationYear({this.code, this.name, this.current});

  UserResponseEducationYear.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['current'] = current;
    return data;
  }
}

class UserResponseProvince {
  String? code;
  String? name;
  String? sParent;

  UserResponseProvince({this.code, this.name, this.sParent});

  UserResponseProvince.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    sParent = json['_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['_parent'] = sParent;
    return data;
  }
}
