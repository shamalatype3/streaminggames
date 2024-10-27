import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/streamers/app_bar_backend/app_bar_backend_widget.dart';
import 'create_new_event_widget.dart' show CreateNewEventWidget;
import 'package:flutter/material.dart';

class CreateNewEventModel extends FlutterFlowModel<CreateNewEventWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for NameOfTournament widget.
  FocusNode? nameOfTournamentFocusNode;
  TextEditingController? nameOfTournamentTextController;
  String? Function(BuildContext, String?)?
      nameOfTournamentTextControllerValidator;
  // State field(s) for stageOfTournament widget.
  FocusNode? stageOfTournamentFocusNode;
  TextEditingController? stageOfTournamentTextController;
  String? Function(BuildContext, String?)?
      stageOfTournamentTextControllerValidator;
  // State field(s) for NameOfCourt widget.
  FocusNode? nameOfCourtFocusNode;
  TextEditingController? nameOfCourtTextController;
  String? Function(BuildContext, String?)? nameOfCourtTextControllerValidator;
  // State field(s) for EventCity widget.
  FocusNode? eventCityFocusNode1;
  TextEditingController? eventCityTextController1;
  String? Function(BuildContext, String?)? eventCityTextController1Validator;
  // State field(s) for EventCity widget.
  FocusNode? eventCityFocusNode2;
  TextEditingController? eventCityTextController2;
  String? Function(BuildContext, String?)? eventCityTextController2Validator;
  // State field(s) for Hom widget.
  FocusNode? homFocusNode;
  TextEditingController? homTextController;
  String? Function(BuildContext, String?)? homTextControllerValidator;
  // State field(s) for Away widget.
  FocusNode? awayFocusNode;
  TextEditingController? awayTextController;
  String? Function(BuildContext, String?)? awayTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MatchesRecord? upcomingEvent;
  // Model for app_bar_backend component.
  late AppBarBackendModel appBarBackendModel;

  @override
  void initState(BuildContext context) {
    appBarBackendModel = createModel(context, () => AppBarBackendModel());
  }

  @override
  void dispose() {
    nameOfTournamentFocusNode?.dispose();
    nameOfTournamentTextController?.dispose();

    stageOfTournamentFocusNode?.dispose();
    stageOfTournamentTextController?.dispose();

    nameOfCourtFocusNode?.dispose();
    nameOfCourtTextController?.dispose();

    eventCityFocusNode1?.dispose();
    eventCityTextController1?.dispose();

    eventCityFocusNode2?.dispose();
    eventCityTextController2?.dispose();

    homFocusNode?.dispose();
    homTextController?.dispose();

    awayFocusNode?.dispose();
    awayTextController?.dispose();

    appBarBackendModel.dispose();
  }
}
