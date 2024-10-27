import '/flutter_flow/flutter_flow_util.dart';
import '/watchers/app_bar/app_bar_widget.dart';
import 'view_all_streams_widget.dart' show ViewAllStreamsWidget;
import 'package:flutter/material.dart';

class ViewAllStreamsModel extends FlutterFlowModel<ViewAllStreamsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for app_bar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
