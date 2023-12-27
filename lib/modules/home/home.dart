import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Column(
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
                    Styles.semiBold("David Muritala",
                        color: AppColors.black, fontSize: 18.sp),
                  ],
                ),
                SvgPicture.asset(SvgAssets.bell),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Container(
                    width: deviceWidth(context),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
                    decoration: BoxDecoration(
                      color: AppColors.offGrey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        Styles.medium(
                            "Novel GLP-1 agonist could lead to long-lasting type 2 diabetes…",
                            color: AppColors.black,
                            fontSize: 16.sp),
                        HSpace(16.h),
                        Styles.regular(
                            "A study by scientists at the University of Tabriz, Iran, has engineered a novel long-acting GLP-1 agonist that, if successful in clinical trials, may increase the time between treatments for those with type 2 diabetes..",
                            color: AppColors.black,
                            fontSize: 12.sp),

                        ///Image
                        HSpace(8.h),
                        Image.asset(
                          ImageAssets.post,
                        ),
                        HSpace(8.h),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, RoutePaths.published),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Styles.medium("View Post",
                                  color: AppColors.purple, fontSize: 14.sp),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
