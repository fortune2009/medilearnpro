import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/modules/profile/viewmodel/profile_vm.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      vmBuilder: (context) =>
          ProfileViewModel(context: context, profileService: si.profileService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProfileViewModel viewModel) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HSpace(60.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  // color: AppColors.white,
                  color: AppColors.lightGreyTabs,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: TabBar(
                  unselectedLabelColor: AppColors.black,
                  // labelColor: AppColors.black,
                  // indicatorColor: AppColors.primaryColor,
                  indicatorWeight: 1,
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  labelStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'Personal Details',
                    ),
                    Tab(
                      text: 'Tutorial',
                    ),
                  ],
                ),
              ),
            ),
            HSpace(16.h),
            SizedBox(
                height: deviceHeight(context) / 2.h,

                /// If list is empty set to 300.h
                child: TabBarView(
                  // viewportFraction: 0.5,
                  controller: tabController,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HSpace(15.h),
                          Container(
                            width: deviceWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 13.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Styles.regular("Full Name",
                                    fontSize: 12.sp,
                                    color: AppColors.blackText),
                                HSpace(13.h),
                                Styles.medium(
                                    viewModel.userData!.displayName ?? "",
                                    fontSize: 14.sp,
                                    color: AppColors.blackText),
                              ],
                            ),
                          ),
                          HSpace(22.h),
                          Container(
                            width: deviceWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 13.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Styles.regular("Email Address",
                                    fontSize: 12.sp,
                                    color: AppColors.blackText),
                                HSpace(13.h),
                                Styles.medium(viewModel.userData!.email ?? "",
                                    fontSize: 14.sp,
                                    color: AppColors.blackText),
                              ],
                            ),
                          ),
                          HSpace(22.h),
                          // Container(
                          //   width: deviceWidth(context),
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 16.w, vertical: 13.h),
                          //   decoration: BoxDecoration(
                          //       color: AppColors.white,
                          //       border: Border.all(color: AppColors.borderGrey),
                          //       borderRadius: BorderRadius.circular(8.r)),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Styles.regular("Mobile Number",
                          //           fontSize: 12.sp,
                          //           color: AppColors.blackText),
                          //       HSpace(13.h),
                          //       Styles.medium("+234 80 852 08502",
                          //           fontSize: 14.sp,
                          //           color: AppColors.blackText),
                          //     ],
                          //   ),
                          // ),
                          // HSpace(22.h),
                          // Container(
                          //   width: deviceWidth(context),
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 16.w, vertical: 13.h),
                          //   decoration: BoxDecoration(
                          //       color: AppColors.white,
                          //       border: Border.all(color: AppColors.borderGrey),
                          //       borderRadius: BorderRadius.circular(8.r)),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Styles.regular("Region",
                          //           fontSize: 12.sp,
                          //           color: AppColors.blackText),
                          //       HSpace(13.h),
                          //       Styles.medium("Lagos, Nigeria",
                          //           fontSize: 14.sp,
                          //           color: AppColors.blackText),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HSpace(15.h),
                          Container(
                            width: deviceWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 13.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Styles.regular("Lessons Taken",
                                    fontSize: 12.sp,
                                    color: AppColors.blackText),
                                HSpace(13.h),
                                Styles.medium("0",
                                    fontSize: 14.sp,
                                    color: AppColors.blackText),
                              ],
                            ),
                          ),
                          HSpace(22.h),
                          Container(
                            width: deviceWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 13.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Styles.regular("Quizz Completed",
                                    fontSize: 12.sp,
                                    color: AppColors.blackText),
                                HSpace(13.h),
                                Styles.medium("0",
                                    fontSize: 14.sp,
                                    color: AppColors.blackText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
