import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sarkari_yojna_flutter/screens/home/home_screen.dart';
import 'package:sarkari_yojna_flutter/screens/yojna_details/yojna_details_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: "/",
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
              name: "/details",
              path: '/details',
              builder: (BuildContext context, GoRouterState state) {
                return const YojnaDetailsScreen();
              })
        ]),
  ],
);
