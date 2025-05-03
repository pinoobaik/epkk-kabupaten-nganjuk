class ReportKaderPokja3Model {
  final int statusCode;
  final String message;
  final KaderPokja3Entry? data;
  final ErrorMessage? error;

  ReportKaderPokja3Model({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory ReportKaderPokja3Model.fromJson(Map<String, dynamic> json) {
    return ReportKaderPokja3Model(
      statusCode: json['statusCode'] ?? 500,
      message: json['message'] ?? 'Unknown error',
      data: json['data'] != null ? KaderPokja3Entry.fromJson(json['data']) : null,
      error: json['error'] != null ? ErrorMessage.fromJson(json['error']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
      'error': error?.toJson(),
    };
  }
}

class KaderPokja3Entry {
  final String idKaderPokja3;
  final String uuid;
  final String idUser;
  final String pangan;
  final String sandang;
  final String tataLaksanaRumah;
  final String? catatan;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Role role;
  final Organization organization;

  KaderPokja3Entry({
    required this.idKaderPokja3,
    required this.uuid,
    required this.idUser,
    required this.pangan,
    required this.sandang,
    required this.tataLaksanaRumah,
    this.catatan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.organization,
  });

  factory KaderPokja3Entry.fromJson(Map<String, dynamic> json) {
    if (json['role'] == null || json['organization'] == null) {
      throw Exception('Missing required fields: role or organization');
    }

    return KaderPokja3Entry(
      idKaderPokja3: json['id_kader_pokja3'] ?? '',
      uuid: json['uuid'] ?? '',
      idUser: json['id_user'] ?? '',
      pangan: json['pangan'] ?? '',
      sandang: json['sandang'] ?? '',
      tataLaksanaRumah: json['tata_laksana_rumah'] ?? '',
      catatan: json['catatan'],
      status: json['status'] ?? 'Proses',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      role: Role.fromJson(json['role']),
      organization: Organization.fromJson(json['organization']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kader_pokja3': idKaderPokja3,
      'uuid': uuid,
      'id_user': idUser,
      'pangan': pangan,
      'sandang': sandang,
      'tata_laksana_rumah': tataLaksanaRumah,
      'catatan': catatan,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'role': role.toJson(),
      'organization': organization.toJson(),
    };
  }
}

class ErrorMessage {
  final String message;

  ErrorMessage({required this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      message: json['message'] ?? 'Unknown error',
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}

// Role dan Organization class sama seperti sebelumnya
class Role {
  final String id;
  final String uuid;
  final String name;

  Role({
    required this.id,
    required this.uuid,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'].toString(),
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
    };
  }
}

class Organization {
  final String id;
  final String uuid;
  final String name;

  Organization({
    required this.id,
    required this.uuid,
    required this.name,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'].toString(),
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
    };
  }
}