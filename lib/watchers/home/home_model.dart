import '/flutter_flow/flutter_flow_util.dart';
import '/watchers/app_bar/app_bar_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TrendingStreamsList widget.
  PageController? trendingStreamsListController;

  int get trendingStreamsListCurrentIndex =>
      trendingStreamsListController != null &&
              trendingStreamsListController!.hasClients &&
              trendingStreamsListController!.page != null
          ? trendingStreamsListController!.page!.round()
          : 0;
  // State field(s) for LiveStreamingList widget.
  PageController? liveStreamingListController;

  int get liveStreamingListCurrentIndex =>
      liveStreamingListController != null &&
              liveStreamingListController!.hasClients &&
              liveStreamingListController!.page != null
          ? liveStreamingListController!.page!.round()
          : 0;
  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController1;
  int liveStreamingCarouselCurrentIndex1 = 0;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController2;
  int liveStreamingCarouselCurrentIndex2 = 0;

  // State field(s) for liveStreamingCarousel widget.
  CarouselSliderController? liveStreamingCarouselController3;
  int liveStreamingCarouselCurrentIndex3 = 0;

  // Model for app_bar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    appBarModel.dispose();
  }
}
