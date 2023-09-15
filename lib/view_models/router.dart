import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../constants/translations.dart';
import '../views/home_view/home_view.dart';
import '../views/login_view/login_view.dart';
import '../views/register_view/register_view.dart';

bool loggedIn = Hive.box('user').get('loggedIn') ?? false;
// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation:
      loggedIn ? '/$homeViewRoutingText' : '/$registerViewRoutingText',
  routes: [
    GoRoute(
      name: loginViewRoutingText,
      // ${/:id} // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/$loginViewRoutingText',
      builder: (context, state) {
        // final id = state.pathParameters['id']; // Get "id" param from URL
        return const LoginView();
      },
    ),
    GoRoute(
      name: registerViewRoutingText,
      path: '/$registerViewRoutingText',
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      name: homeViewRoutingText,
      path: '/$homeViewRoutingText',
      builder: (context, state) => const HomeView(),
    ),
    // GoRoute(
    //   name: myHomePageViewRoutingText,
    //   path: '/$myHomePageViewRoutingText',
    //   builder: (context, state) => const MyHomePage(title: 'Flutter'),
    // ),
  ],
);
