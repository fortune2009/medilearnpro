import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/core/services/storage_service.dart';
import 'package:medilearnpro/core/services/store_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/lessons/video_lessons_model.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class LessonsService {
  LessonsService({
    required this.storageService,
    required this.storeService,
  });

  StorageService storageService;
  StoreService storeService;

  Future<ApiResponse<VideoModel>> fetchLessonsService(
      Map<String, String> params,
      {required BuildContext context}) {
    return si.apiService!.getApiYoutube<VideoModel>(
      'search',
      params: params,
      context: context,
      transform: (dynamic res) {
        debugPrint('BodyLessons: $res');
        return VideoModel.fromJson(res);
      },
    );
  }
}
