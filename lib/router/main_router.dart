import 'package:flutter/material.dart';
import 'package:medilearnpro/modules/authentication/setup_account.dart';
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
        return MaterialPageRoute(builder: (_) => const SetupAccount());
      // case RoutePaths.accountVerification:
      //   return MaterialPageRoute(builder: (_) => const AccountVerification());
      // case RoutePaths.uploadCompanyDocument:
      //   return MaterialPageRoute(builder: (_) => UploadCompanyDocument());
      // case RoutePaths.setupPin:
      //   return MaterialPageRoute(builder: (_) => const SetupPin());
      // case RoutePaths.confirmPin:
      //   return MaterialPageRoute(builder: (_) => const ConfirmPin());
      // case RoutePaths.successRegistration:
      //   return MaterialPageRoute(builder: (_) => const SuccessRegistration());
      // case RoutePaths.readyToGo:
      //   return MaterialPageRoute(builder: (_) => const ReadyToGo());
      // case RoutePaths.newSignIn:
      //   return MaterialPageRoute(builder: (_) => NewLogin());
      // case RoutePaths.enterLoginPin:
      //   return MaterialPageRoute(builder: (_) => const EnterLoginPin());
      // case RoutePaths.signIn:
      //   return MaterialPageRoute(builder: (_) => const ReturnLogin());
      // case RoutePaths.forgotPin:
      //   return MaterialPageRoute(builder: (_) => ForgotPin());
      // case RoutePaths.enterResetPin:
      //   return MaterialPageRoute(builder: (_) => const EnterOtp());
      // case RoutePaths.setupNewPin:
      //   return MaterialPageRoute(builder: (_) => SetupYourNewPin());
      // case RoutePaths.pinResetSuccess:
      //   return MaterialPageRoute(builder: (_) => const PinResetSuccess());
      case RoutePaths.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNav());
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
