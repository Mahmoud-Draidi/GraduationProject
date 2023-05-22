import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Position? cl;
var lat;
var long;

class CurrentPossition extends ChangeNotifier {
  CameraPosition? kGooglePlex;

  setkGooglePlex(CameraPosition kGooglePlex) async {
    this.kGooglePlex = kGooglePlex;
    notifyListeners();
  }

  getkGooglePlex() {
    return this.kGooglePlex;
    notifyListeners();
  }
}
