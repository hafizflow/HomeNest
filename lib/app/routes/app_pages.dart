import 'package:get/get.dart';
import 'package:homenest/app/routes/app_routes.dart';
import '../../presentation/home/views/home_view.dart';
import '../../presentation/home/controllers/home_controller.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
  ];
}
