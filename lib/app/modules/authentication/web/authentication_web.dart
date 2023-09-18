// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/modules/main_page/main_page.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';
import 'package:kenalipenyakit/app/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class AuthenticationWeb extends StatefulWidget {
  const AuthenticationWeb({super.key});

  @override
  _AuthenticationWebState createState() => _AuthenticationWebState();
}

class _AuthenticationWebState extends State<AuthenticationWeb> {
  bool isLoginScreen = true;
  bool passwordVisibility = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(Colors.transparent, AppStyles.colors.bgDark);
    //
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockHeight * 3.0 + SizeConfig.blockWidth,
            horizontal: SizeConfig.blockHeight * 3.0 + SizeConfig.blockWidth),
        decoration: BoxDecoration(
          color: AppStyles.colors.bgDark,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(
                    right: SizeConfig.blockWidth * 2.5,
                    left: SizeConfig.blockWidth * 2.5,
                    bottom: SizeConfig.blockWidth * 5,
                  ),
                  child: Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_d9nqiiaz.json',
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 150),
                          height: (isLoginScreen == false)
                              ? SizeConfig.blockHeight * 3.9 +
                                  SizeConfig.blockWidth * 3.9
                              : 0,
                          child: (isLoginScreen == false)
                              ? CustomTextFieldWeb(
                                  hintText: "Nama lengkap",
                                  useSuffixIcon: false,
                                  // onChanged: (text) =>
                                  //     _authController.fullname = text,
                                  textCapitalization: TextCapitalization.words,
                                  filteringTextInputFormatter: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[a-z A-Z (space)]')),
                                  ],
                                )
                              : Container(),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1.7 +
                              SizeConfig.blockWidth * 1.7,
                        ),
                        CustomTextFieldWeb(
                          icon: Icons.email_outlined,
                          hintText: "Email",
                          useSuffixIcon: false,

                          // onChanged: (text) => _authController.email = text,
                          filteringTextInputFormatter: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1.7 +
                              SizeConfig.blockWidth * 1.7,
                        ),
                        CustomTextFieldWeb(
                          hintText: "Kata sandi",
                          visibility: passwordVisibility,
                          icon: Icons.lock_rounded,
                          useSuffixIcon: true,
                          // onChanged: (text) =>
                          //     _authController.password = text,
                          function: () {
                            checkPasswordVisibility();
                          },
                          filteringTextInputFormatter: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1.7 +
                              SizeConfig.blockWidth * 1.7,
                        ),
                        (isLoading == true)
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockWidth * 0.4 +
                                        SizeConfig.blockHeight * 0.4),
                                height: SizeConfig.blockHeight * 3.9 +
                                    SizeConfig.blockWidth * 3.9,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: AppStyles.colors.cyan,
                                )),
                              )
                            : CustomButton(
                                height: SizeConfig.blockHeight * 3.9 +
                                    SizeConfig.blockWidth * 3.9,
                                onlyIcon: false,
                                borderRadius: 12,
                                color: AppStyles.colors.cyan.withOpacity(0.8),
                                borderColor:
                                    AppStyles.colors.cyan.withOpacity(0.8),
                                titleColor: AppStyles.colors.bgDark,
                                fontSize: 2.4 * SizeConfig.blockHeight +
                                    SizeConfig.blockWidth,
                                title: (isLoginScreen) ? "Login" : "Registrasi",
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainPage()),
                                  );
                                }),
                        SizedBox(
                          height: SizeConfig.blockHeight * 0.4 +
                              SizeConfig.blockWidth * 0.4,
                        ),
                        GestureDetector(
                          onTap: () {
                            changeScreen();
                          },
                          child: Center(
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockHeight * 1.0 +
                                      SizeConfig.blockWidth),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      (isLoginScreen)
                                          ? "Tidak memiliki akun?  "
                                          : "Sudah memiliki akun?  ",
                                      style: AppStyles.textStyles.poppinsMedium
                                          .copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockWidth +
                                                  SizeConfig.blockHeight),
                                    ),
                                    AutoSizeText(
                                      (isLoginScreen) ? "Registrasi" : "Masuk",
                                      style: AppStyles.textStyles.poppinsMedium
                                          .copyWith(
                                              color: AppStyles.colors.cyan,
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.blockWidth +
                                                  SizeConfig.blockHeight),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
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
