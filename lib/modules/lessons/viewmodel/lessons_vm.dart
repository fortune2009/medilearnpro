import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/services/lessons_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/lessons/video_lessons_model.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class LessonsViewModel extends BaseViewModel {
  final BuildContext? context;
  final LessonsService? lessonsService;
  String? message;
  VideoModel? videoModel;
  List<Item>? itemsList;

  LessonsViewModel({this.context, this.lessonsService});

  @override
  FutureOr<void> init() {
    fetchLessons(data: {
      "part": "snippet",
      "maxResults": "15",
      "q": "avoiding child mortality rate",
      "type": "video",
      "key": "AIzaSyBLhLFN4m2N1dasoKPsOf2K35peKrugoCY"
    });
  }

  Future<bool> fetchLessons({Map<String, String>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<VideoModel> res =
          await lessonsService!.fetchLessonsService(data!, context: context!);
      debugPrint("fetchFeed message from res ${res.message}");
      if (res.error!) {
        debugPrint("fetchFeed error message ${res.message}");
        message = res.message ?? "Error occurred vm";
        setLoadingState(false);
        return false;
      } else {
        // message = "Account created successfully!";
        // message = res.message;
        debugPrint("fetchFeed success message $message");
        debugPrint("fetchFeed success data ${res.data}");
        videoModel = res.data;
        itemsList = res.data!.items;
        // si.storageService.setItem("reg_data", json.encode(res.data!.data!));
        setLoadingState(false);
        return true;
      }
    } catch (e) {
      setLoadingState(false);
      message = e.toString();
      debugPrint("fetchFeed catch message $e");
      return false;
    }
  }
}
