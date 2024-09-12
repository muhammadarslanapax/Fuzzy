import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
          //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.primaryColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Stack(children: [
                Image.asset(imageAssets.background),
                Form(
                  key: registration.registrationKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          //top text layout
                          CommonWidget().commonTextLoginRegistration(context),
                          //registration text layout
                          const TextFieldLayoutRegistration()
                        ]),
                        Column(children: [
                          VSpace(MediaQuery.of(context).size.height * 0.055),
                          //registration click event
                          ButtonCommon(
                              title: language(context, appFonts.signUp),
                              onTap: () =>
                                  registration.onRegistration(context)),
                          const VSpace(Sizes.s30),
                          Image.asset(imageAssets.oR),
                          const VSpace(Sizes.s30),
                          //bottom sign in link layout
                          CommonAuthRichText(
                              text: language(context, appFonts.accountCreate),
                              subtext: language(context, appFonts.signIn),
                              onTap: () => route.pop(context))
                        ]).paddingSymmetric(vertical: Insets.i30)
                      ]).paddingSymmetric(horizontal: Insets.i20),
                )
              ])))));
    });
  }
}
