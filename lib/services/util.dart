import 'package:device_info_plus/device_info_plus.dart';

class Util {
  static Future<String?> getDeviceId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final map = deviceInfo.data;

      if (deviceInfo is AndroidDeviceInfo) {
        return map['androidId'];
      } else if (deviceInfo is IosDeviceInfo) {
        return map['identifierForVendor'];
      }
    } catch (e) {
      print('Failed to get device ID: $e');
    }
    return null;
  }
}
