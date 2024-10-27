import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_backend_model.dart';
export 'app_bar_backend_model.dart';

class AppBarBackendWidget extends StatefulWidget {
  const AppBarBackendWidget({
    super.key,
    required this.section,
  });

  final int? section;

  @override
  State<AppBarBackendWidget> createState() => _AppBarBackendWidgetState();
}

class _AppBarBackendWidgetState extends State<AppBarBackendWidget> {
  late AppBarBackendModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 8.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('CreateNewEvent');
              },
              child: Icon(
                Icons.calendar_month,
                color: valueOrDefault<Color>(
                  widget.section == 1
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).primary,
                ),
                size: 24.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Events_to_score_backend');
              },
              child: Icon(
                Icons.ballot,
                color: valueOrDefault<Color>(
                  widget.section == 2
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).secondary,
                ),
                size: 24.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Events_to_stream_backend');
              },
              child: Icon(
                Icons.videocam_sharp,
                color: valueOrDefault<Color>(
                  widget.section == 3
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).secondary,
                ),
                size: 22.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('backendProfile');
              },
              child: Icon(
                Icons.person,
                color: valueOrDefault<Color>(
                  widget.section == 4
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).secondary,
                ),
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
