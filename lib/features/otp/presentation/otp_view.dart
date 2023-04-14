import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpView extends ConsumerStatefulWidget {
  const OtpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          [
            'Verification code'.text.bold.size(20).make(),
            'We have sent the verification code to'
                .text
                .color(Colors.grey)
                .make()
                .pOnly(top: 2, bottom: 2),
            [
              '+9181******54'.text.make(),
              10.widthBox,
              'Change Phone Number ? '.text.color(context.accentColor).make(),
              10.widthBox,
            ].hStack(),
          ].vStack(crossAlignment: CrossAxisAlignment.start).pOnly(left: 5),
          20.heightBox,
          OtpTextField(
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Verification Code'),
                    content: Text('Code entered is $verificationCode'),
                  );
                },
              );
            }, // end onSubmit
          ),
          'Resend code after'.text.make().centered().p(9)
        ],
      ).p(10),
      floatingActionButton: [
        OutlinedButton(onPressed: () {}, child: 'Resend'.text.make())
            .pOnly(left: 10, right: 10),
        const Spacer(),
        ElevatedButton(onPressed: () {}, child: 'Resend'.text.make()),
      ].hStack(alignment: MainAxisAlignment.spaceEvenly),
    );
  }
}
