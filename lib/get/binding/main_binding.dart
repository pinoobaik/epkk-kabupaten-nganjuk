import 'package:e_pkk_nganjuk/get/binding/auth_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/pengumuman_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/profil_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/riwayat_binding.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    PengumumanBinding().dependencies();
    RiwayatBinding().dependencies();
    ProfilBinding().dependencies();
    AuthBinding().dependencies();
  }
}
