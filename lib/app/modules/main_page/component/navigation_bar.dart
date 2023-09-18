import 'package:flutter/material.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';

class NavBarItem extends StatelessWidget {
  final IconData? icon;
  final Function? touched;
  final bool? active;
  final String? title;

  NavBarItem({
    this.icon,
    this.touched,
    this.active,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppStyles.colors.transparent,
      child: InkWell(
        onTap: () {
          touched!();
        },
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          height: 65.0,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: 35.0,
                width: 2 * SizeConfig.blockWidth / 3,
                decoration: BoxDecoration(
                  color: active! ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 2 * SizeConfig.blockWidth,
                    ),
                    Icon(
                      icon,
                      color: active! ? Colors.white : Colors.white54,
                      size: 15 + 1 * SizeConfig.blockWidth,
                    ),
                    SizedBox(
                      width: 1.5 * SizeConfig.blockWidth,
                    ),
                    Text(
                      title ?? "",
                      style: AppStyles.textStyles.poppinsMedium.copyWith(
                        color: active! ? Colors.white : Colors.white54,
                        fontSize: 3 + SizeConfig.blockWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
