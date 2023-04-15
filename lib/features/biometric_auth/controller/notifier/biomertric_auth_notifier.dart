import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class BioMetricNotifier extends AutoDisposeAsyncNotifier<void> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  FutureOr<void> build() {}

  Future<void> checkBioMetricSupportOrNot({
    required void Function() onSuccess,
    required void Function(String) error,
  }) async {
    if (await auth.isDeviceSupported()) {
      onSuccess();
    } else {
      error('Fingure print not supported this device');
    }
  }

  Future<void> authenticateBiometric({
    required void Function() onSuccess,
    required void Function(String) onError,
  }) async {
    try {
      final result = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (result == true) {
        onSuccess();
      } else {
        onError('wrong fingure print');
      }
    } on PlatformException catch (e) {
      onError(e.message.toString());
    }
  }
}
