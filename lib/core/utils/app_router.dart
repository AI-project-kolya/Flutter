import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/features/home/presentation/views/first_view.dart';
import 'package:price_predictor_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashViewPath = '/';
  static const kFirstViewViewPath = '/firstview';
  static final goRouter = GoRouter(routes: [
    GoRoute(
      path: kSplashViewPath,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kFirstViewViewPath,
      builder: (context, state) => const FirstView(),
    ),
  ]);
}
