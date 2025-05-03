import 'package:e_pkk_nganjuk/features/home/data/model/report_pendidikan_keterampilan_model.dart';
import 'package:e_pkk_nganjuk/repositories/pendidikan_keterampilan_repository.dart';

class PendidikanKeterampilanUsecase {
  final PendidikanKeterampilanRepository repository;

  PendidikanKeterampilanUsecase({required this.repository});

  Future<ReportPendidikanKeterampilanModel> execute({
    required String idUser,
    required String wargaButa,
    required String kelBelajarA,
    required String wargaBelajarA,
    required String kelBelajarB,
    required String wargaBelajarB,
    required String kelBelajarC,
    required String wargaBelajarC,
    required String kelBelajarKF,
    required String wargaBelajarKF,
    required String paud,
    required String tamanBacaan,
    required String jumlahKlp,
    required String jumlahLbuPeserta,
    required String jumlahApe,
    required String jumlahKelSimulasi,
    required String kf,
    required String paudTutor,
    required String bkb,
    required String koperasi,
    required String ketrampilan,
    required String lp3pkk,
    required String tp3pkk,
    required String damasPkk,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.createPendidikanKeterampilan(
      idUser: idUser,
      wargaButa: wargaButa,
      kelBelajarA: kelBelajarA,
      wargaBelajarA: wargaBelajarA,
      kelBelajarB: kelBelajarB,
      wargaBelajarB: wargaBelajarB,
      kelBelajarC: kelBelajarC,
      wargaBelajarC: wargaBelajarC,
      kelBelajarKF: kelBelajarKF,
      wargaBelajarKF: wargaBelajarKF,
      paud: paud,
      tamanBacaan: tamanBacaan,
      jumlahKlp: jumlahKlp,
      jumlahLbuPeserta: jumlahLbuPeserta,
      jumlahApe: jumlahApe,
      jumlahKelSimulasi: jumlahKelSimulasi,
      kf: kf,
      paudTutor: paudTutor,
      bkb: bkb,
      koperasi: koperasi,
      ketrampilan: ketrampilan,
      lp3pkk: lp3pkk,
      tp3pkk: tp3pkk,
      damasPkk: damasPkk,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}