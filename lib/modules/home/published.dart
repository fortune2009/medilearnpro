import 'package:medilearnpro/shared/widgets/all_package.dart';

class Published extends StatelessWidget {
  const Published({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 150.h,
              padding: EdgeInsets.only(
                  left: 16.w, right: 24.w, top: 45.h, bottom: 0.h),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(SvgAssets.backBtn)),
                  // SvgPicture.asset(SvgAssets.bell),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
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
                      child: Styles.semiBold("Update",
                          color: AppColors.purple, fontSize: 12.sp),
                    ),
                    HSpace(25.h),
                    Styles.medium(
                        "How changes in mitochondria may play a role in Alzheimer’s onset",
                        color: AppColors.black,
                        fontSize: 16.sp),
                    HSpace(16.h),

                    ///Image
                    Image.asset(
                      ImageAssets.post,
                    ),
                    HSpace(16.h),

                    Styles.regular(
                        """Controversy has marred Alzheimer’s research over the past year due to disagreements about the Food and Drug Administration’s (FDA) accelerated approval of two drugs for the condition.
                        Two drugs recently approved by the FDA for Alzheimer’s — aducanumab and lecanemab — are that build up in the brains of people with Alzheimer’s disease.
                        As clinical trials have not conclusively shown that these drugs improve Alzheimer’s symptoms, some researchers are asking if different targets for the pharmaceutical treatment of Alzheimer’s disease need to be considered.
                    For new targets to be identified, researchers need to explore other mechanisms underpinning the development of the condition.
                    One of those potential mechanisms concerns changes in energy metabolism. The brain uses up around 25% of the energy our body uses, and disruption to this can affect its ability to function normally.
                        A team of researchers based at the Karolinska Institutet, Solna, Sweden, recently demonstrated that changes in the mitochondria—the powerhouse of the cell—can lead to neuronal damage""",
                        color: AppColors.black,
                        fontSize: 12.sp,
                        align: TextAlign.justify),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
