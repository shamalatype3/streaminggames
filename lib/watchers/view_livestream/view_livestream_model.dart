import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/scoreboard_operators/live_scoreboard/live_scoreboard_widget.dart';
import 'view_livestream_widget.dart' show ViewLivestreamWidget;
import 'package:flutter/material.dart';

class ViewLivestreamModel extends FlutterFlowModel<ViewLivestreamWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LiveScoreboard component.
  late LiveScoreboardModel liveScoreboardModel;

  @override
  void initState(BuildContext context) {
    liveScoreboardModel = createModel(context, () => LiveScoreboardModel());
  }

  @override
  void dispose() {
    liveScoreboardModel.dispose();
  }
}
