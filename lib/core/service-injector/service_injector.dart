import 'package:medilearnpro/core/services/authentication_service.dart';
import 'package:medilearnpro/core/services/dashboard_service.dart';
import 'package:medilearnpro/core/services/lessons_service.dart';
import 'package:medilearnpro/core/services/profile_service.dart';

import '../services/services.dart';

class Injector {
  StoreService storeService = StoreService();
  StorageService storageService = StorageService();
  // LayoutService layoutService = LayoutService();
  ApiService? apiService;
  late AuthenticationService authenticationService;
  late ProfileService profileService;
  DashboardService? dashboardService;
  LessonsService? lessonsService;

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
    dashboardService = DashboardService(
        storageService: storageService, storeService: storeService);
    lessonsService = LessonsService(
        storageService: storageService, storeService: storeService);
    return true;
  }
}

Injector si = Injector();
