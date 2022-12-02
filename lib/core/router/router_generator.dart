import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio_web_app/meta/views/root/root.screen.dart';
import 'package:studio_web_app/meta/views/splash/splash_screen.dart';

class RouteGenerator {
  // TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

  static String lastRoute = '';

  // WELCOME ROUTE
  static const String splashScreen = '/splash-screen';

  // HOME ROUTES
  static const String rootScreen = '/root-screen';

  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings) {
    Map<String, dynamic> args = {};

    // GETTING ARGUMENTS IF PASSED
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
      debugPrint("${settings.arguments}");
    }
    debugPrint(settings.name);

    switch (settings.name) {
      case splashScreen:
        return _getPageRoute(const SplashScreen(), splashScreen);

      case rootScreen:
        return _getPageRoute(const RootScreen(), rootScreen);

      // case orderDetailsScreen:
      //   return _getPageRoute(const OrderDetailScreen());

      // case createAdScreen:
      //   return _getPageRoute(CreateAdScreen(
      //     isUpdate: args['isUpdate'],
      //   ));

      default:
        return null;
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child, routeName) {
    lastRoute = routeName;
    // return MaterialPageRoute(builder: (ctx) => child);
    return PageTransition(child: child, type: PageTransitionType.fade);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
