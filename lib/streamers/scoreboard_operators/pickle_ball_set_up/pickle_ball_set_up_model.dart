import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'pickle_ball_set_up_widget.dart' show PickleBallSetUpWidget;
import 'package:flutter/material.dart';

class PickleBallSetUpModel extends FlutterFlowModel<PickleBallSetUpWidget> {
  ///  Local state fields for this page.

  Color homeColor = const Color(0x00000000);

  Color awayCalor = const Color(0x00000000);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  Color? colorPicked1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  Color? colorPicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for app_bar_backend component.
  late AppBarBackendModel appBarBackendModel;

  @override
  void initState(BuildContext context) {
    appBarBackendModel = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    appBarBackendModel.dispose();
  }
}
