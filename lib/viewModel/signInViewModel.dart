import 'package:demo_app/services/signInService.dart';

handleGetContact(user) {
  return SignInService().handleGetContact(user);
}

pickFirstNamedContact(data) {
  return SignInService().pickFirstNamedContact(data);
}

handleSignIn() {
  return SignInService().handleSignIn();
}

handleSignOut() {
  return SignInService().handleSignOut();
}
