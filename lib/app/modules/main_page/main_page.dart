import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/modules/main_page/component/content.dart';
import 'package:kenalipenyakit/app/modules/main_page/component/navigation_bar.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPosition = 0;

  List<Widget> pages = [
    ActivityMenu(),
    ActivityMenu(),
    ActivityMenu(),
  ];

  List<bool> pageSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: (SizeConfig.screenWidth < 900)
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: AppStyles.colors.bgDark,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6 * SizeConfig.blockHeight,
                        bottom: 3 * SizeConfig.blockHeight),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              minHeight: SizeConfig.blockWidth +
                                  SizeConfig.blockHeight * 10.0,
                              maxHeight: 5 * SizeConfig.blockWidth +
                                  SizeConfig.blockHeight * 25.0,
                            ),
                            child: Lottie.asset(
                              AssetsPath.lotties.sad,
                              reverse: false,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 2 +
                                SizeConfig.blockWidth,
                          ),
                          Container(
                            height: 30 * SizeConfig.blockHeight,
                            width: 66 * SizeConfig.blockWidth,
                            child: Center(
                              child: AutoSizeText(
                                "Maaf, untuk saat ini tidak mendukung layar tablet atau yang lebih kecil, mohon untuk menggunakan desktop",
                                style: AppStyles.textStyles.poppinsSemiBold
                                    .copyWith(
                                        color: Colors.white.withOpacity(0.85),
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5,
                                        fontSize: 2.5 * SizeConfig.blockWidth,
                                        height: 1.5),
                                textAlign: TextAlign.center,
                                minFontSize: 10,
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.all(
                    SizeConfig.blockWidth * 1.9 + SizeConfig.blockHeight * 0.9),
                child: Row(
                  children: [
                    // Navigation Bar
                    Container(
                      margin: EdgeInsets.only(
                        right: SizeConfig.blockWidth * 2 +
                            SizeConfig.blockHeight * 1.5,
                      ),
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth / 5.5,
                      decoration: BoxDecoration(
                          color: AppStyles.colors.bgDark,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Stack(
                        children: [
                          ListView(
                            children: [
                              //Nama Aplikasi
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetsPath.images.appLogo,
                                      fit: BoxFit.fitWidth,
                                      width: SizeConfig.blockWidth * 5,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Dikitis",
                                      style: AppStyles.textStyles.poppinsBold
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontSize: 20.0,
                                              letterSpacing: 4,
                                              wordSpacing: 4),
                                    ),
                                  ],
                                ),
                              ),
                              //Menu Bar
                              Column(
                                children: [
                                  NavBarItem(
                                    icon: Icons.home,
                                    title: " Home",
                                    active: pageSelected[0],
                                    touched: () {
                                      select(0);
                                    },
                                  ),
                                  NavBarItem(
                                    icon: Icons.message,
                                    title: " Messages",
                                    active: pageSelected[1],
                                    touched: () {
                                      select(1);
                                    },
                                  ),
                                  NavBarItem(
                                    icon: Icons.verified_outlined,
                                    title: " Verification",
                                    active: pageSelected[2],
                                    touched: () {
                                      select(2);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Divider(
                                    height: 2,
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppStyles.colors.bgDark,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: NavBarItem(
                                    title: " Log Out",
                                    icon: Icons.sensor_door,
                                    active: false,
                                    touched: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Content
                    Expanded(
                        child: IndexedStack(
                      index: indexPosition,
                      children: pages,
                    ))
                  ],
                ),
              ),
      ),
    );
  }

  void select(int n) {
    for (int i = 0; i < pageSelected.length; i++) {
      if (i != n) {
        pageSelected[i] = false;
      } else {
        pageSelected[i] = true;
      }
    }
    indexPosition = n;
  }
}
