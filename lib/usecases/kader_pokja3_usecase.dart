import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja3_model.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja3_repository.dart';

class KaderPokja3Usecase {
  final KaderPokja3Repository repository;

  KaderPokja3Usecase({required this.repository});

  Future<ReportKaderPokja3Model> execute({
    required String idUser,
    required String pangan,
    required String sandang,
    required String tataLaksanaRumah,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitKaderPokja3(
      idUser: idUser,
      pangan: pangan,
      sandang: sandang,
      tataLaksanaRumah: tataLaksanaRumah,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}