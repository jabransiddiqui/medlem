import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medlem/core/core.dart';
import 'package:medlem/data/data.dart';
import 'package:medlem/env/app.secrets.dart';
import 'package:medlem/helper/helper.dart';
import 'package:medlem/services/serevices.dart';

import 'store_detail_state.dart';

class StoreDetailCubit extends Cubit<StoreDetailState> {
  StoreDetailCubit(this.storeData)
      : super(StoreDetailState(
            storeData: storeData, markers: const {}, polylines: const {})) {
    addMarkers();
  }

  final Store storeData;
  late GoogleMapController? _mapController;

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  addMarkers() async {
    final List<Marker> markers = [];
    try {
      var location = await MapHelper.getUserLocation();
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(location.latitude, location.longitude),
              zoom: 14)));
      var storeLocation = LatLng(storeData.lat ?? 0.0, storeData.lng ?? 0.0);
      emit(state.copyWith(
          userLoction: LatLng(location.latitude, location.longitude)));
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(
              "${ApiRoutes.originUrl}${storeData.chainImage}",
              targetWidth: 80);
      markers.add(Marker(
        markerId: const MarkerId('storeLocation'),
        position: storeLocation,
        icon: markerImage,
      ));
      emit(state.copyWith(markers: markers.toSet()));
      getDirections(location, storeLocation);
    } catch (_) {}
  }

  getDirections(startLocation, endLocation) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      debugPrint(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    Map<PolylineId, Polyline> polylines = {};
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Theme.of(NavigationService.instance.navigatorKey.currentContext!)
          .colorScheme
          .primary,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    emit(state.copyWith(polylines: polylines));
  }
}
