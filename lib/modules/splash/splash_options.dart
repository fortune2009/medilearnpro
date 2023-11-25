import 'package:carousel_slider/carousel_slider.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

import '../../router/route_paths.dart';

class SplashOptions extends StatefulWidget {
  const SplashOptions({Key? key}) : super(key: key);

  @override
  State<SplashOptions> createState() => _SplashOptionsState();
}

class _SplashOptionsState extends State<SplashOptions> {

  CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;
  int idx = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: deviceHeight(context).h, width: deviceWidth(context).w,
        child: Column(
          children: [
            HSpace(37+47.h),
            CarouselSlider.builder(
              itemCount: ImageAssets.splashOpt.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                var item = ImageAssets.splashOpt[itemIndex];
                return Image.asset(
                  // width: 242.w,
                  height: 242.h,
                  item,
                );
              }, options: CarouselOptions(
              // height: 300.h,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 0.51,
                aspectRatio: 1.18,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }
            ),
              carouselController: buttonCarouselController,
            ),
            HSpace(14.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: ImageAssets.splashOpt.map((value) {
                  int index = ImageAssets.splashOpt.indexOf(value);
                  return Container(
                    width: currentIndex == index ? 30.w : 12.w,
                    height: 5.w,
                    margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: currentIndex == index ? AppColors.primaryColor : AppColors.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                }).toList(),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               HSpace(49.h),
               currentIndex == 0
               ? Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Text.rich(TextSpan(
                         children: [
                       Styles.spanRegular("Get ", color: AppColors.black, fontSize: 40.sp, fontWeight: FontWeight.w700,),
                       Styles.spanRegular("Free ", color: AppColors.primaryColor, fontSize: 40.sp, fontWeight: FontWeight.w700,),
                       Styles.spanRegular("healthcare services", color: AppColors.black, fontSize: 40.sp, fontWeight: FontWeight.w700,),])),
                   ),
                   HSpace(15.h),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Styles.regular("Have access to free online lessons across our multi-dimensional article", color: AppColors.black, fontSize: 14.sp,),
                   ),
                 ],
               )
               : currentIndex == 1
               ? Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Text.rich(TextSpan(
                         children: [
                       Styles.spanRegular("Boost ", color: AppColors.black, fontSize: 40.sp, fontWeight: FontWeight.w700,),
                       Styles.spanRegular("Medical ", color: AppColors.primaryColor, fontSize: 40.sp, fontWeight: FontWeight.w700,),
                       Styles.spanRegular("Knowledge with Us", color: AppColors.black, fontSize: 40.sp, fontWeight: FontWeight.w700,),])),
                   ),
                   HSpace(15.h),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Styles.regular("Elevate Your Medical Expertise with Our Cutting-Edge E-Learning Medic App. Learn, Master, Excel", color: AppColors.black, fontSize: 14.sp,),
                   ),

                 ],
               )
               : Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Text.rich(TextSpan(
                         children: [
                       Styles.spanRegular("Stay Informed with your Medical ", color: AppColors.black, fontSize: 36.sp, fontWeight: FontWeight.w700,),
                       Styles.spanRegular("Expertise", color: AppColors.primaryColor, fontSize: 38.sp, fontWeight: FontWeight.w700,),])),
                   ),
                   HSpace(15.h),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.w),
                     child: Styles.regular("Stay Informed, Elevate Your Medical Expertise with Our Dynamic E-Learning Medic App and Live Feeds", color: AppColors.black, fontSize: 14.sp,),
                   ),
                 ],
               ),
               HSpace(76.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(isActive: true, margin: 24.w, width: deviceWidth(context) / 2.w, title: currentIndex == 2 ? "Get Started" : "Next",
                      onPress: currentIndex == 2 ? () => Navigator.pushNamed(context, RoutePaths.setupAccount) : () => buttonCarouselController.nextPage()),
                ],
              ),
              HSpace(16.h),
            ],),
          ],
        ),
      )
    );
  }
}
