import 'package:auto_route/auto_route.dart';
import 'package:otp_test/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BiometricRouter.page,
          path: '/',
        ),
        AutoRoute(
          page: HomeRouter.page,
          path: '/homeRouter',
        ),
      ];
}
