import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'watch_preview_widget.dart' show WatchPreviewWidget;
import 'package:flutter/material.dart';

class WatchPreviewModel extends FlutterFlowModel<WatchPreviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getLiveStreamID)] action in Container widget.
  ApiCallResponse? liveStreamID;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in Container widget.
  ApiCallResponse? pastStreamID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
