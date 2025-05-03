import 'package:e_pkk_nganjuk/features/home/data/model/report_gotong_royong_model.dart';
import 'package:e_pkk_nganjuk/repositories/gotong_royong_repository.dart';

class CreateGotongRoyongUsecase {
  final GotongRoyongRepository repository;

  CreateGotongRoyongUsecase({required this.repository});

  Future<ReportGotongRoyongModel> execute({
    required String idUser,
    required String kerjaBakti,
    required String rukunKematian,
    required String keagamaan,
    required String jimpitan,
    required String arisan,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.postGotongRoyongData(
      idUser: idUser,
      kerjaBakti: kerjaBakti,
      rukunKematian: rukunKematian,
      keagamaan: keagamaan,
      jimpitan: jimpitan,
      arisan: arisan,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}