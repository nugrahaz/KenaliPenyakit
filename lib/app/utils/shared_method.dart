part of 'utils.dart';

bool isIntersect(List listOne, List listTwo) {
  return listOne.toSet().intersection(listTwo.toSet()).isNotEmpty;
}

class SharedMethod {
  //Coloring System Bar
  static void systemBarColor(Color statusColor, Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor, //top bar color
      statusBarIconBrightness: (statusColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //top bar icons
      systemNavigationBarColor: navColor, //bottom bar color
      systemNavigationBarIconBrightness: (navColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //bottom bar icons
    ));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
