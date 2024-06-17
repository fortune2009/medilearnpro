import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/modules/home/published.dart';
import 'package:medilearnpro/modules/home/viewmodel/home_vm.dart';
import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? displayName;
  @override
  void initState() {
    var data = jsonDecode(si.storageService.getItemSync('user'));
    displayName = data["displayName"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(
          context: context, dashboardService: si.dashboardService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 30.h, bottom: 25.h),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.regular("Welcome Back,",
                          color: AppColors.black, fontSize: 14.sp),
                      // Styles.semiBold("David Muritala",
                      Styles.semiBold(displayName ?? "",
                          color: AppColors.black, fontSize: 18.sp),
                    ],
                  ),
                  InkWell(
                      onTap: () => Navigator.pushNamed(
                          context!, RoutePaths.notification),
                      child: SvgPicture.asset(SvgAssets.bell)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HSpace(18.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightPink,
                      borderRadius: BorderRadius.circular(72.r),
                    ),
                    child: Styles.semiBold("Feed",
                        color: AppColors.purple, fontSize: 12.sp),
                  ),
                  HSpace(16.h),
                  viewModel.feedModel == null
                      ? const Center(child: Loader())
                      : Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewModel.feedModel!.result!.resources!
                                  .resource![0].sections!.section!.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item = viewModel
                                    .feedModel!
                                    .result!
                                    .resources!
                                    .resource![0]
                                    .sections!
                                    .section![index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Published(
                                              content: item.content ?? ""))),
                                  child: Container(
                                    width: deviceWidth(context),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 23.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.offGrey,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Styles.medium(
                                        Styles.regular(
                                            // "Novel GLP-1 agonist could lead to long-lasting type 2 diabetes…",
                                            item.title ?? "",
                                            color: AppColors.black,
                                            fontSize: 16.sp),
                                        HSpace(16.h),
                                        Styles.regular(
                                            // "A study by scientists at the University of Tabriz, Iran, has engineered a novel long-acting GLP-1 agonist that, if successful in clinical trials, may increase the time between treatments for those with type 2 diabetes..",
                                            item.description ?? "",
                                            color: AppColors.black,
                                            fontSize: 12.sp),

                                        ///Image
                                        HSpace(8.h),
                                        Image.asset(
                                          ImageAssets.post,
                                        ),
                                        // GestureDetector(
                                        //   onTap: () => Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) => Published(
                                        //                 resource: item,
                                        //               ))),
                                        //   child: Image.network(
                                        //     item.imageUrl!,
                                        //     height: 300.h,
                                        //   ),
                                        // ),
                                        HSpace(8.h),
                                        GestureDetector(
                                          // onTap: () => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => Published(
                                          //             content:
                                          //                 item.content ?? ""))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Styles.medium("View Post",
                                                  color: AppColors.purple,
                                                  fontSize: 14.sp),
                                              WSpace(12.w),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.purple,
                                                size: 16.sp,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
