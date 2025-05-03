import 'package:e_pkk_nganjuk/features/home/data/model/report_pangan_model.dart';
import 'package:e_pkk_nganjuk/repositories/pangan_repository.dart';

class PanganUsecase {
  final PanganRepository repository;

  PanganUsecase({required this.repository});

  Future<ReportPanganModel> submitDataPangan({
    required String idUser,
    required String beras,
    required String nonBeras,
    required String peternakan,
    required String perikanan,
    required String warungHidup,
    required String lumbungHidup,
    required String toga,
    required String tanamanKeras,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitDataPangan(
      idUser: idUser,
      beras: beras,
      nonBeras: nonBeras,
      peternakan: peternakan,
      perikanan: perikanan,
      warungHidup: warungHidup,
      lumbungHidup: lumbungHidup,
      toga: toga,
      tanamanKeras: tanamanKeras,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}