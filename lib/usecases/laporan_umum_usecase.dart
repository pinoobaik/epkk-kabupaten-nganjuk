import 'package:e_pkk_nganjuk/features/home/data/model/report_laporan_umum_model.dart';
import 'package:e_pkk_nganjuk/repositories/laporan_umum_repository.dart';

class CreateUmumUsecase {
  final UmumRepository repository;

  CreateUmumUsecase({required this.repository});

  Future<ReportUmumModel> execute({
    required String id_user,
    required String dusun_lingkungan,
    required String PKK_RW,
    required String desa_wisma,
    required String KRT,
    required String KK,
    required String jiwa_laki,
    required String jiwa_perempuan,
    required String anggota_laki,
    required String anggota_perempuan,
    required String umum_laki,
    required String umum_perempuan,
    required String khusus_laki,
    required String khusus_perempuan,
    required String honorer_laki,
    required String honorer_perempuan,
    required String bantuan_laki,
    required String bantuan_perempuan,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    return await repository.postUmumData(
      id_user: id_user,
      dusun_lingkungan: dusun_lingkungan,
      PKK_RW: PKK_RW,
      desa_wisma: desa_wisma,
      KRT: KRT,
      KK: KK,
      jiwa_laki: jiwa_laki,
      jiwa_perempuan: jiwa_perempuan,
      anggota_laki: anggota_laki,
      anggota_perempuan: anggota_perempuan,
      umum_laki: umum_laki,
      umum_perempuan: umum_perempuan,
      khusus_laki: khusus_laki,
      khusus_perempuan: khusus_perempuan,
      honorer_laki: honorer_laki,
      honorer_perempuan: honorer_perempuan,
      bantuan_laki: bantuan_laki,
      bantuan_perempuan: bantuan_perempuan,
      id_role: id_role,
      id_organization: id_organization,
      catatan: catatan,
    );
  }
}