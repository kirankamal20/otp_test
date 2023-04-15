import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_test/features/biometric_auth/controller/notifier/biomertric_auth_notifier.dart';

final biometricAuthNotifierPod =
    AsyncNotifierProvider.autoDispose<BioMetricNotifier, void>(
  BioMetricNotifier.new,
);
