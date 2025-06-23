import 'package:get_it/get_it.dart';
import 'package:recipe_hub/data/services/auth_service.dart';
import 'package:recipe_hub/data/services/location_service.dart';
import 'package:recipe_hub/data/services/navigation_service.dart';
import 'package:recipe_hub/ui/auth/sign_in/sign_in.vm.dart';
import 'package:recipe_hub/ui/auth/sign_up/signup.vm.dart';
import 'package:recipe_hub/ui/auth/verification/verify_email.vm.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';
import 'package:recipe_hub/ui/home/home.vm.dart';

GetIt locator = GetIt.I;

setUpLocator() {
  registerViewModels();
  registerServices();
}

registerViewModels() {
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<SignInViewModel>(() => SignInViewModel());
  locator.registerFactory<SignupViewModel>(() => SignupViewModel());
  locator.registerFactory<VerifyEmailViewModel>(() => VerifyEmailViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}

registerServices() {
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
