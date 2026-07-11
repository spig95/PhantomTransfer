import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class VolumeButtonService {
  static const MethodChannel _channel =
  MethodChannel('phantom_transfer/volume');

  void startListening({
    required VoidCallback onVolumeDown,
  }) {
    if (kDebugMode) {
      print('VolumeButtonService started listening');
    }
    _channel.setMethodCallHandler(null);

    _channel.setMethodCallHandler(
          (call) async {
        if (call.method == 'volumeDownPressed') {
          if (kDebugMode) {
            print('Volume down button was pressed (volume_button_service)');
          }
          onVolumeDown();
        }
      },
    );
  }

  void stopListening() {
    if (kDebugMode) {
      print("Stop listening.");
    }
    _channel.setMethodCallHandler(null);
  }
}