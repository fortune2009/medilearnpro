// ignore_for_file: null_argument_to_non_null_type

import 'dart:async';

import 'package:medilearnpro/core/config/app_config.dart';
import 'package:medilearnpro/core/services/api_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/create_user_payload.dart';

import '../service-injector/service_injector.dart';
import 'storage_service.dart';
import 'store_service.dart';

class AuthenticationService {
  AuthenticationService({
    required this.storageService,
    required this.storeService,
    required this.apiService,
  });

  StorageService storageService;
  StoreService storeService;
  ApiService apiService;

  Future<ApiResponse<CreateAccountDto>> createAccountService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<CreateAccountDto>(
      "accounts:signUp",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        // debugPrint("createAccountService transform message ${res["message"]}");
        return CreateAccountDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<CreateAccountDto>> completeAccountSetupService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<CreateAccountDto>(
      "accounts:update",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        // debugPrint("createAccountService transform message ${res["message"]}");
        return CreateAccountDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<CreateAccountDto>> authenticateAccountService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<CreateAccountDto>(
      "accounts:signInWithPassword",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        return CreateAccountDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<CreateAccountDto>> requestOobCodeService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<CreateAccountDto>(
      "accounts:sendOobCode",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        return CreateAccountDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<CreateAccountDto>> verifyResetCodeService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<CreateAccountDto>(
      "accounts:resetPassword",
      requestData,
      params: {"key": APIKEY},
      // context,
      transform: (dynamic res) {
        return CreateAccountDto.fromJson(res);
        // return res;
      },
    );
  }
}
