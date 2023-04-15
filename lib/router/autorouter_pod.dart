import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_test/router/router.dart';

final autorouterProvider = Provider.autoDispose(
  (ref) => AppRouter(),
);
