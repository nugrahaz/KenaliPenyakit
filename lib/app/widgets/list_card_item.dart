part of 'widgets.dart';

// dipakai di homescreen

class ListCardItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final Function()? function;

  const ListCardItem(
      {Key? key,
      this.function,
      this.title = "",
      this.description = "",
      @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 1.5 * SizeConfig.blockWidth,
        ),
        decoration: BoxDecoration(
          color: AppStyles.colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(2.0 * SizeConfig.blockWidth),
            bottomLeft: Radius.circular(2.0 * SizeConfig.blockWidth),
            topLeft: Radius.circular(2.0 * SizeConfig.blockWidth),
            topRight: Radius.circular(2.0 * SizeConfig.blockWidth),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
              right: 4.0 * SizeConfig.blockWidth,
              left: 1.25 * SizeConfig.blockWidth,
              top: 0.5 * SizeConfig.blockWidth,
              bottom: 0.5 * SizeConfig.blockWidth),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Hero(
                  tag: imagePath!,
                  child: Image.asset(
                    imagePath!,
                    height: 15.0 * SizeConfig.blockWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.0 * SizeConfig.blockWidth,
                    bottom: 2.0 * SizeConfig.blockWidth,
                    right: description == ""
                        ? 2.5 * SizeConfig.blockWidth
                        : 2.5 * SizeConfig.blockWidth,
                    left: description == ""
                        ? 2.5 * SizeConfig.blockWidth
                        : 0.5 * SizeConfig.blockWidth,
                  ),
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppStyles.colors.bgDark,
                    width: 1,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.0 * SizeConfig.blockWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: AppStyles.colors.transparent,
                          padding: EdgeInsets.only(
                              bottom: 0.5 * SizeConfig.blockWidth),
                          child: Text(
                            title!,
                            textAlign: TextAlign.start,
                            maxLines: description == "" ? 3 : 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.textStyles.poppinsBold.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 3.3 * SizeConfig.blockWidth,
                              letterSpacing: 0.5,
                              color: AppStyles.colors.bgDark.withOpacity(0.85),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            description!,
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "poppins_semi_bold",
                              fontWeight: FontWeight.w600,
                              fontSize: 2.2 * SizeConfig.blockWidth,
                              letterSpacing: 0.3,
                              color: AppStyles.colors.bgDark.withOpacity(0.85),
                            ),
                          ),
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
    );
  }
}
