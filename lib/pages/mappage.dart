import 'dart:async';

import 'package:course_store/widgets/mainappbar.dart';
import 'package:course_store/widgets/mapbottompill.dart';
import 'package:course_store/widgets/mapuserbadge.dart';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(9.078458424235697,
    7.491810651744274); //9.078458424235697, 7.491810651744274
const LatLng DEST_LOCATION = LatLng(
    9.074644406280123, 7.49492201418301); //9.074644406280123, 7.49492201418301
//10. add the required by google map
const double CAMERA_ZOOM = 18;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // 1. Google map controller which control a single instance of google map
  Completer<GoogleMapController> _controller = Completer();
  //2. Represent custom marker for source and destination coming from our assest folder
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  //3. hold the collections of makers
  Set<Marker> _makers = Set<Marker>();

  double pinPillPosition = PIN_VISIBLE_POSITION;

  //4. set the current Latitude and Longitude
  LatLng currentLocation;
  LatLng destinationLocation;
  bool userBadgeSelected = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;

  //5.override the initstate since we will do some initialization up front such as set up initial location and set up the marker icons
  @override
  void initState() {
    super.initState();
    // set up initial location
//7. INVOKE THE METHOD HERE
    this.setInitialLocation();
    // set up the marker icons
    //9. invoke the method here
    this.setSourceAndDestinationMarkerIcons();
    polylinePoints = PolylinePoints();
  }

  //6. create setinitialLocation method which will hold the current and destination location
  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

//8. process to set source and destination marker since it is coming from our asset folder use async and await
  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/imgs/1.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/imgs/2.png');
  }

  @override
  Widget build(BuildContext context) {
    //11. Add the camera postion instance which lead to the map or else it wont render correctly when we show it
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM, tilt: CAMERA_TILT, target: SOURCE_LOCATION);
    return Scaffold(
      body: Container(
        //12. add the Google Map Widget
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                polylines: _polylines,
                markers: _makers,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onTap: (LatLng loc) {
                  setState(() {
                    pinPillPosition = PIN_INVISIBLE_POSITION;
                    userBadgeSelected = false;
                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                  //13. Add the the custom marker let us create a method called showPinsOnMap
                  showPinsOnMap();
                  setPolylines();
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: MapUserBadge(
                isSelected: userBadgeSelected,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(microseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: pinPillPosition,
              child: MapButtomPill(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MainAppBar(
                showProfilePic: false,
              ),
            )
          ],
        ),
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _makers.add(
        Marker(
            markerId: MarkerId('sourcePin'),
            position: currentLocation,
            icon: sourceIcon,
            onTap: () {
              setState(() {
                this.userBadgeSelected = true;
              });
            }),
      );

      _makers.add(
        Marker(
            markerId: MarkerId('destinationPin'),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                pinPillPosition = PIN_VISIBLE_POSITION;
              });
            }),
      );
    });
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAyXOuL-w3bfY7XnCYvoDVX29DSB9_lWGs',
      PointLatLng(currentLocation.latitude, currentLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(
          Polyline(
              width: 10,
              polylineId: PolylineId('polyLine'),
              color: Color(0xFF08A5CB),
              points: polylineCoordinates),
        );
      });
    }
  }
}
