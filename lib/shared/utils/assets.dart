// ignore_for_file: constant_identifier_names

const String IMAGEPATH = "assets/images";
const String SVGPATH = "assets/svg";
const String LOTTIEPATH = "assets/lottie";

class ImageAssets {
  static const String logo = "$IMAGEPATH/logo.png";
  static const String post = "$IMAGEPATH/post.png";

  // static const String successIcon = "$IMAGEPATH/success_icon.png";
  // static const String splash1 = "$IMAGEPATH/splash_1.png";
  // static const String splash2 = "$IMAGEPATH/splash_2.png";
  // static const String splash3 = "$IMAGEPATH/splash_3.png";
  static const List<String> splashOpt = [
    "$IMAGEPATH/splash_1.png",
    "$IMAGEPATH/splash_2.png",
    "$IMAGEPATH/splash_3.png"
  ];
}

class SvgAssets {
  static const String eye = "$SVGPATH/eye.svg";
  static const String eyeSlash = "$SVGPATH/eye_slash.svg";
  static const String file = "$SVGPATH/file.svg";
  static const String home = "$SVGPATH/home.svg";
  static const String home1 = "$SVGPATH/home_1.svg";
  static const String lesson = "$SVGPATH/lessons.svg";
  static const String lesson1 = "$SVGPATH/lessons_1.svg";
  static const String profile = "$SVGPATH/profile.svg";
  static const String profile1 = "$SVGPATH/profile_1.svg";
  static const String bell = "$SVGPATH/bell.svg";
  static const String backBtn = "$SVGPATH/back_btn.svg";
}

class LottieAssets {
  static const String success = "$LOTTIEPATH/success.json";
  static const String warning = "$LOTTIEPATH/attention.json";
  static const String cancel = "$LOTTIEPATH/cancel.json";
}
