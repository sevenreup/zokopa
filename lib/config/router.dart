import 'package:go_router/go_router.dart';
import 'package:zokopa/screens/ar/ar.dart';
import 'package:zokopa/screens/home/home_screen.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/ar',
      builder: (context, state) => DebugOptionsWidget(),
    ),
  ],
);
