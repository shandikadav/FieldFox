import 'package:field_fox/pages/signin_screen.dart';
import 'package:field_fox/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

part 'route_name.dart';

final route = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: RouteName.splash,
      builder: (context, state) => SplashScreen(),
      routes: [
        GoRoute(
          path: 'signin',
          name: RouteName.signin,
          builder: (context, state) => SignInScreen(),
        ),
      ]),
]);
