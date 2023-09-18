import 'package:flutter/material.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/modules/main_page/component/activity_menu_card.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';
import 'package:lottie/lottie.dart';

class ActivityMenu extends StatelessWidget {
  ActivityMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ** Menu ** //
        Container(
          width: SizeConfig.blockWidth * 33,
          child: Column(
            children: [
              //header
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: AppStyles.colors.bgDark,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 2.5),
                margin: EdgeInsets.only(
                  bottom: (SizeConfig.screenHeight > 460)
                      ? SizeConfig.blockWidth * 0.5 +
                          (SizeConfig.blockHeight * 0.5)
                      : 0,
                ),
                duration: Duration(milliseconds: 300),
                height: SizeConfig.blockHeight * 4.75 +
                    SizeConfig.blockWidth * 4.75,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        'Aktivitas Menu',
                        style: AppStyles.textStyles.poppinsBold.copyWith(
                          color: AppStyles.colors.white.withOpacity(0.9),
                          fontSize: 8 + SizeConfig.blockWidth * 1.2,
                        ),
                      ),
                    ),

                    Spacer(),
                    //icon
                    Container(
                      child: Icon(
                        Icons.menu,
                        color: AppStyles.colors.white.withOpacity(0.75),
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              //List data
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // padding: EdgeInsets.zero,
                    children: [
                      ActivityMenuCard(
                        color: Colors.blueAccent,
                        title: 'Kelola Jenis Penyakit',
                        description:
                            "Menu untuk mengatur data diagnosis penyakit psikosomatis",
                        image: AssetsPath.images.information,
                        onTap: () {},
                        size: SizeConfig.blockWidth * 36.25,
                      ),
                      ActivityMenuCard(
                        color: Colors.blueAccent,
                        title: 'Kelola Data Gejala',
                        description:
                            "Menu untuk mengatur data gejala penyakit psikosomatis",
                        image: AssetsPath.images.diagnosis,
                        onTap: () {},
                        size: SizeConfig.blockWidth * 36.25,
                      ),
                      ActivityMenuCard(
                        color: Colors.blueAccent,
                        title: 'Kelola Data Aturan',
                        description:
                            "Menu untuk mengatur data relasi penyakit dengan gejala psikosomatis",
                        image: AssetsPath.images.messaging,
                        onTap: () {},
                        size: SizeConfig.blockWidth * 36.25,
                      ),
                      ActivityMenuCard(
                        color: Colors.blueAccent,
                        title: 'Kelola Jenis Penyakit',
                        description:
                            "Menu untuk mengatur data diagnosis penyakit psikosomatis",
                        image: AssetsPath.images.information,
                        onTap: () {},
                        size: SizeConfig.blockWidth * 36.25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.blockWidth * 2.5 + SizeConfig.blockHeight * 1.5,
        ),

        //    //  ** Profile UI ** //    //
        Expanded(
          child: AnimatedContainer(
            height: double.infinity,
            duration: Duration(milliseconds: 300),
            constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight),
            width: SizeConfig.blockWidth * 36,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockHeight * 3,
            ),
            decoration: BoxDecoration(
              color: AppStyles.colors.bgDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        child: Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_1jtgqyu8.json',
                          repeat: true,
                          animate: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: (SizeConfig.screenHeight > 460)
                              ? SizeConfig.blockHeight * 6
                              : SizeConfig.blockHeight * 2,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockHeight * 14,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Selamat Datang,",
                                style:
                                    AppStyles.textStyles.poppinsMedium.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockHeight +
                                      SizeConfig.blockWidth * 0.85,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                              Text(
                                "Dr. Agung Nugraha",
                                style: AppStyles.textStyles.poppinsSemiBold
                                    .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockHeight * 1.5 +
                                      SizeConfig.blockWidth,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
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
          ),
        ),
      ],
    );
  }
}
