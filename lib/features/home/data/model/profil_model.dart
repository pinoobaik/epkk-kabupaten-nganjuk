class ProfilResponse {
  final int statusCode;
  final String message;
  final List<Profil> data;
  final ErrorMessage? error;

  ProfilResponse({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory ProfilResponse.fromJson(Map<String, dynamic> json) {
  // Handle null data field
  List<Profil> dataList = [];
  if (json['data'] != null && json['data'] is List) {
    dataList = (json['data'] as List).map((item) {
      return Profil.fromJson(item as Map<String, dynamic>);
    }).toList();
  }

  return ProfilResponse(
    statusCode: json['statusCode'] ?? 200,
    message: json['message'] ?? '',
    data: dataList, // Pastikan selalu List meski kosong
    error: json['error'] != null 
        ? ErrorMessage.fromJson(json['error']) 
        : null,
  );
}
}

class Profil {
  final String id;
  final String uuid;
  final String phoneNumber;
  final String fullName;
  final String? password; // Diubah menjadi nullable
  final String kodeOtp;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idSubdistrict;
  final String idVillage;
  final String idRole;
  final String idOrganization;

  Profil({
    required this.id,
    required this.uuid,
    required this.phoneNumber,
    required this.fullName,
    this.password, // Tidak wajib di constructor
    required this.kodeOtp,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.idSubdistrict,
    required this.idVillage,
    required this.idRole,
    required this.idOrganization,
  });

  // Untuk GET data dari server
factory Profil.fromJson(Map<String, dynamic> json) {
  return Profil(
    id: json['id']?.toString() ?? '0', // Handle null dan konversi ke int
    uuid: json['uuid']?.toString() ?? '',
    phoneNumber: json['phone_number']?.toString() ?? '', // Perhatikan snake_case
    fullName: json['full_name']?.toString() ?? '',
    status: json['status']?.toString() ?? '',
    createdAt: DateTime.parse(json['created_at']?.toString() ?? DateTime.now().toString()),
    updatedAt: DateTime.parse(json['updated_at']?.toString() ?? DateTime.now().toString()),
    idSubdistrict: json['id_subdistrict']?.toString() ?? '0',
    idVillage: json['id_village']?.toString() ?? '0',
    idRole: json['id_role']?.toString() ?? '0',
    idOrganization: json['id_organization']?.toString() ?? '0',
    // Field optional/tidak ada di response
    password: '',
    kodeOtp: '',
  );
}

  // Untuk UPDATE data ke server (partial update)
  Map<String, dynamic> toUpdateJson({
    bool includeNameAndPhone = false,
    bool includePassword = false,
    String? currentPassword,
  }) {
    assert(!includePassword || currentPassword != null, 
        'Current password required for password update');

    final data = <String, dynamic>{'id': id};

    if (includeNameAndPhone) {
      data.addAll({
        'full_name': fullName,
        'phone_number': phoneNumber,
      });
    }

    if (includePassword) {
      data.addAll({
        'current_password': currentPassword,
        'new_password': password,
      });
    }

    return data;
  }

  // Helper untuk parsing tanggal yang aman
  static DateTime _parseDateTime(dynamic date) {
    try {
      return DateTime.parse(date.toString());
    } catch (_) {
      return DateTime.now();
    }
  }

  // CopyWith untuk update partial di Flutter
  Profil copyWith({
    String? fullName,
    String? phoneNumber,
    String? password,
  }) {
    return Profil(
      id: id,
      uuid: uuid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      kodeOtp: kodeOtp,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      idSubdistrict: idSubdistrict,
      idVillage: idVillage,
      idRole: idRole,
      idOrganization: idOrganization,
    );
  }
}

class ErrorMessage {
  final String message;
  final int? code; // Ditambahkan untuk error code

  ErrorMessage({required this.message, this.code});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      message: json['message'] ?? 'Unknown error',
      code: json['code'],
    );
  }
}