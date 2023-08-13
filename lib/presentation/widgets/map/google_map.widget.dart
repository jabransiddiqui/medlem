import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    required this.initialCameraPosition,
    required this.markers,
    required this.onMapCreated,
    super.key,
    this.polylines,
  });
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final Set<Polyline>? polylines;
  final void Function(GoogleMapController)? onMapCreated;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapToolbarEnabled: false,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      polylines: polylines ?? <Polyline>{},
      onMapCreated: onMapCreated,
    );
  }
}
