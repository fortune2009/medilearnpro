import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/services/authentication_service.dart';
import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/create_user_payload.dart';

import '../../../shared/widgets/all_package.dart';

class CreateAccountViewModel extends BaseViewModel {
  final BuildContext? context;
  final AuthenticationService? authenticationService;
  String? message;

  String? token;
  // final fullNameController = TextEditingController(text: "French Paul");
  // final emailController = TextEditingController(text: "Fortune@yopmail.com");
  // final passwordController = TextEditingController(text: "P@ss1234");
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  CreateAccountViewModel({this.context, this.authenticationService});

  @override
  FutureOr<void> init() {}

  setPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  setConfirmPasswordVisible() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void validateCreateAccount(formKey) async {
    // si.storageService.setBoolItem('app-opened', true);
    // debugPrint("ASDE ${si.storageService.getBoolItemSync('app-opened')}");
    if (formKey.currentState.validate()) {
      Map<String, dynamic>? body = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "returnSecureToken": true,
      };
      debugPrint("To create body $body");
      bool isPassed = await createAccount(data: body);
      if (isPassed) {
        if (await completeAccountSetup(data: {
          "displayName": fullNameController.text.trim(),
          "idToken": token,
          "returnSecureToken": true,
        })) {
          snackBar(context: context!, message: message!, isError: false);
          Navigator.pushNamed(context!, RoutePaths.signIn);
        } else {
          snackBar(context: context!, message: message!, isError: true);
        }
      } else {
        snackBar(context: context!, message: message!, isError: true);
      }
    }
  }

  Future<bool> createAccount({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<CreateAccountDto> res =
          await authenticationService!.createAccountService(data!);
      debugPrint("createAccount message from res ${res.message}");
      if (res.error!) {
        debugPrint("createAccount error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        message = "Account created successfully!";
        // message = res.message;
        debugPrint("createAccount success message $message");
        debugPrint("createAccount success data ${res.data}");
        token = res.data!.idToken;
        // si.storageService.setItem("reg_data", json.encode(res.data!.data!));
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("createAccount catch message $e");
      return false;
    }
  }

  Future<bool> completeAccountSetup({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<CreateAccountDto> res =
          await authenticationService!.completeAccountSetupService(data!);
      debugPrint("completeAccountSetup message from res ${res.message}");
      if (res.error!) {
        debugPrint("completeAccountSetup error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        message = "Account created successfully!";
        // message = res.message;
        debugPrint("completeAccountSetup success message $message");
        debugPrint("completeAccountSetup success data ${res.data}");
        // referralCode = res.data!.data!.referralCode;
        // si.storageService.setItem("reg_data", json.encode(res.data!.data!));
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("completeAccountSetup catch message $e");
      return false;
    }
  }
}
