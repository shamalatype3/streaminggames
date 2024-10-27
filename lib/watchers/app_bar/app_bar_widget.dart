import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    required this.section,
  });

  final int? section;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
        child: Container(
          width: 340.0,
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
                  context.pushNamed('Home');
                },
                child: Icon(
                  Icons.home_sharp,
                  color: valueOrDefault<Color>(
                    widget.section == 1
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
                  context.pushNamed('streaming');
                },
                child: Icon(
                  Icons.sports_tennis,
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
                  context.pushNamed('watchPreview');
                },
                child: FaIcon(
                  FontAwesomeIcons.video,
                  color: valueOrDefault<Color>(
                    widget.section == 3
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
                  context.pushNamed('viewAllStreams');
                },
                child: FaIcon(
                  FontAwesomeIcons.tableTennis,
                  color: valueOrDefault<Color>(
                    widget.section == 4
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
                  context.goNamed('Profile');
                },
                child: Icon(
                  Icons.person,
                  color: valueOrDefault<Color>(
                    widget.section == 5
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
      ),
    );
  }
}
