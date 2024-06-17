import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/base/bottom_nav_model.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/core/services/authentication_service.dart';
import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/create_user_payload.dart';

import '../../../shared/widgets/all_package.dart';

class SignInViewModel extends BaseViewModel {
  final BuildContext? context;
  final AuthenticationService? authenticationService;
  String? message;

  final emailController = TextEditingController(text: "Fortune3@yopmail.com");
  final passwordController = TextEditingController(text: "P@ss1234");
  bool isPasswordVisible = false;

  SignInViewModel({this.context, this.authenticationService});

  @override
  FutureOr<void> init() {}

  setPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void validateSignIn(formKey) async {
    si.storageService.setBoolItem('app-opened', true);
    if (formKey.currentState.validate()) {
      Map<String, dynamic>? body = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "returnSecureToken": true,
      };
      debugPrint("To create body $body");
      bool isPassed = await authenticateAccount(data: body);
      if (isPassed) {
        snackBar(context: context!, message: message!, isError: false);
        // Navigator.pushNamed(context!, RoutePaths.signIn);
        Provider.of<BottomNavModel>(context!, listen: false)
            .updateIndex(0, context);
        Navigator.pushNamed(context!, RoutePaths.bottomNav);
      } else {
        snackBar(context: context!, message: message!, isError: true);
      }
    }
  }

  Future<bool> authenticateAccount({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<CreateAccountDto> res =
          await authenticationService!.authenticateAccountService(data!);
      debugPrint("authenticateAccount message from res ${res.message}");
      if (res.error!) {
        debugPrint("authenticateAccount error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        message = "Sign in successfully!";
        // message = res.message;
        debugPrint("authenticateAccount success message $message");
        debugPrint("authenticateAccount success data ${res.data}");
        si.storageService.setItem('user', jsonEncode(res.data));
        // si.storageService.setItem('name', jsonEncode(res.data!.displayName));
        // debugPrint("ASDE ${si.storageService.getItemSync('name')}");
        debugPrint("ASDE ${si.storageService.getItemSync('user')}");

        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("authenticateAccount catch message $e");
      return false;
    }
  }
}
