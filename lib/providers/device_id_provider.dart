import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';

final deviceIdProvider = FutureProvider<String?>(
  (ref) async => await PlatformDeviceId.getDeviceId,
);
