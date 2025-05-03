import 'package:e_pkk_nganjuk/features/home/data/model/report_kader_pokja4_model.dart';
import 'package:e_pkk_nganjuk/repositories/kader_pokja4_repository.dart';

class SubmitKaderPokja4Usecase {
  final KaderPokja4Repository repository;

  SubmitKaderPokja4Usecase({required this.repository});

  Future<ReportKaderPokja4Model> execute({
    required String idUser,
    required String posyandu,
    required String gizi,
    required String kesling,
    required String penyuluhanNarkoba,
    required String phbs,
    required String kb,
    required String idRole,
    required String idOrganization,
    String? catatan,
  }) async {
    return await repository.submitDataKaderPokja4(
      idUser: idUser,
      posyandu: posyandu,
      gizi: gizi,
      kesling: kesling,
      penyuluhanNarkoba: penyuluhanNarkoba,
      phbs: phbs,
      kb: kb,
      idRole: idRole,
      idOrganization: idOrganization,
      catatan: catatan,
    );
  }
}