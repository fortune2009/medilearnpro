import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBGColor,
        appBar: buildAppbar(context: context, hasLeading: false),
        body: SizedBox(
          height: deviceHeight(context).h,
          width: deviceWidth(context).w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HSpace(24.h),
                  Styles.regular(
                    "Hey there 👋, Welcome Back",
                    color: AppColors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  HSpace(24.h),
                  _buildForm(context),
                  CustomButton(
                    isActive: true,
                    margin: 0.w,
                    title: "Sign in",
                    onPress: () =>
                        Navigator.pushNamed(context, RoutePaths.bottomNav),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        // key: viewModel.signupFormKey,
        child: Column(
      children: [
        CustomTextFormField(
          // controller: viewModel.emailController,
          label: "Email Address",
          labelColor: AppColors.textDarkColor,
          textInputType: TextInputType.emailAddress,
          hintText: "Enter Email Address",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: EmailValidator.validateEmail,
        ),
        HSpace(16.h),
        CustomTextFormField(
          // controller: viewModel.passwordController,
          label: "Password",
          labelColor: AppColors.textDarkColor,
          textInputType: TextInputType.visiblePassword,
          hintText: "Enter Password",
          // obscureText: !viewModel.isPasswordVisible,
          suffixIcon: GestureDetector(
              // onTap: viewModel.setPasswordVisible,
              child: Padding(
            padding: EdgeInsets.all(15.r),
            child: SvgPicture.asset(
              // viewModel.isPasswordVisible
              true ? SvgAssets.eye : SvgAssets.eyeSlash,
              width: 20.w,
              height: 20.h,
            ),
          )),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: PasswordValidator.validatePassword,
        ),
        HSpace(deviceHeight(context) / 3.9.h),
        Divider(),
        HSpace(16.h),
        RichText(
          text: TextSpan(
            children: [
              Styles.spanRegular(
                  "Clicking continue Shows that you agree to our ",
                  color: AppColors.textLightColor,
                  fontSize: 14.sp),
              Styles.spanRegular("Terms and Conditions",
                  color: AppColors.textBoldColor,
                  fontSize: 14.sp,
                  fontWeight: FWt.bold,
                  underline: true, recognizer: () async {
                await openBrowserTab(
                    url: "https://app.simplebks.com/terms-of-service");
              }),
              Styles.spanRegular(
                " while interacting with our platform",
                color: AppColors.textLightColor,
                fontSize: 14.sp,
              ),
              // Styles.spanRegular("Privacy Policy.",
              //     color: AppColors.textDarkColor,
              //     fontSize: 11.sp,
              //     underline: true, recognizer: () async {
              //   await openBrowserTab(
              //       url: "https://app.simplebks.com/privacy-policy");
              // }),
            ],
          ),
        ),
        HSpace(26.8.h),
      ],
    ));
  }
}
