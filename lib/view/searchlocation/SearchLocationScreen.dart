import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  late LatLng defaultLatLng;
  late LatLng draggedLatLng;
  String draggedAddress = "";
  Placemark? address;
  List<Placemark>? placeMarks;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  _getMap(),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: ThemeColor.textfieldColor,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          _gotoUserCurrentPosition();
                        },
                        child: const Icon(Icons.location_on)),
                  ),
                  _getCustomPin(),
                ],
              )),
          Expanded(
              flex: 0,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: _showDraggedAddress(),
                  ),
                ],
              ))
        ],
      ),
    ));
  }

  Widget _getMap() {
    return GoogleMap(
      initialCameraPosition: cameraPosition!,
      //initialize camera position for map
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      onCameraIdle: () {
        _getAddress(draggedLatLng);
      },
      onCameraMove: (cameraPosition) {
        draggedLatLng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller) {
        if (!googleMapController.isCompleted) {
          googleMapController.complete(controller);
        }
      },
    );
  }

  Widget _showDraggedAddress() {
    return Container(
      decoration: const BoxDecoration(color: ThemeColor.backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Row(
              children: [
                Icon(Icons.location_on, color: ThemeColor.textfieldColor),
                SizedBox(width: 10),
                Text("Address",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ThemeColor.textfieldColor)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 10, top: 15),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Shimmer.fromColors(
                        enabled: false,
                        baseColor: ThemeColor.textfieldColor,
                        highlightColor: Colors.grey,
                        child: Text(draggedAddress,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "Gilroy",
                              fontSize: 16,
                              color: ThemeColor.textfieldColor,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final location = LocationData(
                      lat: draggedLatLng.latitude,
                      longt: draggedLatLng.longitude,
                      locationName: draggedAddress);
                  Navigator.pop(context, location);
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(ThemeColor.primaryColor),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: const Text("Next",
                    style: TextStyle(
                        fontSize: 16,
                        color: ThemeColor.backgroundColor,
                        fontFamily: 'Gilroy')),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _gotoUserCurrentPosition();
    _init();

    /// If you have not map_style.json then you can remove it. if you want to generate map_style.json link: https://mapstyle.withgoogle.com/
    super.initState();
  }

  _init() {
    defaultLatLng = const LatLng(0.0, 0.0);
    draggedLatLng = defaultLatLng;
    cameraPosition = CameraPosition(target: defaultLatLng, zoom: 15);
  }

  Widget _getCustomPin() {
    return const Center(
      child: SizedBox(
        width: 150,

        /// I used the map pin from the lottie.You can also use it if you want. Otherwise you can delete.
        child: Icon(
          Icons.location_on_sharp,
          size: 50,
          color: ThemeColor.backgroundColor,
        ),
      ),
    );
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      debugPrint("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        debugPrint("user denied location permission");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      debugPrint("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future _getAddress(LatLng position) async {
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    address = placeMarks![0];
    String addressString =
        "${address!.street},${address!.locality},${address!.administrativeArea}, ${address!.country}";
    setState(() {
      draggedAddress = addressString;
    });
  }

  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15)));
    await _getAddress(position);
  }
}
