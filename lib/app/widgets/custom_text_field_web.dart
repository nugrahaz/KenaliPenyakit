part of 'widgets.dart';

class CustomTextFieldWeb extends StatelessWidget {
  final bool? visibility;
  final bool? enabled;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final IconData? iconSuffix;

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? useSuffixIcon;
  final Function()? function;
  final double? borderRadius;
  final List<TextInputFormatter>? filteringTextInputFormatter;
  final TextCapitalization? textCapitalization;

  const CustomTextFieldWeb({
    Key? key,
    @required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.visibility = false,
    this.useSuffixIcon = false,
    this.function,
    this.height,
    this.borderRadius = 12,
    this.filteringTextInputFormatter,
    this.textCapitalization,
    this.enabled = true,
    this.iconSuffix = Icons.remove_red_eye,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (height == null)
          ? SizeConfig.blockHeight * 3.9 + SizeConfig.blockWidth * 3.9
          : height,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal:
                SizeConfig.blockWidth * 1.25 + SizeConfig.blockHeight * 1.25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            enabled: enabled,
            autocorrect: false,
            enableSuggestions: visibility != true ? true : false,
            enableIMEPersonalizedLearning: visibility != true ? true : false,
            enableInteractiveSelection: visibility != true ? true : false,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            inputFormatters: filteringTextInputFormatter ?? [],
            style: AppStyles.textStyles.poppinsMedium.copyWith(
                color: AppStyles.colors.bgDark.withOpacity(0.9),
                fontWeight: FontWeight.w300,
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                fontSize:
                    SizeConfig.blockWidth * 1.4 + SizeConfig.blockHeight * 0.4),
            obscureText: visibility!,
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppStyles.colors.cyan,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                icon,
                size:
                    SizeConfig.blockWidth * 1.5 + SizeConfig.blockHeight * 1.5,
                color: AppStyles.colors.cyan,
              ),
              suffixIcon: (useSuffixIcon == true)
                  ? GestureDetector(
                      onTap: function,
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockWidth * 2.0),
                          child: Icon(
                            (iconSuffix != null)
                                ? iconSuffix
                                : (visibility == true)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                            color: AppStyles.colors.cyan,
                            size: SizeConfig.blockWidth * 1.5 +
                                SizeConfig.blockHeight * 1.5,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
