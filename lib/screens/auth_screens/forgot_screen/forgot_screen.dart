import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotProvider>(builder: (context1, forgot, child) {
      return DirectionLayout(
          dChild: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 10))
                  .then((_) => forgot.onReady(context)),
              child: Scaffold(
                  backgroundColor: appColor(context).appTheme.primaryColor,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Form(
                              key: forgot.forgotKey,
                              child: Stack(children: [
                                Image.asset(imageAssets.background),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VSpace(
                                          MediaQuery.of(context).size.height *
                                              0.23),
                                      Text(
                                          language(
                                              context, appFonts.forgotPassword),
                                          style: appCss.dmPoppinsSemiBold22
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .whiteColor)),
                                      const VSpace(Sizes.s30),
                                      //text layout
                                      CommonTextLayout(
                                          text:
                                              language(context, appFonts.email),
                                          isStyle: true),
                                      const VSpace(Sizes.s6),
                                      //text filed
                                      TextFieldCommon(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        focusNode: forgot.emailTextFocus,
                                        controller: forgot.emailTextController,
                                        hintText: language(
                                            context, appFonts.hintEmail),
                                        prefixIcon: SvgPicture.asset(
                                            svgAssets.iconEmail,
                                            fit: BoxFit.scaleDown),
                                        /*validator: (value) => Validation()
                                              .emailValidation(context, value)*/
                                      ),
                                      const VSpace(Sizes.s50),
                                      //forgot password click event
                                      ButtonCommon(
                                          title: language(
                                              context, appFonts.sendOtp),
                                          onTap: () =>
                                              forgot.onForgot(context)),
                                    ]).paddingSymmetric(horizontal: Insets.i20)
                              ])))))));
    });
  }
}
