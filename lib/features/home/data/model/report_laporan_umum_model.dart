class ReportUmumModel {
  final int statusCode;
  final String message;
  final UmumEntry? data;
  final ErrorMessage? error;

  ReportUmumModel({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory ReportUmumModel.fromJson(Map<String, dynamic> json) {
    return ReportUmumModel(
      statusCode: json['statusCode'] ?? 500,
      message: json['message'] ?? 'Unknown error',
      data: json['data'] != null ? UmumEntry.fromJson(json['data']) : null,
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

class UmumEntry {
  final String idLaporanUmum;
  final String uuid;
  final String idUser;
  final String dusunLingkungan;
  final String pkkRw;
  final String desaWisma;
  final String krt;
  final String kk;
  final String jiwaLaki;
  final String jiwaPerempuan;
  final String anggotaLaki;
  final String anggotaPerempuan;
  final String umumLaki;
  final String umumPerempuan;
  final String khususLaki;
  final String khususPerempuan;
  final String honorerLaki;
  final String honorerPerempuan;
  final String bantuanLaki;
  final String bantuanPerempuan;
  final String? catatan;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Role role;
  final Organization organization;

  UmumEntry({
    required this.idLaporanUmum,
    required this.uuid,
    required this.idUser,
    required this.dusunLingkungan,
    required this.pkkRw,
    required this.desaWisma,
    required this.krt,
    required this.kk,
    required this.jiwaLaki,
    required this.jiwaPerempuan,
    required this.anggotaLaki,
    required this.anggotaPerempuan,
    required this.umumLaki,
    required this.umumPerempuan,
    required this.khususLaki,
    required this.khususPerempuan,
    required this.honorerLaki,
    required this.honorerPerempuan,
    required this.bantuanLaki,
    required this.bantuanPerempuan,
    this.catatan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.organization,
  });

  factory UmumEntry.fromJson(Map<String, dynamic> json) {
    if (json['role'] == null || json['organization'] == null) {
      throw Exception('Missing required fields: role or organization');
    }

    return UmumEntry(
      idLaporanUmum: json['id_laporan_umum'] ?? '',
      uuid: json['uuid'] ?? '',
      idUser: json['id_user'] ?? '',
      dusunLingkungan: json['dusun_lingkungan'] ?? '',
      pkkRw: json['PKK_RW'] ?? '',
      desaWisma: json['desa_wisma'] ?? '',
      krt: json['KRT'] ?? '0',
      kk: json['KK'] ?? '0',
      jiwaLaki: json['jiwa_laki'] ?? '0',
      jiwaPerempuan: json['jiwa_perempuan'] ?? '0',
      anggotaLaki: json['anggota_laki'] ?? '0',
      anggotaPerempuan: json['anggota_perempuan'] ?? '0',
      umumLaki: json['umum_laki'] ?? '0',
      umumPerempuan: json['umum_perempuan'] ?? '0',
      khususLaki: json['khusus_laki'] ?? '0',
      khususPerempuan: json['khusus_perempuan'] ?? '0',
      honorerLaki: json['honorer_laki'] ?? '0',
      honorerPerempuan: json['honorer_perempuan'] ?? '0',
      bantuanLaki: json['bantuan_laki'] ?? '0',
      bantuanPerempuan: json['bantuan_perempuan'] ?? '0',
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
      'id_laporan_umum': idLaporanUmum,
      'uuid': uuid,
      'id_user': idUser,
      'dusun_lingkungan': dusunLingkungan,
      'PKK_RW': pkkRw,
      'desa_wisma': desaWisma,
      'KRT': krt,
      'KK': kk,
      'jiwa_laki': jiwaLaki,
      'jiwa_perempuan': jiwaPerempuan,
      'anggota_laki': anggotaLaki,
      'anggota_perempuan': anggotaPerempuan,
      'umum_laki': umumLaki,
      'umum_perempuan': umumPerempuan,
      'khusus_laki': khususLaki,
      'khusus_perempuan': khususPerempuan,
      'honorer_laki': honorerLaki,
      'honorer_perempuan': honorerPerempuan,
      'bantuan_laki': bantuanLaki,
      'bantuan_perempuan': bantuanPerempuan,
      'catatan': catatan,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'role': role.toJson(),
      'organization': organization.toJson(),
    };
  }
}

// Role, Organization, dan ErrorMessage class sama seperti sebelumnya
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