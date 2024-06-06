import 'package:medilearnpro/core/config/app_config.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/user_dto.dart';

import 'api_service.dart';
import 'storage_service.dart';
import 'store_service.dart';

class ProfileService {
  ProfileService({
    required this.storageService,
    required this.storeService,
    required this.apiService,
  });

  StorageService storageService;
  StoreService storeService;
  ApiService apiService;

  Future<ApiResponse<UserDto>> profileService(
      {Map<String, dynamic>? requestData}) {
    return si.apiService!.postApi<UserDto>(
      "accounts:lookup",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        return UserDto.fromJson(res);
      },
    );
  }
}
