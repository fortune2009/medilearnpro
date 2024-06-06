import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/core/services/profile_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/user_dto.dart';

import '../../../shared/widgets/all_package.dart';

class ProfileViewModel extends BaseViewModel {
  final BuildContext? context;
  final ProfileService? profileService;
  String? message;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  User userData = User();
  String? token;

  ProfileViewModel({this.context, this.profileService});

  @override
  FutureOr<void> init() {
    var data = jsonDecode(si.storageService.getItemSync('user'));
    fetchProfile(data: {"idToken": data["idToken"]});
  }

  Future<bool> fetchProfile({Map<String, dynamic>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<UserDto> res =
          await profileService!.profileService(requestData: data);
      debugPrint("fetchProfile message entry");
      if (res.error!) {
        debugPrint("fetchProfile error true");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        // message = "Account created successfully!";
        // message = res.message;
        debugPrint("fetchProfile success data ${res.data}");
        userData = res.data!.users!.first;
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("fetchProfile catch message $e");
      return false;
    }
  }
}
