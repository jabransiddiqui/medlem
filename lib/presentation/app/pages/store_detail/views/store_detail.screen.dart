import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medlem/business_logic/business_logic.dart';
import 'package:medlem/data/data.dart';
import 'package:medlem/presentation/presentation.dart';
import 'package:medlem/services/serevices.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen(this.storeData, {super.key});
  final dynamic storeData;

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final appBarSize = AppBar().preferredSize.height;
    //final topPadding = data.viewPadding.top;
    final bottomPadding = data.viewPadding.bottom;
    return BlocProvider(
      create: (context) => StoreDetailCubit(Store.fromJson(widget.storeData)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<StoreDetailCubit, StoreDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: appBarSize + data.size.height / 2.3,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0)),
                          child: GoogleMapWidget(
                            initialCameraPosition: CameraPosition(
                              target: state.userLoction != null
                                  ? state.userLoction!
                                  : LatLng(state.storeData.lat ?? 0.0,
                                      state.storeData.lng ?? 0.0),
                              zoom: 15,
                            ),
                            markers: state.markers,
                            onMapCreated: (controller) {
                              context
                                  .read<StoreDetailCubit>()
                                  .onMapCreated(controller);
                            },
                            polylines: Set<Polyline>.of(state.polylines.values),
                          ),
                        ),
                      ),
                      Positioned(
                        top: appBarSize - 15,
                        left: 25,
                        child: RoundButtonWidget(
                          onPressed: () {
                            NavigationService.instance.goBack();
                          },
                          iconName: Icons.arrow_back,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25, right: 25, left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Wrap(
                            runSpacing: 10,
                            children: [
                              StoreView(state.storeData),
                              const TitleView('Available Services'),
                              const SizedBox(
                                height: 20,
                              ),
                              const ServicesView(),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: const Divider(),
                              ),
                              StoreContactView(state.storeData),
                              const TitleView('Opening Hours'),
                              Column(
                                children: state.storeData.openingHours!
                                    .map((openingHour) =>
                                        OpeningHoursView(openingHour))
                                    .toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.newspaper),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Kundeavis'),
                      ],
                    ),
                    onPressed: () {
                      NavigationService.instance.navigateTo(webView,
                          arguments: {
                            'url': state.storeData.newspaperUrl,
                            'title': 'News Papers'
                          });
                    },
                  ),
                ),
                SizedBox(
                  height: bottomPadding,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
