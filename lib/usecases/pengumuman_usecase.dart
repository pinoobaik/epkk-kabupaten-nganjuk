// features/home/domain/usecases/get_pengumuman_usecase.dart

import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';
import 'package:e_pkk_nganjuk/repositories/pengumuman_repository.dart';

// pengumuman_usecase.dart
class GetPengumumanUsecase {
  final PengumumanRepository repository;

  GetPengumumanUsecase({required this.repository});

  Future<PengumumanResponse> execute({int page = 1, int limit = 10}) async {
    return await repository.getPengumuman(page: page, limit: limit);
  }
}