import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'events_to_stream_backend_widget.dart' show EventsToStreamBackendWidget;
import 'package:flutter/material.dart';

class EventsToStreamBackendModel
    extends FlutterFlowModel<EventsToStreamBackendWidget> {
  ///  Local state fields for this page.

  bool noStream = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for app_bar_backend component.
  late AppBarBackendModel appBarBackendModel;

  @override
  void initState(BuildContext context) {
    appBarBackendModel = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    appBarBackendModel.dispose();
  }
}
