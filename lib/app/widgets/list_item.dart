part of 'widgets.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final bool isNavigate;
  final String text;
  final Function()? function;

  const ListItem(
      {Key? key,
      this.icon = Icons.error,
      this.text = "",
      this.function,
      this.isNavigate = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 5.0 * SizeConfig.blockWidth,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 4.0 * SizeConfig.blockWidth,
            vertical: 4.0 * SizeConfig.blockWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppStyles.colors.white,
        ),
        child: Row(
          children: <Widget>[
            (icon != Icons.minimize_rounded)
                ? Icon(
                    icon,
                    size: 7.0 * SizeConfig.blockWidth,
                    color: AppStyles.colors.bgDark,
                  )
                : const SizedBox(),
            (icon != Icons.minimize_rounded)
                ? SizedBox(width: 4.0 * SizeConfig.blockWidth)
                : const SizedBox(),
            Expanded(
                child: Text(
              text,
              style: AppStyles.textStyles.poppinsMedium.copyWith(
                fontWeight: FontWeight.w900,
                color: AppStyles.colors.bgDark.withOpacity(0.9),
                fontSize: 3.5 * SizeConfig.blockWidth,
              ),
            )),
            (isNavigate)
                ? Icon(
                    Icons.chevron_right_sharp,
                    size: 6.0 * SizeConfig.blockWidth,
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(right: 2.0 * SizeConfig.blockWidth),
                    child: Icon(
                      Icons.circle_rounded,
                      size: 1.5 * SizeConfig.blockWidth,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
