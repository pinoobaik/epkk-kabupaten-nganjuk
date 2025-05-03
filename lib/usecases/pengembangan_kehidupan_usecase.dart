import 'package:e_pkk_nganjuk/features/home/data/model/report_pengembangan_kehidupan_model.dart';
import 'package:e_pkk_nganjuk/repositories/pengembangan_kehidupan_repository.dart';

class PengembanganKehidupanUsecase {
  final PengembanganKehidupanRepository repository;

  PengembanganKehidupanUsecase({required this.repository});

  Future<ReportPengembanganKehidupanModel> execute({
    required String idUser,
    required String jumlahKelompokPemula,
    required String jumlahPesertaPemula,
    required String jumlahKelompokMadya,
    required String jumlahPesertaMadya,
    required String jumlahKelompokUtama,
    required String jumlahPesertaUtama,
    required String jumlahKelompokMandiri,
    required String jumlahPesertaMandiri,
    required String jumlahKelompokHukum,
    required String jumlahPesertaHukum,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitPengembanganKehidupan(
      idUser: idUser,
      jumlahKelompokPemula: jumlahKelompokPemula,
      jumlahPesertaPemula: jumlahPesertaPemula,
      jumlahKelompokMadya: jumlahKelompokMadya,
      jumlahPesertaMadya: jumlahPesertaMadya,
      jumlahKelompokUtama: jumlahKelompokUtama,
      jumlahPesertaUtama: jumlahPesertaUtama,
      jumlahKelompokMandiri: jumlahKelompokMandiri,
      jumlahPesertaMandiri: jumlahPesertaMandiri,
      jumlahKelompokHukum: jumlahKelompokHukum,
      jumlahPesertaHukum: jumlahPesertaHukum,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}