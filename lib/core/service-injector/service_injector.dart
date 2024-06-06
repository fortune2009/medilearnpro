import 'package:medilearnpro/core/services/authentication_service.dart';
import 'package:medilearnpro/core/services/profile_service.dart';

import '../services/services.dart';

class Injector {
  StoreService storeService = StoreService();
  StorageService storageService = StorageService();
  // LayoutService layoutService = LayoutService();
  ApiService? apiService;
  late AuthenticationService authenticationService;
  late ProfileService profileService;
  // DashboardService? dashboardService;

  Future<bool> init() async {
    await storageService.initStorage();
    apiService = ApiService(storeService);
    authenticationService = AuthenticationService(
        storageService: storageService,
        storeService: storeService,
        apiService: apiService!);
    profileService = ProfileService(
        storageService: storageService,
        storeService: storeService,
        apiService: apiService!);
    return true;
  }
}

Injector si = Injector();
