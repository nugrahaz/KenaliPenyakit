import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/modules/main_page/main_page.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';
import 'package:kenalipenyakit/app/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class AuthenticationMobile extends StatefulWidget {
  const AuthenticationMobile({Key? key}) : super(key: key);

  @override
  State<AuthenticationMobile> createState() => _AuthenticationScreen();
}

class _AuthenticationScreen extends State<AuthenticationMobile> {
  bool isLoginScreen = true;
  bool passwordVisibility = true;
  bool isLoading = false;

  @override
  void initState() {
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.bgDark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppStyles.colors.bgDark,
      drawerScrimColor: AppStyles.colors.bgDark,
      body: Stack(
        children: [
          //gambar pojok kiri atas
          Positioned(
            top: SizeConfig.blockHeight * -2.5,
            left: SizeConfig.blockWidth * -7.0,
            child: Image.asset(
              AssetsPath.images.flowTop,
              color: AppStyles.colors.cyan,
              width: SizeConfig.blockWidth * 20.0,
            ),
          ),
          //gambar pojok kanan bawah
          Positioned(
            bottom: -2.0 * SizeConfig.blockHeight,
            right: -7.0 * SizeConfig.blockWidth,
            child: Image.asset(
              AssetsPath.images.flowBottom,
              width: 20.0 * SizeConfig.blockWidth,
              color: AppStyles.colors.cyan,
            ),
          ),

          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.0 * SizeConfig.blockWidth),
            child: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 1.0 * SizeConfig.blockHeight),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: (isLoginScreen == true)
                          ? 50.0 * SizeConfig.blockWidth
                          : !isKeyboardShowing
                              ? 40.0 * SizeConfig.blockWidth
                              : 30.0 * SizeConfig.blockWidth,
                      child: Lottie.asset(
                        AssetsPath.lotties.doctor,
                        reverse: false,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: isKeyboardShowing
                            ? 1.0 * SizeConfig.blockHeight
                            : 2.5 * SizeConfig.blockHeight),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: (isLoginScreen == false)
                          ? 15.5 * SizeConfig.blockWidth
                          : 0,
                      child: (isLoginScreen == false)
                          ? CustomTextField(
                              hintText: "Nama lengkap",
                              colorIcon: AppStyles.colors.cyan,
                              useSuffixIcon: false,
                              textCapitalization: TextCapitalization.words,
                              filteringTextInputFormatter: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z A-Z (space)]')),
                              ],
                            )
                          : Container(),
                    ),
                    CustomTextField(
                      icon: Icons.email_outlined,
                      hintText: "Email",
                      colorIcon: AppStyles.colors.cyan,
                      useSuffixIcon: false,
                      filteringTextInputFormatter: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      ],
                    ),
                    CustomTextField(
                      hintText: "Kata Sandi",
                      visibility: passwordVisibility,
                      icon: Icons.lock_rounded,
                      colorIcon: AppStyles.colors.cyan,
                      useSuffixIcon: true,
                      iconSuffix: passwordVisibility == false
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      function: () {
                        checkPasswordVisibility();
                      },
                      filteringTextInputFormatter: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      ],
                    ),
                    SizedBox(
                      height: 1.5 * SizeConfig.blockHeight,
                    ),
                    //awalnya pake widget visibility
                    //cuman berhubung A13 menyisipkan
                    //soft animation di keyboard jadi janky
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height:
                          isKeyboardShowing ? 0 : 27.0 * SizeConfig.blockWidth,
                      child: Container(
                        color: AppStyles.colors.transparent,
                        child: SingleChildScrollView(
                          physics:
                              const NeverScrollableScrollPhysics(), // fix scroll
                          child: Column(
                            children: [
                              (isLoading)
                                  ? SizedBox(
                                      height: 14.0 * SizeConfig.blockWidth,
                                      child: Center(
                                        child: SpinKitWave(
                                          color: AppStyles.colors.white,
                                          size: 6.0 * SizeConfig.blockWidth,
                                        ),
                                      ),
                                    )
                                  : CustomButton(
                                      onlyIcon: false,
                                      borderRadius: 12,
                                      fontSize: 3.5 * SizeConfig.blockHeight,
                                      height: 9.0 * SizeConfig.blockHeight,
                                      color: AppStyles.colors.cyan,
                                      borderColor: AppStyles.colors.cyan,
                                      titleColor: AppStyles.colors.bgDark,
                                      title: (isLoginScreen)
                                          ? "Login"
                                          : "Registrasi",
                                      function: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()),
                                        );
                                      }),
                              SizedBox(height: 2.0 * SizeConfig.blockHeight),
                              GestureDetector(
                                onTap: () {
                                  changeScreen();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      3.0 * SizeConfig.blockWidth),
                                  color: AppStyles.colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          (isLoginScreen)
                                              ? "Tidak memiliki akun?  "
                                              : "Sudah memiliki akun?  ",
                                          style: AppStyles
                                              .textStyles.poppinsMedium
                                              .copyWith(
                                                  color: AppStyles.colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.3,
                                                  wordSpacing: 0.3,
                                                  fontSize: 3.4 *
                                                      SizeConfig.blockWidth)),
                                      Text(
                                        (isLoginScreen)
                                            ? "Registrasi"
                                            : "Masuk",
                                        style: AppStyles
                                            .textStyles.poppinsSemiBold
                                            .copyWith(
                                                color: AppStyles.colors.cyan,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.2,
                                                wordSpacing: 0.2,
                                                fontSize: 3.4 *
                                                    SizeConfig.blockWidth),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkPasswordVisibility() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  void changeScreen() {
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }
}
