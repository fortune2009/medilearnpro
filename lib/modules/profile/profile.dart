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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HSpace(60.h),
            CircleAvatar(
              radius: 60.r,
            ),
            HSpace(18.h),
            Styles.regular("Class 1 • Section A",
                color: AppColors.black, fontSize: 12.sp),
            HSpace(14.h),
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
                height: deviceHeight(context) / 2.5.h,

                /// If list is empty set to 300.h
                child: TabBarView(
                  // viewportFraction: 0.5,
                  controller: tabController,
                  children: [
                    Container(),
                    Container(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
