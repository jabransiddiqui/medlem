import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medlem/business_logic/business_logic.dart';
import 'package:medlem/presentation/presentation.dart';
import 'package:medlem/utils/utils.dart';

class StoreLocationScreen extends StatefulWidget {
  const StoreLocationScreen({super.key});

  @override
  State<StoreLocationScreen> createState() => _StoreLocationScreenState();
}

class _StoreLocationScreenState extends State<StoreLocationScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final appBarSize = AppBar().preferredSize.height;
    //final topPadding = data.viewPadding.top;
    final bottomPadding = data.viewPadding.bottom;

    return BlocProvider(
      create: (context) => StoreLocatorCubit(),
      child: Scaffold(
        body: BlocConsumer<StoreLocatorCubit, StoreLocatorState>(
          listener: (context, state) {},
          builder: (context, state) {
            debugPrint(state.screenStatus.name);
            return Stack(
              children: [
                GoogleMapWidget(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(state.centerLocation?.latitude ?? 0.0,
                        state.centerLocation?.longitude ?? 0.0),
                    zoom: state.mapZoom,
                  ),
                  markers: state.markers,
                  onMapCreated: (controller) {
                    context.read<StoreLocatorCubit>().onMapCreated(controller);
                  },
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state.screenStatus == ScreenStatus.initial ||
                          state.screenStatus == ScreenStatus.loading)
                        const LoadingView(),
                      if (state.messageText.isNotEmpty)
                        MessageView(
                          state.messageText,
                        ),
                    ],
                  ),
                ),
                StoreLocationStatuBar(appBarSize + 50),
                if (state.screenStatus == ScreenStatus.success ||
                    !state.hideListView)
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: 165,
                      margin: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 10,
                          bottom: bottomPadding + 10),
                      child: ListView.builder(
                        controller:
                            context.read<StoreLocatorCubit>().scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.stores.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (_, i) {
                          final storeDetail = state.stores[i];
                          return StoreListViewItem(
                              storeDetail, (data.size.width - 70));
                        },
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
