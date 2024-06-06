import 'package:medilearnpro/shared/widgets/all_package.dart';

class MediNotification extends StatefulWidget {
  const MediNotification({Key? key}) : super(key: key);

  @override
  State<MediNotification> createState() => _MediNotificationState();
}

class _MediNotificationState extends State<MediNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      appBar: buildAppbar(
          context: context,
          title: Styles.semiBold("Notifications",
              color: AppColors.black, fontSize: 18.sp),
          hasLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HSpace(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  1 + 1 == 2
                      ? Padding(
                          padding: EdgeInsets.all(24.r),
                          child: Center(
                            child: Styles.regular("No notification!",
                                color: AppColors.black, fontSize: 16.sp),
                          ),
                        )
                      : ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          width: 0.5, color: AppColors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Styles.medium(
                                          "How to Prescribe Antin Tatanus",
                                          color: AppColors.black,
                                          fontSize: 12.sp),
                                      HSpace(3.h),
                                      Styles.regular(
                                          "As clinical trials have not conclusively shown that these drugs improve Alzheimer’s symptoms, some researchers are asking if different targets .",
                                          color: AppColors.black,
                                          fontSize: 12.sp),
                                    ],
                                  ),
                                ),
                              ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
