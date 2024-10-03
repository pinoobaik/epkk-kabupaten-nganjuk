class ReportKaderPokja1Model {
  final int kode;
  final String message;
  final KaderPokja1Entry? data;

  ReportKaderPokja1Model({
    required this.kode,
    required this.message,
    required this.data,
  });

  factory ReportKaderPokja1Model.fromJson(Map<String, dynamic> json) {
    return ReportKaderPokja1Model(
      kode: json['kode'],
      message: json['message'],
      data:
          json['data'] != null ? KaderPokja1Entry.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kode': kode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class KaderPokja1Entry {
  final String idKaderPokja1;
  final String idUser;
  final String pkbn;
  final String pkdrt;
  final String polaAsuh;
  final String? catatan;
  final String status;
  final String tanggal;
  final String waktu;
  final String role;
  final String roleBidang;
  final String createdAt;
  final String? updatedAt;

  KaderPokja1Entry({
    required this.idKaderPokja1,
    required this.idUser,
    required this.pkbn,
    required this.pkdrt,
    required this.polaAsuh,
    this.catatan,
    required this.status,
    required this.tanggal,
    required this.waktu,
    required this.role,
    required this.roleBidang,
    required this.createdAt,
    this.updatedAt,
  });

  factory KaderPokja1Entry.fromJson(Map<String, dynamic> json) {
    return KaderPokja1Entry(
      idKaderPokja1: json['id_kader_pokja1'] ?? '',
      idUser: json['id_user'] ?? '',
      pkbn: json['PKBN'] ?? '',
      pkdrt: json['PKDRT'] ?? '',
      polaAsuh: json['pola_asuh'] ?? '',
      catatan: json['catatan'],
      status: json['status'] ?? '',
      tanggal: json['tanggal'] ?? '',
      waktu: json['waktu'] ?? '',
      role: json['role'] ?? '',
      roleBidang: json['role_bidang'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kader_pokja1': idKaderPokja1,
      'id_user': idUser,
      'PKBN': pkbn,
      'PKDRT': pkdrt,
      'pola_asuh': polaAsuh,
      'catatan': catatan,
      'status': status,
      'tanggal': tanggal,
      'waktu': waktu,
      'role': role,
      'role_bidang': roleBidang,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
