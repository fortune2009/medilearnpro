import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/modules/lessons/video_player.dart';
import 'package:medilearnpro/modules/lessons/viewmodel/lessons_vm.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class Lessons extends StatelessWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LessonsViewModel>(
      vmBuilder: (context) =>
          LessonsViewModel(context: context, lessonsService: si.lessonsService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LessonsViewModel viewModel) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HSpace(100.h),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 30.h,
              ),
              child: Styles.regular("Lets get you informed",
                  color: AppColors.black, fontSize: 16.sp),
            ),
            // Container(
            //   // height: 100.h,
            //   padding: EdgeInsets.only(
            //     left: 24.w,
            //     right: 24.w,
            //     top: 30.h,
            //   ),
            //   decoration: const BoxDecoration(
            //       // color: AppColors.white,
            //       ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Styles.regular("Lets get you caught up",
            //               color: AppColors.black, fontSize: 14.sp),
            //           // HSpace(4.h),
            //           // Styles.semiBold("David Muritala",
            //           //     color: AppColors.black, fontSize: 18.sp),
            //         ],
            //       ),
            //       // SvgPicture.asset(SvgAssets.bell),
            //     ],
            //   ),
            // ),
            // HSpace(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextFormField(
                hintText: "Search",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(SvgAssets.search),
                ),
                onSaved: (value) {
                  if (value.length >= 6) {
                    viewModel.fetchLessons(data: {
                      "part": "snippet",
                      "maxResults": "15",
                      "q": value,
                      "type": "video",
                      "key": "AIzaSyBLhLFN4m2N1dasoKPsOf2K35peKrugoCY"
                    });
                  }
                },
              ),
            ),
            HSpace(25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HSpace(18.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightPink,
                      borderRadius: BorderRadius.circular(72.r),
                    ),
                    child: Styles.semiBold("Video Lessons",
                        color: AppColors.purple, fontSize: 12.sp),
                  ),
                  HSpace(16.h),
                  viewModel.itemsList == null
                      ? const Center(child: Loader())
                      : ListView.builder(
                          itemCount: viewModel.itemsList!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = viewModel.itemsList![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                      videoId: item.id!.videoId!,
                                      snippet: item.snippet!,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 30.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        // height: 90.h,
                                        // child: Image.asset(
                                        //   ImageAssets.post,
                                        child: Image.network(
                                          item.snippet!.thumbnails!
                                              .thumbnailsDefault!.url!,
                                        ),
                                      ),
                                    ),
                                    WSpace(8.w),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        // width: deviceWidth(context) / 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Styles.medium(item.snippet!.title!,
                                                color: AppColors.black,
                                                fontSize: 12.sp),
                                            HSpace(3.h),
                                            Styles.regular(
                                                item.snippet!.description!,
                                                color: AppColors.black,
                                                fontSize: 12.sp),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
