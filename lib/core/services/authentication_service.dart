// ignore_for_file: null_argument_to_non_null_type

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medilearnpro/core/services/api_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/authentication/account_verification_dto.dart';
import 'package:medilearnpro/shared/models/authentication/document_upload_dto.dart';
import 'package:medilearnpro/shared/models/authentication/setup_merchant_account_dto.dart';
import 'package:medilearnpro/shared/models/authentication/setup_pin_dto.dart';

import '../../shared/models/authentication/auth_payload.dart';
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


  Future<ApiResponse<SetupMerchantAccountDto>> setupMerchantAccountService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<SetupMerchantAccountDto>(
      'auth/merchant/account/verification',
      requestData,
      // context,
      transform: (dynamic res) {
        // debugPrint("setupAccountService transform message ${res["message"]}");
        return SetupMerchantAccountDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<AccountVerificationDto>> accountVerificationService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<AccountVerificationDto>(
      // 'auth/merchant/account/validate/otp',
      'auth/customer/account/validate/otp',
      requestData,
      // context,
      transform: (dynamic res) {
        debugPrint("accountVerification transform message ${res["message"]}");
        return AccountVerificationDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<DocumentUploadDto>> documentUploadService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<DocumentUploadDto>(
      'auth/merchant/account/document/upload',
      requestData,
      // context,
      transform: (dynamic res) {
        debugPrint("documentUploadService transform message ${res["message"]}");
        return DocumentUploadDto.fromJson(res);
        // return res;
      },
    );
  }

  Future<ApiResponse<SetupPinDto>> setupPinService(
      Map<String, dynamic> requestData) {
    return si.apiService!.postApi<SetupPinDto>(
      // 'auth/merchant/account/validate/otp',
      'auth/merchant/account/create/password',
      requestData,
      // context,
      transform: (dynamic res) {
        debugPrint("setupPinService transform message ${res["message"]}");
        return SetupPinDto.fromJson(res);
        // return res;
      },
    );
  }


}
