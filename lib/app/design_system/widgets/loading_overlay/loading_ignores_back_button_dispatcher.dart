import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reclaim/app/design_system/widgets/loading_overlay/loading_overlay_controller.dart';

class LoadingIgnoresBackButtonDispatcher extends RootBackButtonDispatcher {
  final loadingOverlayController = LoadingOverlayController();

  @override
  Future<bool> didPopRoute() async {
    if (!loadingOverlayController.isVisible) {
      return super.didPopRoute();
    }

    return true;
  }
}
