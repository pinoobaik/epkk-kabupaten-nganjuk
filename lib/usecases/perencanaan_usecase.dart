import 'package:e_pkk_nganjuk/features/home/data/model/report_perencanaan_model.dart';
import 'package:e_pkk_nganjuk/repositories/perencanaan_repository.dart';

class CreatePerencanaanUsecase {
  final PerencanaanRepository repository;

  CreatePerencanaanUsecase({required this.repository});

  Future<ReportPerencanaanModel> execute({
    required String id_user,
    required String jumlahPriaSubur,
    required String jumlahWanitaSubur,
    required String kbPria,
    required String kbWanita,
    required String kkTabungan,
    required String id_role,
    required String id_organization,
    String? catatan,
  }) async {
    return await repository.postPerencanaanData(
      id_user: id_user,
      jumlahPriaSubur: jumlahPriaSubur,
      jumlahWanitaSubur: jumlahWanitaSubur,
      kbPria: kbPria,
      kbWanita: kbWanita,
      kkTabungan: kkTabungan,
      id_role: id_role,
      id_organization: id_organization,
      catatan: catatan,
    );
  }
}