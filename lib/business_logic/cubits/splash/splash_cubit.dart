import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlem/services/serevices.dart';
import 'splash.cubit.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState()) {
    setRoot();
  }

//Set Root
  Future<void> setRoot() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    NavigationService.instance.pushAndReplac(storeLocations);
  }
}
