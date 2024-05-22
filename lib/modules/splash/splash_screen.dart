import 'package:firebase_auth/firebase_auth.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

import '../../core/service-injector/service_injector.dart';
import '../../router/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    firstInit();
  }

  firstInit() {
    bool hasOpenedApp = false;
    debugPrint("ASDE ${si.storageService.getBoolItemSync('app-opened')}");
    final data = si.storageService.getItemSync('app-opened');
    if (data.isNotEmpty) {
      try {
        hasOpenedApp = jsonDecode(data);
      } catch (e) {
        debugPrint("open app error $e");
      }
    }

    if (hasOpenedApp) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          _startTimer(RoutePaths.signIn);
        } else {
          _startTimer(RoutePaths.bottomNav);
          print('User is signed in!');
        }
      });
    } else {
      _startTimer(RoutePaths.splashOptions);
    }
  }

  _startTimer(routeName) {
    const duration = Duration(seconds: 3);
    return Timer(duration, () {
      _route(routeName);
    });
  }

  _route(routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: _buildSplash(context),
      ),
    );
  }

  Widget _buildSplash(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   child: Container(
        //     width: deviceWidth(context),
        //     decoration: const BoxDecoration(
        //       color: AppColors.white,
        //       // image: DecorationImage(
        //       //   fit: BoxFit.fitHeight,
        //       //   image: AssetImage(ImageAssets.splashBG),
        //       // ),
        //     ),
        //   ),
        // ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(color: AppColors.white),
              width: deviceWidth(context),
              height: deviceHeight(context),
            ),
          ),
        ),
        Positioned(
          bottom: 100.h,
          top: 100.h,
          left: 120.h,
          right: 120.h,
          child: Image.asset(
            width: 32.w,
            height: 48.h,
            ImageAssets.logo,
          ),
        ),
      ],
    );
  }
}
