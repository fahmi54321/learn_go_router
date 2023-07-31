import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go_router/home_page.dart';
import 'package:learn_go_router/page/menu1_page.dart';
import 'package:learn_go_router/page/menu2_page.dart';
import 'package:learn_go_router/page/menu3_page.dart';
import 'package:learn_go_router/page/sub_menu1_page.dart';
import 'package:learn_go_router/page/sub_menu2_page.dart';
import 'package:learn_go_router/page/sub_menu3_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/menu1',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomePage(content: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/menu1',
            builder: (BuildContext context, GoRouterState state) {
              return const Menu1Page();
            },
            routes: [
              GoRoute(
                path: 'subMenu1',
                builder: (BuildContext context, GoRouterState state) {
                  return const SubMenu1();
                },
              ),
            ],
          ),
          GoRoute(
            path: '/menu2',
            builder: (BuildContext context, GoRouterState state) {
              return const Menu2Page();
            },
            routes: [
              GoRoute(
                path: 'subMenu2',
                builder: (BuildContext context, GoRouterState state) {
                  return const SubMenu2();
                },
              ),
            ],
          ),
          GoRoute(
            path: '/menu3',
            builder: (BuildContext context, GoRouterState state) {
              return const Menu3Page();
            },
            routes: [
              GoRoute(
                path: 'subMenu3',
                builder: (BuildContext context, GoRouterState state) {
                  return const SubMenu3();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
