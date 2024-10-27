import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'live_scoreboard_model.dart';
export 'live_scoreboard_model.dart';

class LiveScoreboardWidget extends StatefulWidget {
  /// Show the current live score results of a match
  const LiveScoreboardWidget({super.key});

  @override
  State<LiveScoreboardWidget> createState() => _LiveScoreboardWidgetState();
}

class _LiveScoreboardWidgetState extends State<LiveScoreboardWidget> {
  late LiveScoreboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveScoreboardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
