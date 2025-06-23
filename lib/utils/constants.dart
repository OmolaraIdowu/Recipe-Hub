import 'package:recipe_hub/data/services/auth_service.dart';
import 'package:recipe_hub/data/services/location_service.dart';
import 'package:recipe_hub/data/services/navigation_service.dart';
import 'package:recipe_hub/locator.dart';

NavigationService navigationService = locator<NavigationService>();
AuthService authService = locator<AuthService>();
LocationService locationService = locator<LocationService>();
