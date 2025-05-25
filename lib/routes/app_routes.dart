import 'package:e_pkk_nganjuk/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:e_pkk_nganjuk/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:e_pkk_nganjuk/features/auth/presentation/pages/verification_forget_password_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/detail_laporan_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/edit_password_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/gotong_royong_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/home_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/informasi_akun_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kader_pokja3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kader_pokja4_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kelestarian1_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kelestarian2_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kelestarian3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kesehatan_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/laporan_umum1_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/laporan_umum2_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/laporan_umum3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/laporan_umum4_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pangan1_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pangan2_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pangan3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pendidikan1_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pendidikan2_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pendidikan3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pendidikan4_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pendidikan5_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pengembangan1_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pengembangan2_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pengembangan3_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/penghayatan_pengamalan_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/perencanaan_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/perumahan_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/sandang_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/upload_galeri.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/upload_laporan.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/kader_pokja1_screen.dart';
import 'package:e_pkk_nganjuk/get/binding/galeri_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/gotong_royong_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/kader_pokja1_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/kader_pokja3_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/kader_pokja4_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/kelestarian_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/kesehatan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/laporan_umum_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/main_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/pangan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/pendidikan_keterampilan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/pengembangan_kehidupan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/penghayatan_pengamalan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/pengumuman_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/perencanaan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/perumahan_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/riwayat_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/sandang_binding.dart';
import 'package:e_pkk_nganjuk/get/binding/welcome_binding.dart';
import 'package:e_pkk_nganjuk/main_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/auth/presentation/pages/auth_screen.dart';
import '../features/auth/presentation/pages/pick_role_screen.dart';
import '../features/auth/presentation/pages/register_screen.dart';
import '../features/auth/presentation/pages/verification_screen.dart';
import '../features/splash_screen/splash_screen.dart';
import '../features/welcome/welcome_screen.dart';
import '../get/binding/auth_binding.dart';

class AppRoutes {
  static const INITIAL = Routes.SPLASH;
  

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION_FORGOT_PASSWORD,
      page: () => VerificationForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD_BARU,
      page: () => ResetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.PICK_ROLE,
      page: () => PickRoleScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION,
      page: () => VerificationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: Routes.UPLOAD_LAPORAN,
      page: () => UploadLaporan(),
    ),
    GetPage(
      name: Routes.UPLOAD_GALERI,
      page: () => UploadGaleriPage(),
      binding: GaleriBinding(),
    ),
    // GetPage(
    //   name: Routes.DETAIL,
    //   page: () => DetailLaporanScreen(),
    //   binding: RiwayatBinding(),
    // ),
    GetPage(
      name: Routes.KADER_POKJA1,
      page: () => KaderPokja1Screen(),
      binding: UploadReportBinding(),
    ),
    GetPage(
      name: Routes.PENGHAYATAN,
      page: () => PenghayatanPengamalanScreen(),
      binding: PenghayatanPengamalanBinding(),
    ),
    GetPage(
      name: Routes.GOTONG_ROYONG,
      page: () => GotongRoyongScreen(),
      binding: GotongRoyongBinding(),
    ),
    GetPage(
      name: Routes.PENDIDIKAN1,
      page: () => Pendidikan1Screen(),
      binding: PendidikanKeterampilanBinding(),
    ),
    GetPage(
      name: Routes.PENDIDIKAN2,
      page: () => PendidikanKetrampilan2Screen(),
      binding: PendidikanKeterampilanBinding(),
    ),
    GetPage(
      name: Routes.PENDIDIKAN3,
      page: () => PendidikanKetrampilan3Screen(),
      binding: PendidikanKeterampilanBinding(),
    ),
    GetPage(
      name: Routes.PENDIDIKAN4,
      page: () => PendidikanKetrampilan4Screen(),
      binding: PendidikanKeterampilanBinding(),
    ),
    GetPage(
      name: Routes.PENDIDIKAN5,
      //page: () => ReviewLaporanPendidikanScreen(),
      page: () => PendidikanKetrampilan5Screen(),
      binding: PendidikanKeterampilanBinding(),
    ),
    GetPage(
      name: Routes.PENGEMBANGAN1,
      //page: () => ReviewLaporanPendidikanScreen(),
      page: () => Pengembangan1(),
      binding: PengembanganKehidupanBinding(),
    ),
    GetPage(
      name: Routes.PENGEMBANGAN2,
      //page: () => ReviewLaporanPendidikanScreen(),
      page: () => Pengembangan2(),
      binding: PengembanganKehidupanBinding(),
    ),
    GetPage(
      name: Routes.PENGEMBANGAN3,
      //page: () => ReviewLaporanPendidikanScreen(),
      page: () => Pengembangan3(),
      binding: PengembanganKehidupanBinding(),
    ),
    GetPage(
      name: Routes.KADER_POKJA3,
      page: () => KaderPokja3Screen(),
      binding: KaderPokja3Binding(),
    ),
    GetPage(
      name: Routes.PANGAN1,
      page: () => Pangan1Screen(),
      binding: PanganBinding(),
    ),
    GetPage(
      name: Routes.PANGAN2,
      page: () => Pangan2Screen(),
      binding: PanganBinding(),
    ),
    GetPage(
      name: Routes.PANGAN3,
      page: () => Pangan3Screen(),
      binding: PanganBinding(),
    ),
    GetPage(
      name: Routes.SANDANG,
      page: () => SandangScreen(),
      binding: SandangBinding(),
    ),
    GetPage(
      name: Routes.PERUMAHAN,
      page: () => PerumahanScreen(),
      binding: PerumahanBinding(),
    ),
    GetPage(
      name: Routes.KADER_POKJA4,
      page: () => KaderPokja4Screen(),
      binding: KaderPokja4Binding(),
    ),
    GetPage(
      name: Routes.KESEHATAN,
      page: () => KesehatanScreen(),
      binding: KesehatanBinding(),
    ),
    GetPage(
      name: Routes.KELESTARIAN1,
      page: () => KelestarianLingkungan1Screen(),
      binding: KelestarianBinding(),
    ),
    GetPage(
      name: Routes.KELESTARIAN2,
      page: () => KelestarianLingkungan2Screen(),
      binding: KelestarianBinding(),
    ),
    GetPage(
      name: Routes.KELESTARIAN3,
      page: () => Kelestarian3Screen(),
      binding: KelestarianBinding(),
    ),
    GetPage(
      name: Routes.PERENCANAAN,
      page: () => PerencanaanSehatScreen(),
      binding: PerencanaanBinding(),
    ),
    GetPage(
      name: Routes.LAPORAN_UMUM1,
      page: () => LaporanUmum1Screen(),
      binding: LaporanUmumBinding(),
    ),
    GetPage(
      name: Routes.LAPORAN_UMUM2,
      page: () => LaporanUmum2Screen(),
      binding: LaporanUmumBinding(),
    ),
    GetPage(
    name: Routes.LAPORAN_UMUM3,
    page: () => LaporanUmum3Screen(),
    binding: LaporanUmumBinding(),
    ),
    GetPage(
    name: Routes.LAPORAN_UMUM4,
    page: () => LaporanUmum4Screen(),
    binding: LaporanUmumBinding(),
    ),
    GetPage(
      name: Routes.INFO_AKUN,
      page: () => InfoAkunScreen(),
    ),
    GetPage(
      name: Routes.EDIT_PASSWORD,
      page: () => EditPasswordScreen(),
    ),
  ];
}

