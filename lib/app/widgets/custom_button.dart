part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Function()? function;
  final String? title;
  final Color? color, disabledColor, titleColor, borderColor;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final double? width;
  final bool? withBorder;
  final bool? onlyIcon;
  final IconData? icons;

  const CustomButton({
    Key? key,
    @required this.function, //sudah
    this.title = "", //sudah
    this.color = Colors.transparent, //sudah
    this.disabledColor, //sudah
    this.titleColor, //sudah
    this.borderColor, //sudah
    this.height,
    this.fontSize,
    this.borderRadius = 12,
    this.width,
    this.withBorder = false,
    this.icons,
    this.onlyIcon = false, //sudah
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBounceWidget(
      onPressed: function!,
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: EdgeInsets.all((withBorder == true) ? 1 : 0),
        height: height ?? 14.0 * SizeConfig.blockHeight,
        width: (width != null) ? width : null,
        decoration: BoxDecoration(
          border: Border.all(
              color: (borderColor) != null ? borderColor! : color!, width: 2),
          borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12),
          color: color ?? AppStyles.colors.cyan,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12,
            ),
            color: color ?? AppStyles.colors.cyan,
          ),
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: 1.0 * SizeConfig.blockHeight),
            child: Center(
              child: AutoSizeText(
                title!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                  color: titleColor,
                  fontSize: (fontSize != null)
                      ? fontSize
                      : 5 * SizeConfig.blockHeight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
