import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/modules/authentication/viewmodel/forgot_password_vm.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
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
                    "Forgot your password? ",
                    // "Let's get you in with a new password",
                    color: AppColors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  HSpace(24.h),
                  _buildForm(context, viewModel),
                  CustomButton(
                    isActive: true,
                    margin: 0.w,
                    title: "Continue",
                    onPress: () => viewModel.validateEmail(formKey),
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
              controller: viewModel.emailController,
              label: "Email Address",
              labelColor: AppColors.textDarkColor,
              textInputType: TextInputType.emailAddress,
              hintText: "Enter Email Address",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: EmailValidator.validateEmail,
            ),
            HSpace(40.h),
          ],
        ));
  }
}
