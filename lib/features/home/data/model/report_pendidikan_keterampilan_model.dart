class ReportPendidikanKeterampilanModel {
  final int statusCode;
  final String message;
  final PendidikanKeterampilanEntry? data;
  final ErrorMessage? error;

  ReportPendidikanKeterampilanModel({
    required this.statusCode,
    required this.message,
    required this.data,
    this.error,
  });

  factory ReportPendidikanKeterampilanModel.fromJson(Map<String, dynamic> json) {
    return ReportPendidikanKeterampilanModel(
      statusCode: json['statusCode'] ?? 500,
      message: json['message'] ?? 'Unknown error',
      data: json['data'] != null ? PendidikanKeterampilanEntry.fromJson(json['data']) : null,
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

class PendidikanKeterampilanEntry {
  final String idPokja2Bidang1;
  final String uuid;
  final String idUser;
  final String wargaButa;
  final String kelBelajarA;
  final String wargaBelajarA;
  final String kelBelajarB;
  final String wargaBelajarB;
  final String kelBelajarC;
  final String wargaBelajarC;
  final String kelBelajarKF;
  final String wargaBelajarKF;
  final String paud;
  final String tamanBacaan;
  final String jumlahKlp;
  final String jumlahLbuPeserta;
  final String jumlahApe;
  final String jumlahKelSimulasi;
  final String kf;
  final String paudTutor;
  final String bkb;
  final String koperasi;
  final String ketrampilan;
  final String lp3pkk;
  final String tp3pkk;
  final String damasPkk;
  final String? catatan;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Role role;
  final Organization organization;

  PendidikanKeterampilanEntry({
    required this.idPokja2Bidang1,
    required this.uuid,
    required this.idUser,
    required this.wargaButa,
    required this.kelBelajarA,
    required this.wargaBelajarA,
    required this.kelBelajarB,
    required this.wargaBelajarB,
    required this.kelBelajarC,
    required this.wargaBelajarC,
    required this.kelBelajarKF,
    required this.wargaBelajarKF,
    required this.paud,
    required this.tamanBacaan,
    required this.jumlahKlp,
    required this.jumlahLbuPeserta,
    required this.jumlahApe,
    required this.jumlahKelSimulasi,
    required this.kf,
    required this.paudTutor,
    required this.bkb,
    required this.koperasi,
    required this.ketrampilan,
    required this.lp3pkk,
    required this.tp3pkk,
    required this.damasPkk,
    this.catatan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.organization,
  });

  factory PendidikanKeterampilanEntry.fromJson(Map<String, dynamic> json) {
    if (json['role'] == null || json['organization'] == null) {
      throw Exception('Missing required fields: role or organization');
    }

    return PendidikanKeterampilanEntry(
      idPokja2Bidang1: json['id_pokja2_bidang1'] ?? '',
      uuid: json['uuid'] ?? '',
      idUser: json['id_user'] ?? '',
      wargaButa: json['warga_buta'] ?? '',
      kelBelajarA: json['kel_belajarA'] ?? '',
      wargaBelajarA: json['warga_belajarA'] ?? '',
      kelBelajarB: json['kel_belajarB'] ?? '',
      wargaBelajarB: json['warga_belajarB'] ?? '',
      kelBelajarC: json['kel_belajarC'] ?? '',
      wargaBelajarC: json['warga_belajarC'] ?? '',
      kelBelajarKF: json['kel_belajarKF'] ?? '',
      wargaBelajarKF: json['warga_belajarKF'] ?? '',
      paud: json['paud'] ?? '',
      tamanBacaan: json['taman_bacaan'] ?? '',
      jumlahKlp: json['jumlah_klp'] ?? '',
      jumlahLbuPeserta: json['jumlah_lbu_peserta'] ?? '',
      jumlahApe: json['jumlah_ape'] ?? '',
      jumlahKelSimulasi: json['jumlah_kel_simulasi'] ?? '',
      kf: json['KF'] ?? '',
      paudTutor: json['paud_tutor'] ?? '',
      bkb: json['BKB'] ?? '',
      koperasi: json['koperasi'] ?? '',
      ketrampilan: json['ketrampilan'] ?? '',
      lp3pkk: json['LP3PKK'] ?? '',
      tp3pkk: json['TP3PKK'] ?? '',
      damasPkk: json['damas_pkk'] ?? '',
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
      'id_pokja2_bidang1': idPokja2Bidang1,
      'uuid': uuid,
      'id_user': idUser,
      'warga_buta': wargaButa,
      'kel_belajarA': kelBelajarA,
      'warga_belajarA': wargaBelajarA,
      'kel_belajarB': kelBelajarB,
      'warga_belajarB': wargaBelajarB,
      'kel_belajarC': kelBelajarC,
      'warga_belajarC': wargaBelajarC,
      'kel_belajarKF': kelBelajarKF,
      'warga_belajarKF': wargaBelajarKF,
      'paud': paud,
      'taman_bacaan': tamanBacaan,
      'jumlah_klp': jumlahKlp,
      'jumlah_lbu_peserta': jumlahLbuPeserta,
      'jumlah_ape': jumlahApe,
      'jumlah_kel_simulasi': jumlahKelSimulasi,
      'KF': kf,
      'paud_tutor': paudTutor,
      'BKB': bkb,
      'koperasi': koperasi,
      'ketrampilan': ketrampilan,
      'LP3PKK': lp3pkk,
      'TP3PKK': tp3pkk,
      'damas_pkk': damasPkk,
      'catatan': catatan,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'role': role.toJson(),
      'organization': organization.toJson(),
    };
  }
}

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