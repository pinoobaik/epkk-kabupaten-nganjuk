// features/home/domain/usecases/get_riwayat_usecase.dart

import 'package:e_pkk_nganjuk/features/home/data/model/riwayat_model.dart';
import 'package:e_pkk_nganjuk/repositories/riwayat_repository.dart';

class GetRiwayatUsecase {
  final RiwayatRepository repository;

  GetRiwayatUsecase({required this.repository});

  Future<RiwayatResponse> execute({
    required String idUser,
    required String idRole,
    required String idOrganization,
  }) async {
    return await repository.getRiwayat(
      idUser: idUser,
      idRole: idRole,
      idOrganization: idOrganization,
    );
  }
}
