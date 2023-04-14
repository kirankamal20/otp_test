import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_test/app/app.dart';
import 'package:otp_test/bootstrap.dart';

void main() {
bootstrap(() => const ProviderScope(child: App()));
}
