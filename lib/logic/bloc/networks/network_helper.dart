import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lulu_stylist_app/logic/bloc/networks/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(
          const NetworkEvent.notify(isConnected: false),
        );
      } else {
        NetworkBloc().add(
          const NetworkEvent.notify(isConnected: true),
        );
      }
    });
  }
}
