import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:medlem/data/data.dart';
import 'package:medlem/utils/utils.dart';

class StoreLocatorState extends Equatable {
  const StoreLocatorState({
    required this.screenStatus,
    required this.stores,
    required this.markers,
    required this.messageText,
    this.centerLocation,
    this.mapZoom = 15,
    required this.hideListView,
  });
  final ScreenStatus screenStatus;
  final List<Store> stores;
  final Set<Marker> markers;
  final Location? centerLocation;
  final double mapZoom;
  final String messageText;
  final bool hideListView;

  @override
  List<Object?> get props => [
        screenStatus,
        stores,
        markers,
        messageText,
        centerLocation,
        mapZoom,
        hideListView,
      ];

  StoreLocatorState copyWith({
    ScreenStatus? screenStatus,
    List<Store>? stores,
    Set<Marker>? markers,
    Location? centerLocation,
    double? mapZoom,
    String? messageText,
    bool? hideListView,
  }) {
    return StoreLocatorState(
      screenStatus: screenStatus ?? this.screenStatus,
      stores: stores ?? this.stores,
      markers: markers ?? this.markers,
      centerLocation: centerLocation ?? this.centerLocation,
      mapZoom: mapZoom ?? this.mapZoom,
      messageText: messageText ?? this.messageText,
      hideListView: hideListView ?? this.hideListView,
    );
  }
}
