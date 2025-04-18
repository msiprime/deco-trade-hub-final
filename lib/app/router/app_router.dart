import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deco_trade_hub/app/screens/screens.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/widget/role_prompt_page.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/view/signin_view.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signup/view/signup_view.dart';
import 'package:deco_trade_hub/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: '_rootNavigatorKey',
);

/// The default app router.
final GoRouter appRouter = GoRouter(
  initialLocation: '/${SplashScreen.routeName}',
  navigatorKey: _rootNavigatorKey,
  routes: [
    _buildSplashScreenRoute(),
    _buildOnBoardingViewRoute(),
    _buildHomeScreenRoute(),
    _buildErrorScreenRoute(),
    _buildRolePromptRoute(),
  ],
);

/// Clears all routes from the app router's stack and pushes the given
/// [path].
void clearAllRoutesAndGoToNamed(
  String path, {
  Object? extra,
}) {
  while (appRouter.canPop()) {
    appRouter.pop();
  }
  appRouter.pushReplacementNamed(
    path,
    extra: extra,
  );
}

GoRoute _buildSplashScreenRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: SplashScreen.routeName,
      path: '/${SplashScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const SplashScreen(),
      ),
    );

GoRoute _buildOnBoardingViewRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: OnBoardingView.routeName,
      path: OnBoardingView.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const OnBoardingView(),
      ),
    );

GoRoute _buildRolePromptRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: RolePromptPage.routeName,
      path: RolePromptPage.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const RolePromptPage(),
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SignUpPage.routeName,
          name: SignUpPage.routeName,
          pageBuilder: _getDefaultPageBuilderByPlatform(
            childBuilder: (_, state) => SignUpPage(
              userRole: state.extra.toString(),
            ),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SignInPage.routeName,
          name: SignInPage.routeName,
          pageBuilder: _getDefaultPageBuilderByPlatform(
            childBuilder: (_, __) => const SignInPage(),
          ),
        ),
      ],
    );

GoRoute _buildHomeScreenRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: HomeScreen.routeName,
      path: '/${HomeScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const HomeScreen(),
      ),
    );

GoRoute _buildErrorScreenRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: ErrorScreen.routeName,
      path: '/${ErrorScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const ErrorScreen(),
      ),
    );

Page<T> _getPageByPlatform<T>({required Widget child}) {
  if (Platform.isAndroid) {
    return MaterialPage(child: child);
  }
  if (Platform.isIOS) {
    return CupertinoPage(child: child);
  }
  return MaterialPage(child: child);
}

GoRouterPageBuilder _getDefaultPageBuilderByPlatform({
  required Widget Function(
    BuildContext context,
    GoRouterState goRouterState,
  ) childBuilder,
}) =>
    (context, goRouterState) =>
        _getPageByPlatform(child: childBuilder(context, goRouterState));
