import '../../config.dart';

class RegistrationProvider with ChangeNotifier {
  GlobalKey<FormState> registrationKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool isNewPassword = true;

//registration click button
  onRegistration(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registrationKey.currentState!.validate()) {
      registration(context);
    }
  }

  //registration
  registration(context) {
    route.pop(context);
    notifyListeners();
    onBack();
  }

  //onBack clear
  onBack() {
    nameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    notifyListeners();
  }

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }
}
