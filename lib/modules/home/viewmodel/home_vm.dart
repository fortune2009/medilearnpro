import 'package:medilearnpro/core/base/base_viewmodel.dart';
import 'package:medilearnpro/core/services/dashboard_service.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class HomeViewModel extends BaseViewModel {
  final BuildContext? context;
  final DashboardService? dashboardService;
  String? message;

  HomeViewModel({this.context, this.dashboardService});

  @override
  FutureOr<void> init() {}
}
