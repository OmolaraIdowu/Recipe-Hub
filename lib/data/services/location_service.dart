import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<LocationPermission> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return permission;
      }
    }

    return permission;
  }

  // check if location service is enabled and get location
  Future<String?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    final permission = await checkAndRequestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // get the city from the first placemark
    return placemarks.first.locality ?? 'Unknown';
  }
}

// class LocationService {
//   Future<bool> handlePermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return false;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       showPermissionDialog(navigationService.context);
//       return false;
//     }
//
//     return true; // permission granted
//   }
//
//   Future<String?> getCurrentLocation() async {
//     // check if location is enabled
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) return null;
//
//     // request permission
//     bool permissionGranted = await handlePermission();
//     if (!permissionGranted) return null;
//
//     // get current position
//     Position position = await Geolocator.getCurrentPosition();
//
//     // convert the location to a list of placemark objects
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//
//     // get the city from the first placemark
//     return placemarks.first.locality ?? 'Unknown';
//   }
//
//   Future<void> showPermissionDialog(BuildContext context) async {
//     await showDialog(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             title: const AppText(text: 'Permission Needed'),
//             content: const AppText(
//               text: 'Please enable location permission in settings.',
//             ),
//             actions: [
//               AppText(
//                 text: 'Open Settings',
//                 onTap: () {
//                   Geolocator.openAppSettings();
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//     );
//   }
// }
