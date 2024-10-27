import '/flutter_flow/flutter_flow_util.dart';
import '/watchers/app_bar/app_bar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'streaming_widget.dart' show StreamingWidget;
import 'package:flutter/material.dart';

class StreamingModel extends FlutterFlowModel<StreamingWidget> {
  ///  Local state fields for this page.

  bool noEvents = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController1;
  int liveStreamingCarouselCurrentIndex1 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController2;
  int liveStreamingCarouselCurrentIndex2 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController3;
  int liveStreamingCarouselCurrentIndex3 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController4;
  int liveStreamingCarouselCurrentIndex4 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController5;
  int liveStreamingCarouselCurrentIndex5 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController6;
  int liveStreamingCarouselCurrentIndex6 = 1;

  // State field(s) for upcomingMatchesCarousel widget.
  CarouselSliderController? upcomingMatchesCarouselController1;
  int upcomingMatchesCarouselCurrentIndex1 = 1;

  // State field(s) for recentsCarousel widget.
  CarouselSliderController? recentsCarouselController1;
  int recentsCarouselCurrentIndex1 = 1;

  // State field(s) for upcomingPlayoffsCarousel widget.
  CarouselSliderController? upcomingPlayoffsCarouselController;
  int upcomingPlayoffsCarouselCurrentIndex = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController7;
  int liveStreamingCarouselCurrentIndex7 = 1;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController8;
  int liveStreamingCarouselCurrentIndex8 = 1;

  // State field(s) for upcomingMatchesCarousel widget.
  CarouselSliderController? upcomingMatchesCarouselController2;
  int upcomingMatchesCarouselCurrentIndex2 = 1;

  // State field(s) for recentsCarousel widget.
  CarouselSliderController? recentsCarouselController2;
  int recentsCarouselCurrentIndex2 = 1;

  // Model for app_bar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    appBarModel.dispose();
  }
}
