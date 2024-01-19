import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceIdProvider = FutureProvider<String?>((ref) async {
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
});
