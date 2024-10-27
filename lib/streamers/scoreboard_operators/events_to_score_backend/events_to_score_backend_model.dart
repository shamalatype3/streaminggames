import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'events_to_score_backend_widget.dart' show EventsToScoreBackendWidget;
import 'package:flutter/material.dart';

class EventsToScoreBackendModel
    extends FlutterFlowModel<EventsToScoreBackendWidget> {
  ///  Local state fields for this page.

  bool noScore = true;

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
