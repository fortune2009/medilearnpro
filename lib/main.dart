import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/firebase_options.dart';
import 'package:medilearnpro/router/main_router.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

import 'core/locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseConfig.platformOptions,
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  } catch (e) {
    print("firebase authemulator error at e");
    print(e);
  }
  // try {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // } catch (e){
  //   print("firestore emulator error at e");
  //   print(e);
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _init();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]).then((_) {});
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      default:
        break;
    }
  }

  Future<void> _init() async {
    await si.init();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(logicalWidth(), logicalHeight()),
      designSize: Size(logicalWidth() ?? 360.0, logicalHeight() ?? 772.0),
      // builder: (context, Widget? child) => MultiProvider(
      builder: () => MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          useInheritedMediaQuery: true,
          title: 'MediLearnPro',
          debugShowCheckedModeBanner: false,
          // home: const SplashScreen(),
          onGenerateRoute: MainRouter.generateRoute,
          theme: ThemeData(
            fontFamily: 'PlusJakartaSans',
          ),
        ),
      ),
    );
  }
}
