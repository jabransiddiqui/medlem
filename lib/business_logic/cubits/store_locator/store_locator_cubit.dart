import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medlem/core/core.dart';
import 'package:medlem/data/data.dart';
import 'package:medlem/helper/helper.dart';
import 'package:medlem/utils/utils.dart';

import 'store_locator.cubit.dart';

class StoreLocatorCubit extends Cubit<StoreLocatorState> {
  StoreLocatorCubit()
      : super(const StoreLocatorState(
          screenStatus: ScreenStatus.initial,
          stores: [],
          markers: {},
          hideListView: false,
          messageText: '',
        )) {
    storeRepository = StoreRepository();
    getUserLocation();
  }
  StoreRepository? storeRepository;
  final scrollController = ScrollController();

  late GoogleMapController? _mapController;

  Future searchStore(dynamic queryParam) async {
    try {
      emit(state.copyWith(
          screenStatus: ScreenStatus.loading,
          messageText: '',
          stores: [],
          centerLocation: null));
      final res = await storeRepository?.searchStores(queryParam);
      if ((res?.stores != null && (res?.stores?.length ?? 0) > 0) ||
          (res?.additionalStores != null &&
              (res?.additionalStores?.length ?? 0) > 0)) {
        List<Store> storeList = [];
        if ((res?.stores?.length ?? 0) > 0) {
          storeList = [...storeList, ...res?.stores ?? []];
        }
        if ((res?.additionalStores?.length ?? 0) > 0) {
          storeList = [...storeList, ...res?.additionalStores ?? []];
        }
        emit(state.copyWith(
          screenStatus: ScreenStatus.success,
          centerLocation: res?.location,
          stores: storeList,
        ));
        initMarkers();
        _mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    storeList.first.lat ?? 0.0, storeList.first.lng ?? 0.0),
                zoom: state.mapZoom)));
      } else {
        emit(state.copyWith(
          screenStatus: ScreenStatus.failure,
          messageText: 'No data found',
          stores: [],
          centerLocation: null,
          markers: {},
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        screenStatus: ScreenStatus.failure,
        messageText: 'Unable to load data',
        stores: [],
        centerLocation: null,
        markers: {},
      ));
    }
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMarkerTapped(int markerId) {
    debugPrint(" markerId : $markerId");
    final contentSize = scrollController.position.viewportDimension +
        scrollController.position.maxScrollExtent;

    final target = contentSize * markerId / state.stores.length;
    scrollController.position.animateTo(
      target,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void initMarkers() async {
    final List<Marker> markers = [];
    for (var store in state.stores) {
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(
              "${ApiRoutes.originUrl}${store.chainImage}",
              targetWidth: 80);

      markers.add(
        Marker(
          markerId: MarkerId(state.stores.indexOf(store).toString()),
          position: LatLng(store.lat ?? 0.0, store.lng ?? 0.0),
          icon: markerImage,
          onTap: () {
            _onMarkerTapped(state.stores.indexOf(store));
          },
        ),
      );
    }
    emit(state.copyWith(markers: markers.toSet()));
  }

  getUserLocation() async {
    try {
      emit(state.copyWith(screenStatus: ScreenStatus.loading, messageText: ''));
      var location = await MapHelper.getUserLocation();
      searchStore({
        'locationLat': location.latitude,
        'locationLon': location.longitude
      });
    } catch (e) {
      emitFailureState(e.toString());
    }
  }

  emitFailureState(String message) {
    emit(state.copyWith(
        screenStatus: ScreenStatus.failure, messageText: message));
  }
}
