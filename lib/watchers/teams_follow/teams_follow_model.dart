import '/flutter_flow/flutter_flow_util.dart';
import '/watchers/app_bar/app_bar_widget.dart';
import 'teams_follow_widget.dart' show TeamsFollowWidget;
import 'package:flutter/material.dart';

class TeamsFollowModel extends FlutterFlowModel<TeamsFollowWidget> {
  ///  Local state fields for this page.

  List<bool> isteamFollowed = [];
  void addToIsteamFollowed(bool item) => isteamFollowed.add(item);
  void removeFromIsteamFollowed(bool item) => isteamFollowed.remove(item);
  void removeAtIndexFromIsteamFollowed(int index) =>
      isteamFollowed.removeAt(index);
  void insertAtIndexInIsteamFollowed(int index, bool item) =>
      isteamFollowed.insert(index, item);
  void updateIsteamFollowedAtIndex(int index, Function(bool) updateFn) =>
      isteamFollowed[index] = updateFn(isteamFollowed[index]);

  ///  State fields for stateful widgets in this page.

  // Model for app_bar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
