// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:mowasulatuna/screens/common_screens/my_drawer.dart';
import 'package:mowasulatuna/screens/rider_screens/book_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';

import '../../providers/book_provider.dart';
import '../../providers/current_possition.dart';

GoogleMapController? newGoogleMapController;
final Completer<GoogleMapController> _controllerGoogleMap = Completer();

class RHome extends StatelessWidget {
  CameraPosition? kGooglePlex;

  RHome(this.kGooglePlex, {super.key});
  // late GoogleMapController mapController;
  // final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    final proCurrentPosition = Provider.of<CurrentPossition>(context);

    // Future<CameraPosition> getLatAndLong() async {
    //   cl = await Geolocator.getCurrentPosition().then((value) => value);
    //   lat = cl?.latitude;
    //   long = cl?.longitude;
    //   return kGooglePlex = CameraPosition(
    //     target: LatLng(lat, long),
    //     zoom: 11.0,
    //   );
    // }

    // proCurrentPosition.setkGooglePlex(getLatAndLong());
    final pro = Provider.of<BookProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.10), // here the desired height
          child: AppBar(
            flexibleSpace: Container(
              height: h * 0.13,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1a2636).withOpacity(0.8),
                    Color(0xff434343).withOpacity(0.8),
                  ],
                ),
              ),
            ),
            title: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: h * 0.015,
                  ),
                  height: h * 0.053,
                  width: w * 0.38,
                  child: Image.asset('assets/images/logoText.png'),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
        body: Stack(
          children: [
            proCurrentPosition.getkGooglePlex() == null
                ? CircularProgressIndicator()
                : Container(
                    child: GoogleMap(
                      // onMapCreated: _onMapCreated,
                      initialCameraPosition:
                          proCurrentPosition.getkGooglePlex(),
                      onMapCreated: (GoogleMapController controller) {
                        _controllerGoogleMap.complete(controller);
                        newGoogleMapController = controller;
                        newGoogleMapController!.setMapStyle('''
                      [
                        {
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#242f3e"
                            }
                          ]
                        },
                        {
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#746855"
                            }
                          ]
                        },
                        {
                          "elementType": "labels.text.stroke",
                          "stylers": [
                            {
                              "color": "#242f3e"
                            }
                          ]
                        },
                        {
                          "featureType": "administrative.locality",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "poi",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "poi.park",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#263c3f"
                            }
                          ]
                        },
                        {
                          "featureType": "poi.park",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#6b9a76"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#38414e"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "geometry.stroke",
                          "stylers": [
                            {
                              "color": "#212a37"
                            }
                          ]
                        },
                        {
                          "featureType": "road",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#9ca5b3"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#746855"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "geometry.stroke",
                          "stylers": [
                            {
                              "color": "#1f2835"
                            }
                          ]
                        },
                        {
                          "featureType": "road.highway",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#f3d19c"
                            }
                          ]
                        },
                        {
                          "featureType": "transit",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#2f3948"
                            }
                          ]
                        },
                        {
                          "featureType": "transit.station",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#d59563"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "geometry",
                          "stylers": [
                            {
                              "color": "#17263c"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "labels.text.fill",
                          "stylers": [
                            {
                              "color": "#515c6d"
                            }
                          ]
                        },
                        {
                          "featureType": "water",
                          "elementType": "labels.text.stroke",
                          "stylers": [
                            {
                              "color": "#17263c"
                            }
                          ]
                        }
                      ]
                  ''');
                      },
                    ),
                  ),
            Positioned(
              top: 0,
              child: Container(
                height: h,
                width: w,
                padding: EdgeInsets.all(20),
                // decoration: BoxDecoration(

                //   image: DecorationImage(
                //     image: AssetImage('assets/images/background.png'),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.4,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "معلومات",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vazirmatn(
                                    color: Color(0xb2f0f0f0),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.message,
                                  color: Color(0xffdda006),
                                  // size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.4,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "احجز مقعدك",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vazirmatn(
                                    color: Color(0xb2f0f0f0),
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    'assets/images/Vector.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.65,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: w * 0.01),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.17,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/mdi_bus-marker.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.01),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.17,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.location_history,
                                color: Color(0xffdda006),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.01),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (pro.isBooked)
              Positioned(
                top: h * 0.065,
                right: w * 0.0583,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: h * 0.15,
                    width: w * 0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Group_3.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            if (pro.isOrangeCase)
              Positioned(
                top: h * 0.065,
                right: w * 0.0583,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: h * 0.15,
                    width: w * 0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Group_4.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            if (pro.isOrangeCase)
              Positioned(
                right: w * 0.25,
                top: h * 0.093,
                child: Text(
                  "10:50",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.vazirmatn(
                    color: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
        endDrawer: MyDrawer(),
      ),
    );
  }
}
