import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/modules/authentication/viewmodel/forgot_password_vm.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      vmBuilder: (context) => ForgotPasswordViewModel(
          context: context, authenticationService: si.authenticationService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ForgotPasswordViewModel viewModel) {
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
                    "Let's get you in with a new password",
                    color: AppColors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  HSpace(24.h),
                  _buildForm(context, viewModel),
                  HSpace(40.h),
                  CustomButton(
                    isActive: true,
                    margin: 0.w,
                    title: "Reset Password",
                    onPress: () => viewModel.validateResetCode(formKey),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildForm(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: viewModel.oobCodeController,
              label: "Otp",
              labelColor: AppColors.textDarkColor,
              textInputType: TextInputType.visiblePassword,
              hintText: "Enter Otp",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: PasswordValidator.validateLoginPassword,
            ),
            HSpace(16.h),
            CustomTextFormField(
              controller: viewModel.newPasswordController,
              label: "New Password",
              labelColor: AppColors.textDarkColor,
              textInputType: TextInputType.visiblePassword,
              hintText: "Enter New Password",
              obscureText: !viewModel.isPasswordVisible,
              suffixIcon: GestureDetector(
                  onTap: viewModel.setPasswordVisible,
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: SvgPicture.asset(
                      viewModel.isPasswordVisible
                          ? SvgAssets.eye
                          : SvgAssets.eyeSlash,
                      width: 20.w,
                      height: 20.h,
                    ),
                  )),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: PasswordValidator.validatePassword,
            ),
          ],
        ));
  }
}
