import 'package:flutter/material.dart';
import 'package:kenalipenyakit/app/constant/constants.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';

class ActivityMenuCard extends StatefulWidget {
  final String? title, description;
  final Color? color;
  final String? image;
  final double? size;
  final VoidCallback? onTap;

  ActivityMenuCard({
    this.color = Colors.cyan,
    @required this.image,
    this.title = "",
    this.description = "",
    this.size = 350,
    this.onTap,
  });

  @override
  _ActivityMenuCardState createState() => _ActivityMenuCardState();
}

class _ActivityMenuCardState extends State<ActivityMenuCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Flexible(
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            hovered = false;
          });
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            // jarak bawah
            padding: EdgeInsets.only(
              right: SizeConfig.blockWidth * 2 + SizeConfig.blockHeight * 0.25,
              left: SizeConfig.blockWidth * 1.5 + SizeConfig.blockHeight * 0.25,
              top: SizeConfig.blockHeight * 2.25 + SizeConfig.blockWidth * 0.25,
              bottom:
                  SizeConfig.blockHeight * 2.25 + SizeConfig.blockWidth * 0.25,
            ),
            duration: Duration(milliseconds: 300),
            width: hovered ? widget.size! : widget.size!,
            decoration: BoxDecoration(
                color: hovered ? widget.color : Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: hovered ? widget.color! : Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ]),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  //Icons
                  Image.asset(
                    widget.image!,
                    fit: BoxFit.fitWidth,
                    width: SizeConfig.blockWidth * 5,
                  ),
                  //
                  SizedBox(
                    width: SizeConfig.blockWidth,
                  ),
                  //Title
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title!,
                          style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                            color: hovered
                                ? Colors.white
                                : AppStyles.colors.bgDark.withOpacity(0.9),
                            fontWeight: FontWeight.w900,
                            fontSize: 3 + SizeConfig.blockWidth,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 2 / 3,
                        ),
                        Text(
                          widget.description!,
                          style: AppStyles.textStyles.poppinsMedium.copyWith(
                              color: hovered
                                  ? Colors.white
                                  : AppStyles.colors.bgDark.withOpacity(0.75),
                              fontWeight: FontWeight.w900,
                              fontSize: SizeConfig.blockWidth,
                              letterSpacing: 0.7),
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
