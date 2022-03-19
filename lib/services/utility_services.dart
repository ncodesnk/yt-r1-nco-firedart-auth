import 'dart:async';
import 'dart:io';

import 'package:logger/logger.dart';

class UtilityService{

  Timer? timer;
  var logger = Logger();
  bool _isOnline = true;

  Future checkConnectivity() async { //! For Check, Devide Has Internet Connection
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        logger.i("Connected Online");
        _isOnline = true;
      }
    } on SocketException catch (_) {
      logger.e("Offline !!!");
      _isOnline = false;
    }
    return _isOnline;
  }

}



