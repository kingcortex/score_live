import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:score_live/app.dart';
import 'package:score_live/features/matches_and_competitions/presentation/pages/competition_page.dart';
import 'package:score_live/features/matches_and_competitions/presentation/pages/detail_match_page.dart';
import 'package:score_live/features/matches_and_competitions/presentation/pages/home_page.dart';
import 'package:score_live/features/news/presentation/pages/news_page.dart';
import 'package:score_live/features/profile/presentation/pages/acount_page.dart';

class AppRoutes {
  AppRoutes._();

  static String initR = "/home";

  //Private Navigations keys
  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _rootNavigationHome = GlobalKey<NavigatorState>();
  static final _rooNavigationCompetition = GlobalKey<NavigatorState>();
  static final _rootNavigationNews = GlobalKey<NavigatorState>();
  static final _rootNavigationAcount = GlobalKey<NavigatorState>();

  //Configuration de Go Router
  static final GoRouter router = GoRouter(
    initialLocation: initR,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigationKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return App(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigationHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "home",
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const HomePage(),
                  );
                },
              ),
              GoRoute(
                path: "/detail-match",
                name: "detai-match",
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: const DetailMatchPage(),
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rooNavigationCompetition,
            routes: <RouteBase>[
              GoRoute(
                path: "/competition",
                name: "competition",
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const CompetitionPage(),
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigationNews,
            routes: <RouteBase>[
              GoRoute(
                path: "/news",
                name: "news",
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const NewsPage(),
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigationAcount,
            routes: <RouteBase>[
              GoRoute(
                path: "/acount",
                name: "acount",
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return MaterialPage<void>(
                    key: state.pageKey,
                    child: const AcountPage(),
                  );
                },
              )
            ],
          )
        ],
      )
    ],
  );
}