class Routes {
  static const SPLASH = '/splash';
  static const MAIN = '/main';
  static const WELCOME = '/welcome';

  static const AUTH_LOGIN = '/auth_login';

  static const RESET_PASSWORD = '/reset_password';
  static const VERIFICATION_FORGOT_PASSWORD = '/verification_forgot_password';
  static const RESET_PASSWORD_BARU = '/reset_password_baru';

  static const REGISTER = '/register';
  static const PICK_ROLE = '/pick_role';
  static const VERIFICATION = '/verification';

  static const HOME = '/home';
  static const UPLOAD_LAPORAN = '/upload_laporan';
  static const UPLOAD_GALERI = '/upload_galeri';
  static const DETAIL = '/detail_laporan';

  static const KADER_POKJA1 = '/kader_pokja1';
  static const PENGHAYATAN = '/penghayatan';
  static const GOTONG_ROYONG = '/gotong_royong';

  static const PENDIDIKAN1 = '/pendidikan1';
  static const PENDIDIKAN2 = '/pendidikan2';
  static const PENDIDIKAN3 = '/pendidikan3';
  static const PENDIDIKAN4 = '/pendidikan4';
  static const PENDIDIKAN5 = '/pendidikan5';
  static const PENGEMBANGAN1 = '/pengembangan1';
  static const PENGEMBANGAN2 = '/pengembangan2';
  static const PENGEMBANGAN3 = '/pengembangan3';

  static const KADER_POKJA3 = '/kader_pokja3';
  static const PANGAN1 = '/pangan1';
  static const PANGAN2 = '/pangan2';
  static const PANGAN3 = '/pangan3';
  static const SANDANG = '/sandang';
  static const PERUMAHAN = '/perumahan';

  static const KADER_POKJA4 = '/kader_pokja4';
  static const KESEHATAN = '/kesehatan';
  static const KELESTARIAN1 = '/kelestarian1';
  static const KELESTARIAN2 = '/kelestarian2';
  static const KELESTARIAN3 = '/kelestarian3';
  static const PERENCANAAN = '/perencanaan';

  static const LAPORAN_UMUM1 = '/laporan_umum1';
  static const LAPORAN_UMUM2 = '/laporan_umum2';
  static const LAPORAN_UMUM3 = '/laporan_umum3';
  static const LAPORAN_UMUM4 = '/laporan_umum4';

  static const INFO_AKUN = '/info_akun';
  static const EDIT_PASSWORD = '/edit_password';
}
