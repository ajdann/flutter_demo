import 'package:demo_app/services/splashService.dart';

startTimeout(milliseconds, context, timeout, ms) {
  return SplashService().startTimer(milliseconds, context, timeout, ms);
}
