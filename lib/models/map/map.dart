import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';


class MapWidget extends StatefulWidget {
 final LatLng latLng;
  const MapWidget(this.latLng,{Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  LatLng cameraPosition=const LatLng(15.3752939, 44.1792882);

  LatLng latLng=const LatLng(15.3752939, 44.1792882);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latLng=widget. latLng;
  }

  @override
  Widget build(BuildContext context) {
    // if(latLng==null){
    //   latLng=const LatLng(15.3752939, 44.1792882);
    // }
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: GoogleMapsWidget(
            // apiKey: "AIzaSyDH4Y9rnt-Ui5FGTT5G1ivY2tlNFc9jrAo",
            apiKey: "AIzaSyBOnp_PY0tImyFRmPa62MgLlfFt5TP2doM",
            sourceLatLng: widget.latLng,
            destinationLatLng:  LatLng(15.3752939, 44.1792882),

            ///////////////////////////////////////////////////////
            //////////////    OPTIONAL PARAMETERS    //////////////
            ///////////////////////////////////////////////////////

            routeWidth: 2,
            defaultCameraLocation:
            cameraPosition,
            sourceMarkerIconInfo: const MarkerIconInfo(
              assetPath: "assets/images/house-marker-icon.png",
            ),
            destinationMarkerIconInfo: const MarkerIconInfo(
              assetPath: "assets/images/restaurant-marker-icon.png",
            ),
            driverMarkerIconInfo: const MarkerIconInfo(
              assetPath: "assets/images/driver-marker-icon.png",
              assetMarkerSize: Size.square(125),
              rotation: 90,
            ),
            updatePolylinesOnDriverLocUpdate: true,
            buildingsEnabled: true,
            compassEnabled: true,

            // mock stream
            driverCoordinatesStream: Stream.periodic(
              const Duration(milliseconds: 500),
                  (i) {


                setState(() {
                  cameraPosition= LatLng(
                    15.3752939 + i / widget.latLng.latitude,
                    44.1792882 - i / widget.latLng.longitude,
                  );
                });
                  return cameraPosition;

                  }
            ),
            // sourceName: "This is source name",
            // driverName: "Alex",
            // onTapDriverMarker: (currentLocation) {
            //   if (kDebugMode) {
            //     print("Driver is currently at $currentLocation");
            //   }
            // },
            // on
            totalTimeCallback: (time) => print(time),
            totalDistanceCallback: (distance) => print(distance),
          ),
        ),
      ),
    );
  }
}



class MapSample extends StatefulWidget {
  final LatLng latLng;
  const MapSample(this.latLng,{Key? key}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

    CameraPosition? _kGooglePlex;

  addMarker() async {
  double  devicePixelRatio=1;
     markers.add(Marker(markerId: const MarkerId(
        "1"
    ),

    position: widget.latLng,
    icon:await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(90, 90),), 'assets/images/hospital-pin-icon.png'
    )));


    setState(() {
      markers=markers;
    });

    }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kGooglePlex=  CameraPosition(
  target: widget.latLng,
        zoom: 15.151926040649414,
      tilt: 59.440717697143555,

      bearing: 192.8334901395799,
  );

    addMarker();


    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target:widget.latLng,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

}
  static  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(15.3752939, 44.1792882),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Set<Marker> markers=  Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex!,

        rotateGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,

      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}