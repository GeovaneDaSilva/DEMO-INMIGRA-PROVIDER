// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           _mapController = controller;
//         },
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(37.7749, -122.4194),
//           zoom: 12.0,
//         ),
//       ),
//     );
//   }
// }
