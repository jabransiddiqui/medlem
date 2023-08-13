import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlem/business_logic/business_logic.dart';
import 'package:medlem/presentation/presentation.dart';

class StoreLocationStatuBar extends StatelessWidget {
  const StoreLocationStatuBar(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SizedBox(
        height: height,
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: SearchFieldWidget(
                        onChanged: (value) {
                          context
                              .read<StoreLocatorCubit>()
                              .searchStore({'searchInput': value});
                        },
                        title: ''),
                  ),
                ),
                RoundButtonWidget(
                  onPressed: () {
                    context.read<StoreLocatorCubit>().getUserLocation();
                  },
                  iconName: Icons.my_location_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
