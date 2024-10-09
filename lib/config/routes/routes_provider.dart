import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/config/routes/routes.dart';

final routesProvider = Provider<GoRouter>((ref) {
  // If need authentication, use authProvider
  // to get the user's authentication status, then use riderect
  // in GoRouter to handle
  return GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
