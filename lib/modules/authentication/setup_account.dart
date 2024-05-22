import 'package:firebase_auth/firebase_auth.dart';
import 'package:medilearnpro/core/service-injector/service_injector.dart';
import 'package:medilearnpro/router/route_paths.dart';
import 'package:medilearnpro/shared/widgets/all_package.dart';

class SetupAccount extends StatelessWidget {
  SetupAccount({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                    "Let’s get you Started",
                    color: AppColors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  HSpace(24.h),
                  _buildForm(context),
                  CustomButton(
                    isActive: true,
                    margin: 0.w,
                    title: "Create",
                    onPress: () async {
                      final auth = FirebaseAuth.instance;
                      si.storageService.setBoolItem('app-opened', true);
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        // final exe = FirebaseAuth.instance
                        //     .createUserWithEmailAndPassword(
                        //         email: emailController.text.trim(),
                        //         password: passwordController.text.trim());

                        // var user = exe.additionalUserInfo.
                        // debugPrint("see ${exe.user.toString()}");

                        // var firestore = FirebaseFirestore.instance;
                        // firestore.collection('users').doc(user.uid).set({
                        //   'fullName': fullName,
                        // });

                        // Navigator.pushNamed(context, RoutePaths.signIn);

                        // try {
                        //   UserCredential? userCredential =
                        //       await createUserWithEmailAndPassword(
                        //           emailController.text.trim(),
                        //           passwordController.text.trim());
                        //   if (userCredential != null) {
                        //     debugPrint('User created successfully');
                        //   }
                        // } catch (e) {
                        //   debugPrint('Error: $e');
                        // }

                        final email = emailController.text;
                        final password = passwordController.text;

                        try {
                          UserCredential userCredential =
                              await auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          // User created successfully
                          debugPrint(
                              'User created: ${userCredential.user?.uid}');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'network-request-failed') {
                            debugPrint(
                                'Network error: Please check your internet connection.');
                            // Implement retry logic or show user notification
                          } else {
                            debugPrint('Error: ${e.message}');
                          }
                        } catch (e) {
                          print('Unexpected error: $e');
                        }
                      }
                    },
                  ),
                  HSpace(16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        Styles.spanRegular("Already have an account? ",
                            color: AppColors.textLightColor, fontSize: 14.sp),
                        Styles.spanRegular("Sign in",
                            color: AppColors.textBoldColor,
                            fontSize: 14.sp,
                            fontWeight: FWt.bold,
                            underline: true, recognizer: () {
                          Navigator.pushNamed(context, RoutePaths.signIn);
                        }),
                      ],
                    ),
                  ),
                  HSpace(32.h),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomTextFormField(
            //         // controller: viewModel.firstNameController,
            //         label: "First Name",
            //         labelColor: AppColors.textDarkColor,
            //         textInputType: TextInputType.name,
            //         hintText: "Enter First Name",
            //         autovalidateMode: AutovalidateMode.onUserInteraction,
            //         validator: FieldValidator.validate,
            //       ),
            //     ),
            //     WSpace(24.w),
            //     Expanded(
            //       child: CustomTextFormField(
            //         // controller: viewModel.lastNameController,
            //         label: "Last Name",
            //         labelColor: AppColors.textDarkColor,
            //         textInputType: TextInputType.name,
            //         hintText: "Enter Last Name",
            //         autovalidateMode: AutovalidateMode.onUserInteraction,
            //         validator: FieldValidator.validate,
            //       ),
            //     ),
            //   ],
            // ),
            // HSpace(16.h),
            CustomTextFormField(
              controller: emailController,
              label: "Email Address",
              labelColor: AppColors.textDarkColor,
              textInputType: TextInputType.emailAddress,
              hintText: "Enter Email Address",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: EmailValidator.validateEmail,
            ),
            HSpace(16.h),
            CustomTextFormField(
              controller: passwordController,
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
            HSpace(16.h),
            CustomTextFormField(
              controller: confirmPasswordController,
              label: "Confirm Password",
              labelColor: AppColors.textDarkColor,
              textInputType: TextInputType.visiblePassword,
              hintText: "Enter Confirm Password",
              // obscureText: !viewModel.isConfirmPasswordVisible,
              suffixIcon: GestureDetector(
                  // onTap: viewModel.setConfirmPasswordVisible,
                  child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  // viewModel.isConfirmPasswordVisible
                  true ? SvgAssets.eye : SvgAssets.eyeSlash,
                  width: 20.w,
                  height: 20.h,
                ),
              )),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: PasswordValidator.confirmPassword,
            ),
            HSpace(24.h),
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

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    const int maxRetries = 3;
    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          retryCount++;
          if (retryCount < maxRetries) {
            await Future.delayed(Duration(seconds: 2)); // Wait before retrying
          } else {
            print('Max retries reached. Could not complete the request.');
            rethrow; // Rethrow the exception after max retries
          }
        } else {
          // Handle other FirebaseAuth exceptions
          rethrow;
        }
      } catch (e) {
        // Handle other exceptions
        print('An unexpected error occurred: $e');
        rethrow;
      }
    }
    return null;
  }

// Usage
  void main() async {
    try {
      final email = 'test@example.com';
      final password = 'password123';
      UserCredential? userCredential =
          await createUserWithEmailAndPassword(email, password);
      if (userCredential != null) {
        print('User created successfully');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
