import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'tennis_controller_widget.dart' show TennisControllerWidget;
import 'package:flutter/material.dart';

class TennisControllerModel extends FlutterFlowModel<TennisControllerWidget> {
  ///  Local state fields for this page.

  Color homeColor = const Color(0x00000000);

  Color awayCalor = const Color(0x00000000);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // Model for app_bar_backend component.
  late AppBarBackendModel appBarBackendModel;

  @override
  void initState(BuildContext context) {
    appBarBackendModel = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    appBarBackendModel.dispose();
  }
}
