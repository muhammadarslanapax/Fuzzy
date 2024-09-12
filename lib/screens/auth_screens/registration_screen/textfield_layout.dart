import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class TextFieldLayoutRegistration extends StatelessWidget {
  const TextFieldLayoutRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      return Stack(children: [
        Column(children: [
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.name), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
              focusNode: registration.nameFocus,
              controller: registration.nameController,
              keyboardType: TextInputType.name,
              hintText: language(context, appFonts.hintName),
              prefixIcon: SvgPicture.asset(svgAssets.iconProfile,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                      appColor(context).appTheme.txtTransparentColor,
                      BlendMode.srcIn)),
             /* validator: (value) =>
                  Validation().nameValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.email), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
              keyboardType: TextInputType.emailAddress,
              focusNode: registration.emailFocus,
              controller: registration.emailController,
              hintText: language(context, appFonts.hintEmail),
              prefixIcon:
                  SvgPicture.asset(svgAssets.iconEmail, fit: BoxFit.scaleDown),
              /*validator: (value) =>
                  Validation().emailValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.password), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
              controller: registration.passwordController,
              keyboardType: TextInputType.text,
              focusNode: registration.passwordFocus,
              hintText: language(context, appFonts.hintPassword),
              obscureText: registration.isNewPassword,
              prefixIcon:
                  SvgPicture.asset(svgAssets.iconLock, fit: BoxFit.scaleDown),
              suffixIcon: CommonWidget()
                  .passwordSVG(registration.isNewPassword, svgAssets.iconHide,
                      svgAssets.iconEye)
                  .inkWell(onTap: () => registration.newPasswordSeenTap()),
              /*validator: (value) => validation.passValidation(context, value)*/),
          const VSpace(Sizes.s15)
        ])
      ]);
    });
  }
}
