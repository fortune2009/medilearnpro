import 'package:flutter/material.dart';
import 'package:medilearnpro/modules/authentication/forgot_password.dart';
import 'package:medilearnpro/modules/authentication/reset_password.dart';
import 'package:medilearnpro/modules/authentication/setup_account.dart';
import 'package:medilearnpro/modules/authentication/sign_in.dart';
import 'package:medilearnpro/modules/home/notification.dart';
import 'package:medilearnpro/modules/home/published.dart';
import 'package:medilearnpro/modules/splash/splash_options.dart';
import 'package:medilearnpro/modules/splash/splash_screen.dart';

import '../shared/widgets/bottom_nav.dart';
import 'route_paths.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.splashOptions:
        return MaterialPageRoute(builder: (_) => const SplashOptions());
      case RoutePaths.setupAccount:
        return MaterialPageRoute(builder: (_) => SetupAccount());
      case RoutePaths.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());
      case RoutePaths.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case RoutePaths.resetCode:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case RoutePaths.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNav());
      case RoutePaths.published:
        return MaterialPageRoute(builder: (_) => const Published());
      case RoutePaths.notification:
        return MaterialPageRoute(builder: (_) => const MediNotification());
      // case RoutePaths.setupNewPin:
      //   return MaterialPageRoute(builder: (_) => SetupYourNewPin());
      // case RoutePaths.pinResetSuccess:
      //   return MaterialPageRoute(builder: (_) => const PinResetSuccess());
      // case RoutePaths.splashOptions:
      //   return MaterialPageRoute(builder: (_) => const SplashOptions());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
