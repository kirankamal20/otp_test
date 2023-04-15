import 'package:auto_route/annotations.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_test/features/biometric_auth/controller/bio_metric_auth_notifier_pod.dart';
import 'package:otp_test/router/autorouter_pod.dart';
import 'package:otp_test/router/router.gr.dart';
import 'package:otp_test/shared/helpers/snack_bar_helper.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(name: 'biometricRouter', deferredLoading: true)
class BioMetricAuthView extends ConsumerStatefulWidget {
  const BioMetricAuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BioMetricAuthViewState();
}

class _BioMetricAuthViewState extends ConsumerState<BioMetricAuthView> {
  void biometricValidated() {
    ref.read(biometricAuthNotifierPod.notifier).authenticateBiometric(
      onSuccess: () {
        ref.read(autorouterProvider).navigate(const HomeRouter());
      },
      onError: (errorMessage) {
        showSnackBar(
          context: context,
          message: errorMessage,
        );
      },
    );
  }

  void biometricValidatinOnError({required String error}) {
    showSnackBar(context: context, message: 'Supported');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        sized: false,
        child: SafeArea(
          child: [
            'SBI'.text.bold.size(30).color(Colors.blue).make(),
            20.heightBox,
            'Hello Kiran,'.text.bold.size(30).color(Colors.black).make(),
            15.heightBox,
            'Use touch ID to login to\nbank account,'
                .text
                .size(20)
                .color(Colors.grey)
                .make(),
            Consumer(
              builder: (context, ref, child) {
                return AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 90,
                  child: Material(
                    elevation: 8,
                    shape: const CircleBorder(),
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 60,
                      child: Icon(
                        Icons.fingerprint_rounded,
                        color: Colors.white,
                        size: 65,
                      ),
                    ).onTap(() {
                      ref
                          .read(biometricAuthNotifierPod.notifier)
                          .checkBioMetricSupportOrNot(
                            onSuccess: biometricValidated,
                            error: (error) {
                              biometricValidatinOnError(error: error);
                            },
                          );
                    }),
                  ),
                ).centered().pOnly(top: 100);
              },
            ),
            const Divider(
              color: Colors.grey,
            ).pOnly(top: 40, bottom: 20),
            'or just use password instead.'
                .text
                .size(20)
                .color(Colors.grey[400])
                .make()
                .pOnly(bottom: 20, top: 40),
            20.heightBox,
            Row(
              children: [
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ).w(240),
                const Spacer(),
                VxBox(
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ).roundedFull.color(Colors.blue).make().h(60).w(60),
              ],
            ),
          ]
              .vStack(crossAlignment: CrossAxisAlignment.start)
              .p(20)
              .scrollVertical(),
        ),
      ),
    );
  }
}
