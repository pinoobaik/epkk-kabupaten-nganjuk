class LoginResponse {
  final int? statusCode;
  final String message;
  final UserData? data;
  final String? error;

  LoginResponse({
    required this.statusCode,
    required this.message,
    this.data,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
      'error': error,
    };
  }
}

class UserData {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Subdistrict? subdistrict;
  final Village? village;
  final Role? role;
  final Organization? organization;

  UserData({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.subdistrict,
    this.village,
    this.role,
    this.organization,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      subdistrict: json['subdistrict'] != null ? Subdistrict.fromJson(json['subdistrict']) : null,
      village: json['village'] != null ? Village.fromJson(json['village']) : null,
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      organization: json['organization'] != null ? Organization.fromJson(json['organization']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'subdistrict': subdistrict?.toJson(),
      'village': village?.toJson(),
      'role': role?.toJson(),
      'organization': organization?.toJson(),
    };
  }
}

class Subdistrict {
  final String id;
  final String name;

  Subdistrict({
    required this.id,
    required this.name,
  });

  factory Subdistrict.fromJson(Map<String, dynamic> json) {
    return Subdistrict(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Village {
  final String id;
  final String name;

  Village({
    required this.id,
    required this.name,
  });

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Role {
  final String id;
  final String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Organization {
  final String id;
  final String name;

  Organization({
    required this.id,
    required this.name,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
