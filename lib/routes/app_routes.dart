import 'package:e_pkk_nganjuk/features/home/presentation/pages/home_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/upload_laporan.dart';
import 'package:e_pkk_nganjuk/get/binding/welcome_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/auth/presentation/pages/auth_screen.dart';
import '../features/auth/presentation/pages/pick_role_screen.dart';
import '../features/auth/presentation/pages/register_screen.dart';
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
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    // GetPage(
    //   name: Routes.RESET_PASSWORD,
    //   page: () => ForgetPasswordScreen(),
    // ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.PICK_ROLE,
      page: () => PickRoleScreen(),
    ),
    // GetPage(
    //   name: Routes.VERIFICATION,
    //   page: () => VerificationScreen(),
    // ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.UPLOAD_LAPORAN,
      page: () => UploadLaporan(),
    ),
    // GetPage(
    //   name: Routes.KADER_POKJA1,
    //   page: () => KaderPokja1Screen(),
    //   binding: UploadReportBinging(),
    // ),
  ];
}

class Routes {
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const AUTH_LOGIN = '/auth_login';
  static const RESET_PASSWORD = '/reset_password';
  static const REGISTER = '/register';
  static const PICK_ROLE = '/pick_role';
  static const VERIFICATION = '/verification';
  static const HOME = '/home';
  static const UPLOAD_LAPORAN = '/upload_laporan';
  static const KADER_POKJA1 = '/kader_pokja1';
}
