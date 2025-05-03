import 'package:e_pkk_nganjuk/features/home/data/model/report_kesehatan_model.dart';
import 'package:e_pkk_nganjuk/repositories/kesehatan_repository.dart';

class KesehatanUsecase {
  final KesehatanRepository repository;

  KesehatanUsecase({required this.repository});

  Future<ReportKesehatanModel> submitKesehatanData({
    required String idUser,
    required String jumlahPosyandu,
    required String jumlahPosyanduIterasi,
    required String jumlahKip,
    required String jumlahAnggota,
    required String jumlahKartuGratis,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.postKesehatanData(
      id_user: idUser,
      jumlah_posyandu: jumlahPosyandu,
      jumlah_posyandu_iterasi: jumlahPosyanduIterasi,
      jumlah_kip: jumlahKip,
      jumlah_anggota: jumlahAnggota,
      jumlah_kartu_gratis: jumlahKartuGratis,
      id_role: idRole,
      id_organization: idOrganization,
      catatan: catatan,
    );
  }
}