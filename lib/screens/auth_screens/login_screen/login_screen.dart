import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return StatefulWrapper(
        //load page
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => login.onReady(context)),
        //direction layout
        child: DirectionLayout(
            dChild: Scaffold(
                backgroundColor: appColor(context).appTheme.primaryColor,
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Stack(children: [
                  Image.asset(imageAssets.background),
                  Form(
                      key: login.loginKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                //login top text layout
                                CommonWidget()
                                    .commonTextLoginRegistration(context),
                                //textfield layout
                                const TextFieldLayout(),
                              ],
                            ),
                            VSpace(MediaQuery.of(context).size.height * 0.065),
                            //login button click event
                            ButtonCommon(
                                title: language(context, appFonts.signIn),
                                onTap: () => login.onLogin(context)),
                            const VSpace(Sizes.s30),
                            Image.asset(imageAssets.oR),
                            const VSpace(Sizes.s30),
                            //bottom integration button and sign up account link layout
                            const RichTextLayoutLogin()
                          ]).paddingSymmetric(horizontal: Sizes.s20))
                ]))))),
      );
    });
  }
}
