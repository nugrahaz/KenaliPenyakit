part of '../constants.dart';

class AssetsPath {
  static final fontFamily = _FontFamily();
  static final lotties = _Lotties();
  static final icons = _Icons();
  static final images = _Images();
}

//Font Familly
class _FontFamily {
  final poppinsBold = 'poppins_bold';
  final poppinsMedium = 'poppins_medium';
  final poppinsSemiBold = 'poppins_semi_bold';
}

class _Icons {
  static const path = 'assets/icons';

  //
  final translate = '$path/translate.png';
  final indonesianFlag = '$path/indonesian.png';
  final englishFlag = '$path/english.png';
}

class _Lotties {
  static const path = 'assets/lotties';

  //
  final doctor = "$path/doctor.json";
  final exit = "$path/exit.json";
  final sad = "$path/sad.json";
}

class _Images {
  static const path = 'assets/images';

  final information = '$path/menu_information.png';
  final diagnosis = '$path/menu_diagnosis.png';
  final messaging = '$path/menu_messaging.png';

  final flowBottom = '$path/flow_bottom.png';
  final flowTop = '$path/flow_top.png';

  final appLogo = '$path/app_logo.png';
}
