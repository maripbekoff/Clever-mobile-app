import 'package:connectivity/connectivity.dart';

bool network = false;
bool isButtonEnabled = false;

class Connection {
  static Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        network = true;
        break;
      case ConnectivityResult.mobile:
        network = true;
        break;
      case ConnectivityResult.none:
        network = false;
        break;
      default:
        network = false;
        break;
    }
  }
}
