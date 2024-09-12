import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CommonBannerLayout extends StatelessWidget {
  final String? imagePath;
  final GestureTapCallback? onPressed;

  const CommonBannerLayout(
      {super.key, this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(children: [
        //common banner layout
        Image.asset(imagePath!),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(MediaQuery.of(context).size.height * 0.02),
              Text(language(context, appFonts.bestSale),
                  style: appCss.dmPoppinsSemiBold16
                      .textColor(appColor(context).appTheme.whiteColor)),
              const VSpace(Sizes.s5),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(language(context, appFonts.description),
                      maxLines: 2,
                      style: appCss.dmPoppinsLight12
                          .textColor(appColor(context).appTheme.whiteColor))),
              VSpace(MediaQuery.of(context).size.height * 0.055),
              Row(children: [
                Text(
                  language(context, appFonts.viewMore),
                  style: appCss.dmPoppinsMedium12
                      .textColor(appColor(context).appTheme.whiteColor),
                ),
                const HSpace(Sizes.s6),
                SvgPicture.asset(svgAssets.iconHomeArrow)
              ])
            ]).paddingSymmetric(horizontal: Insets.i15),
      ]),
    );
  }
}
