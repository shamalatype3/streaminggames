import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/streamers/scoreboard_operators/live_scoreboard/live_scoreboard_widget.dart';
import 'package:flutter/material.dart';
import 'view_past_livestream_model.dart';
export 'view_past_livestream_model.dart';

class ViewPastLivestreamWidget extends StatefulWidget {
  const ViewPastLivestreamWidget({
    super.key,
    this.matchDoc,
    this.pastLivestreamUrl,
  });

  final MatchesRecord? matchDoc;
  final String? pastLivestreamUrl;

  @override
  State<ViewPastLivestreamWidget> createState() =>
      _ViewPastLivestreamWidgetState();
}

class _ViewPastLivestreamWidgetState extends State<ViewPastLivestreamWidget> {
  late ViewPastLivestreamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPastLivestreamModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF1A1A1A),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 0.0, 0.0),
              child: Container(
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 30.0,
                      fillColor: const Color(0xA5000000),
                      icon: Icon(
                        Icons.clear_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 15.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Text(
                      'Close',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Bebas Neue',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 270.0,
                  height: 90.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.liveScoreboardModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const LiveScoreboardWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
