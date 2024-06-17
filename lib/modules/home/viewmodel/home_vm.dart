import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/services/dashboard_service.dart';
import 'package:medilearnpro/shared/models/api_model.dart';
import 'package:medilearnpro/shared/models/home/feeds_model.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class HomeViewModel extends BaseViewModel {
  final BuildContext? context;
  final DashboardService? dashboardService;
  String? message;
  FeedModel? feedModel;

  HomeViewModel({this.context, this.dashboardService});

  @override
  FutureOr<void> init() {
    fetchFeed(data: {"TopicId": "30548"});
  }

  Future<bool> fetchFeed({Map<String, String>? data}) async {
    setLoadingState(true);

    try {
      final ApiResponse<FeedModel> res =
          await dashboardService!.fetchPost(data!, context: context!);
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
        feedModel = res.data;
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
