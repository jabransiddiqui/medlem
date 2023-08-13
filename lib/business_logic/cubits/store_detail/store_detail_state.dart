import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:medlem/data/data.dart';

class StoreDetailState extends Equatable {
  StoreDetailState(
      {required this.storeData,
      required this.markers,
      required this.polylines,
      this.userLoction});
  final Store storeData;
  final Set<Marker> markers;
  final LatLng? userLoction;
  Map<PolylineId, Polyline> polylines;
  @override
  List<Object?> get props => [storeData, markers, userLoction, polylines];

  StoreDetailState copyWith({
    Store? storeData,
    Set<Marker>? markers,
    LatLng? userLoction,
    Map<PolylineId, Polyline>? polylines,
  }) {
    return StoreDetailState(
      storeData: storeData ?? this.storeData,
      markers: markers ?? this.markers,
      userLoction: userLoction ?? this.userLoction,
      polylines: polylines ?? this.polylines,
    );
  }
}
