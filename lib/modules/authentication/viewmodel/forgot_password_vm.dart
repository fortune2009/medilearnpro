import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/core/services/authentication_service.dart';
import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/create_user_payload.dart';

import '../../../shared/widgets/all_package.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final BuildContext? context;
  final AuthenticationService? authenticationService;
  String? message;
  bool isPasswordVisible = false;

  final emailController = TextEditingController(text: "Fortune@yopmail.com");
  final oobCodeController = TextEditingController(text: "P@ss1234");
  final newPasswordController = TextEditingController(text: "P@ss1234");

  ForgotPasswordViewModel({this.context, this.authenticationService});

  @override
  FutureOr<void> init() {}

  bool activateButton() {
    notifyListeners();
    return emailController.text.isNotEmpty;
  }

  setPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void validateEmail(formKey) async {
    si.storageService.setBoolItem('app-opened', true);
    if (formKey.currentState.validate()) {
      Map<String, dynamic>? body = {
        "email": emailController.text.trim(),
        "requestType": "PASSWORD_RESET"
      };
      debugPrint("To create body $body");
      bool isPassed = await requestOobCode(data: body);
      if (isPassed) {
        snackBar(context: context!, message: message!, isError: false);
        Navigator.pushNamed(context!, RoutePaths.signIn);
        // Navigator.pushNamed(context!, RoutePaths.resetCode);
      } else {
        snackBar(context: context!, message: message!, isError: true);
      }
    }
  }

  void validateResetCode(formKey) async {
    si.storageService.setBoolItem('app-opened', true);
    if (formKey.currentState.validate()) {
      Map<String, dynamic>? body = {
        "oobCode": oobCodeController.text.trim(),
        "newPassword": newPasswordController.text.trim(),
      };
      debugPrint("To create body $body");
      bool isPassed = await verifyResetCode(data: body);
      if (isPassed) {
        snackBar(context: context!, message: message!, isError: false);
        // Navigator.pushNamed(context!, RoutePaths.signIn);
        Navigator.pushNamed(context!, RoutePaths.signIn);
      } else {
        snackBar(context: context!, message: message!, isError: true);
      }
    }
  }

  Future<bool> requestOobCode({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<CreateAccountDto> res =
          await authenticationService!.requestOobCodeService(data!);
      debugPrint("requestOobCode message from res ${res.message}");
      if (res.error!) {
        debugPrint("requestOobCode error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        message = "Kindly check your email for a reset code!";
        // message = res.message;
        debugPrint("requestOobCode success message $message");
        debugPrint("requestOobCode success data ${res.data}");
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("requestOobCode catch message $e");
      return false;
    }
  }

  Future<bool> verifyResetCode({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<CreateAccountDto> res =
          await authenticationService!.verifyResetCodeService(data!);
      debugPrint("verifyResetCode message from res ${res.message}");
      if (res.error!) {
        debugPrint("verifyResetCode error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        message = "Password reset was successful!";
        // message = res.message;
        debugPrint("verifyResetCode success message $message");
        debugPrint("verifyResetCode success data ${res.data}");
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("requestOobCode catch message $e");
      return false;
    }
  }
}
