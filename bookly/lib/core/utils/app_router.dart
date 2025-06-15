import 'package:bookly/features/home/presentation/views/book_details_screen.dart';
import 'package:bookly/features/home/presentation/views/home_screen.dart';
import 'package:bookly/features/splash_feature/presentation/views/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

abstract class AppRouter {
  static String splashScreen = "/";
  static String homeScreen = "/homeView";
  static String bookDetailsScreen = "/homeView/bookdetails";

  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: bookDetailsScreen,
        page: () => const BookDetailsScreen(),
        transition: Transition.circularReveal,
      ),
    ];
  }
}
