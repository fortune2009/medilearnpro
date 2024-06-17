// ignore_for_file: null_argument_to_non_null_type
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medilearnpro/shared/models/home/feeds_model.dart';

import '../../shared/models/api_model.dart';
import '../service-injector/service_injector.dart';
import 'storage_service.dart';
import 'store_service.dart';

class DashboardService {
  DashboardService({
    required this.storageService,
    required this.storeService,
  });

  StorageService storageService;
  StoreService storeService;

  Future<ApiResponse<FeedModel>> fetchPost(Map<String, String> params,
      {required BuildContext context}) {
    return si.apiService!.getApiExternal<FeedModel>(
      'topicsearch.json',
      params: params,
      context: context,
      transform: (dynamic res) {
        debugPrint('Body2: $res');
        return FeedModel.fromJson(res);
      },
    );
  }
}
