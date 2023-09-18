import 'package:flutter/material.dart';
import 'package:kenalipenyakit/app/modules/authentication/mobile/authentication_mobile.dart';
import 'package:kenalipenyakit/app/modules/authentication/web/authentication_web.dart';
import 'package:kenalipenyakit/app/utils/utils.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return (SizeConfig.screenWidth > 678)
        ? const AuthenticationWeb()
        : const AuthenticationMobile();
  }
}
