import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'create_live_stream_model.dart';
export 'create_live_stream_model.dart';

class CreateLiveStreamWidget extends StatefulWidget {
  /// set up live stream conditions for live stream
  const CreateLiveStreamWidget({
    super.key,
    this.streamName,
    this.streamDate,
    this.equipmentOne,
    this.setsE1,
    this.pointsE1,
    this.equipmentTwo,
    this.setsE2,
    this.pointsE2,
    this.competitionName,
    this.live,
    this.urlLive,
    this.competitionLocation,
  });

  final String? streamName;
  final DateTime? streamDate;
  final String? equipmentOne;
  final String? setsE1;
  final String? pointsE1;
  final String? equipmentTwo;
  final String? setsE2;
  final String? pointsE2;
  final String? competitionName;
  final bool? live;
  final String? urlLive;
  final String? competitionLocation;

  @override
  State<CreateLiveStreamWidget> createState() => _CreateLiveStreamWidgetState();
}

class _CreateLiveStreamWidgetState extends State<CreateLiveStreamWidget> {
  late CreateLiveStreamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateLiveStreamModel());

    if (Platform.isAndroid || Platform.isIOS) {
      _initCamera();
    }
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    WakelockPlus.disable();

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
              child: Stack(
                children: [
                  FlutterFlowMuxBroadcast(
                    isCameraInitialized: _isCameraInitialized,
                    isStreaming: muxBroadcastIsLive,
                    durationString: _durationString,
                    borderRadius: BorderRadius.circular(0.0),
                    controller: muxBroadcastController,
                    videoConfig: _initialVideoConfig,
                    onCameraRotateButtonTap: () async {
                      await switchCamera();
                      safeSetState(
                          () => _isFrontCamSelected = !_isFrontCamSelected);
                    },
                    startButtonText: 'Start Stream',
                    startButtonIcon: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    startButtonOptions: FFButtonOptions(
                      width: 160.0,
                      height: 50.0,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    liveIcon: const FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.red,
                      size: 10.0,
                    ),
                    liveText: 'Live',
                    liveTextStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Manrope',
                              color: Colors.red,
                              letterSpacing: 0.0,
                            ),
                    liveTextBackgroundColor: const Color(0x8A000000),
                    durationTextStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Manrope',
                              color: Colors.red,
                              letterSpacing: 0.0,
                            ),
                    durationTextBackgroundColor: const Color(0x8A000000),
                    liveContainerBorderRadius: BorderRadius.circular(8.0),
                    durationContainerBorderRadius: BorderRadius.circular(8.0),
                    rotateButtonColor: const Color(0x8A000000),
                    rotateButtonIcon: const Icon(
                      Icons.flip_camera_android,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    stopButtonIcon: const Icon(
                      Icons.stop_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    stopButtonColor: Colors.red,
                    onStartButtonTap: () async {
                      await startStreaming();

                      var matchesRecordReference =
                          MatchesRecord.collection.doc();
                      await matchesRecordReference.set(createMatchesRecordData(
                        dateTime: widget.streamDate,
                        equipment1: widget.equipmentOne,
                        setsE1: widget.setsE1,
                        pointsE1: widget.pointsE1,
                        equipment2: widget.equipmentTwo,
                        setsE2: widget.setsE2,
                        pointsE2: widget.pointsE2,
                        competitionName: widget.competitionName,
                        stangeCompetition: '',
                        live: true,
                        livestreamVideoUrl: muxBroadcastPlaybackUrl,
                      ));
                      _model.streamOutput = MatchesRecord.getDocumentFromData(
                          createMatchesRecordData(
                            dateTime: widget.streamDate,
                            equipment1: widget.equipmentOne,
                            setsE1: widget.setsE1,
                            pointsE1: widget.pointsE1,
                            equipment2: widget.equipmentTwo,
                            setsE2: widget.setsE2,
                            pointsE2: widget.pointsE2,
                            competitionName: widget.competitionName,
                            stangeCompetition: '',
                            live: true,
                            livestreamVideoUrl: muxBroadcastPlaybackUrl,
                          ),
                          matchesRecordReference);

                      safeSetState(() {});
                    },
                    onStopButtonTap: () async {
                      stopStreaming();

                      await _model.streamOutput!.reference
                          .update(createMatchesRecordData(
                        live: false,
                        dateTime: getCurrentTimestamp,
                      ));

                      context.pushNamed('Events_to_stream_backend');
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(65.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 270.0,
                        height: 90.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF9F0404),
                                  ),
                                ),
                                Container(
                                  width: 200.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'JOAQUIN PACHECO',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Bebas Neue',
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          '15',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Bebas Neue',
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '1',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Bebas Neue',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF9F0404),
                                  ),
                                ),
                                Container(
                                  width: 200.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'JOAQUIN PACHECO',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Bebas Neue',
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          '15',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Bebas Neue',
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '1',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Bebas Neue',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 260.0,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: Text(
                                  'open tennis classic',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Bebas Neue',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
          ],
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    safeSetState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        safeSetState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        safeSetState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        safeSetState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    const callName = 'createLiveStream';
    final response =
        await makeCloudCall(callName, {'latency_mode': 'standard'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        WakelockPlus.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      WakelockPlus.disable();
      liveStreamController.stopStreaming();
      safeSetState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      safeSetState(() {
        _durationString = _getDurationString(_stopwatch.elapsed);
      });
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
