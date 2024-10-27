import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'backend_profile_widget.dart' show BackendProfileWidget;
import 'package:flutter/material.dart';

class BackendProfileModel extends FlutterFlowModel<BackendProfileWidget> {
  ///  Local state fields for this page.

  Color homeColor = const Color(0x00000000);

  Color awayCalor = const Color(0x00000000);

  ///  State fields for stateful widgets in this page.

  // Model for app_bar_backend component.
  late AppBarBackendModel appBarBackendModel;

  @override
  void initState(BuildContext context) {
    appBarBackendModel = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    appBarBackendModel.dispose();
  }
}
