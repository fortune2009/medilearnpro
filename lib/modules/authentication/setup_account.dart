import 'package:medilearnpro/shared/widgets/all_package.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({Key? key}) : super(key: key);

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: buildAppbar(context: context, hasLeading: false),
        body: SizedBox(
          height: deviceHeight(context).h, width: deviceWidth(context).w,
          child: Column(
            children: [
              HSpace(46.h),
              Styles.regular("Let’s get you Started", color: AppColors.black, fontSize: 40.sp, fontWeight: FontWeight.w700,),
              HSpace(14.h),

              CustomButton(isActive: true, margin: 24.w, title: "Continue", onPress: () {  },),
            ],
          ),
        )
    );
  }
}
