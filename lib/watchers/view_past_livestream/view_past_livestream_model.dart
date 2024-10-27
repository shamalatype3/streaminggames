import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/scoreboard_operators/live_scoreboard/live_scoreboard_widget.dart';
import 'view_past_livestream_widget.dart' show ViewPastLivestreamWidget;
import 'package:flutter/material.dart';

class ViewPastLivestreamModel
    extends FlutterFlowModel<ViewPastLivestreamWidget> {
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
