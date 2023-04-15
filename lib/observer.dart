// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:let_log/let_log.dart';

// class MyObserverLogger extends ProviderObserver {
//   MyObserverLogger() : super();
//   @override
//   void didUpdateProvider(ProviderBase provider, Object? previousValue,
//       Object? newValue, ProviderContainer container) {
//     if (newValue is StateController) {
//       final newv = newValue.state;
//       final perviousv = (previousValue as StateController).state;
//       Logger.log('Provider is: '
//           '${provider.name ?? provider.runtimeType} \n'
//           'previous value: $perviousv \n'
//           'new value: $newv');
//     } else if (newValue is AsyncValue?) {
//       try {
//         final newv = newValue?.value;
//         final perviousv = (previousValue as AsyncValue).value;
//         Logger.log('Provider is: '
//             '${provider.name ?? provider.runtimeType} \n'
//             'previous value: $perviousv \n'
//             'new value: $newv');
//       } catch (e) {
//         if (e.toString().contains("SocketException")) {}
//         Logger.error("Observer error $e");
//       }
//     } else {
//       Logger.log('Provider is: '
//           '${provider.name ?? provider.runtimeType} \n'
//           'previous value: ${previousValue.toString()}\n'
//           'new value: ${newValue.toString()}');
//     }
//     super.didUpdateProvider(provider, previousValue, newValue, container);
//   }
// }
