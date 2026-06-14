import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transaction_edit_model.dart';
export 'transaction_edit_model.dart';

class TransactionEditWidget extends StatefulWidget {
  const TransactionEditWidget({
    super.key,
    required this.budgetListReferencePARAM,
    this.folderNamePARAM,
    this.dateCreatedPARAM,
  });

  final DocumentReference? budgetListReferencePARAM;
  final String? folderNamePARAM;
  final DateTime? dateCreatedPARAM;

  static String routeName = 'Transaction_Edit';
  static String routePath = '/transactionEdit';

  @override
  State<TransactionEditWidget> createState() => _TransactionEditWidgetState();
}

class _TransactionEditWidgetState extends State<TransactionEditWidget> {
  late TransactionEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getBudget = await BudgetListCollectionRecord.getDocumentOnce(
          widget.budgetListReferencePARAM!);
      safeSetState(() {
        _model.choiceChipsValueController?.value = [_model.getBudget!.category];
      });
      safeSetState(() {
        _model.titleTextFieldTextController?.text = _model.getBudget!.title;
      });
      safeSetState(() {
        _model.descriptionTextFieldTextController?.text =
            _model.getBudget!.description;
      });
      safeSetState(() {
        _model.amountTextFieldTextController?.text =
            (double.parse(_model.getBudget!.amount.toString()).abs())
                .toString();
      });
      safeSetState(() {
        _model.dateTextFieldTextController1?.text = valueOrDefault<String>(
          dateTimeFormat("M/d h:mm a", _model.getBudget?.dateCreated),
          'Select a Date',
        );
      });
      safeSetState(() {
        _model.dateTextFieldTextController2?.text = valueOrDefault<String>(
          dateTimeFormat("M/d h:mm a", _model.getBudget?.dueDate),
          'Select a Date',
        );
      });
    });

    _model.titleTextFieldTextController ??= TextEditingController();
    _model.titleTextFieldFocusNode ??= FocusNode();

    _model.descriptionTextFieldTextController ??= TextEditingController();
    _model.descriptionTextFieldFocusNode ??= FocusNode();

    _model.amountTextFieldTextController ??= TextEditingController();
    _model.amountTextFieldFocusNode ??= FocusNode();

    _model.dateTextFieldTextController1 ??= TextEditingController();
    _model.dateTextFieldFocusNode1 ??= FocusNode();

    _model.dateTextFieldTextController2 ??= TextEditingController();
    _model.dateTextFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE6F0E8),
        appBar: AppBar(
          backgroundColor: Color(0xFFE6F0E8),
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Transaction',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.w800,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF1F2D2B),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              Text(
                'Please fill out the form below to continue.',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      color: Color(0xFF606A85),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Color(0xFFD36B6B),
                  borderRadius: 12.0,
                  buttonSize: 40.0,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: Color(0xFFD36B6B),
                    size: 20.0,
                  ),
                  onPressed: () async {
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Delete Transaction'),
                                content: Text(
                                    'Are you sure you want to delete this transaction?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await actions.scheduleNotification(
                          getCurrentTimestamp.secondsSinceEpoch,
                          'Transaction Deleted!',
                          '${_model.titleTextFieldTextController.text} ${_model.choiceChipsValue}has been deleted',
                          functions.intUnixToDateTime(functions.sumValues(
                              getCurrentTimestamp.secondsSinceEpoch, 0))!,
                          '',
                        );

                        firestoreBatch.set(
                            NotifyActionCollectionRecord.collection.doc(),
                            createNotifyActionCollectionRecordData(
                              userForeignKEY: currentUserReference,
                              actionType: 'Deleted',
                              titleAndFolder:
                                  '${_model.titleTextFieldTextController.text} Transaction',
                              folderOrFolderCollection:
                                  '${widget.folderNamePARAM} Folder',
                              currentTimeRelative: getCurrentTimestamp,
                            ));
                        firestoreBatch.delete(_model.getBudget!.reference);
                        firestoreBatch.delete(_model.getBudget!.reference);
                        context.safePop();
                      } else {
                        return;
                      }
                    } finally {
                      await firestoreBatch.commit();
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: Color(0xFFE5E7EB),
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: Colors.white,
                icon: Icon(
                  Icons.close_rounded,
                  color: Color(0xFF15161E),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 770.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Category',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  FlutterFlowChoiceChips(
                                    options: [
                                      ChipData('Revenue'),
                                      ChipData('Expense')
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.choiceChipsValue =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0x4C39D2C0),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.figtree(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF15161E),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor: Color(0xFF15161E),
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: Color(0xFF135413),
                                      borderWidth: 2.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0xFFF1F4F8),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.figtree(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor: Color(0xFF606A85),
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: Color(0xFFE5E7EB),
                                      borderWidth: 2.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    chipSpacing: 8.0,
                                    rowSpacing: 8.0,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Transaction Title',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.titleTextFieldTextController,
                                    focusNode: _model.titleTextFieldFocusNode,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Title...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                      hintStyle: GoogleFonts.roboto(
                                        color: Color(0x00000000),
                                        fontSize: 0.0,
                                      ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.figtree(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF5963),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6F61EF),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF7FAF8),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 20.0, 16.0, 20.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF14181B),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                    cursorColor: Color(0xFF6F61EF),
                                    validator: _model
                                        .titleTextFieldTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]'))
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Description',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: _model
                                        .descriptionTextFieldTextController,
                                    focusNode:
                                        _model.descriptionTextFieldFocusNode,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Describe...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      alignLabelWithHint: true,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.figtree(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF5963),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6F61EF),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF7FAF8),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 16.0, 16.0, 16.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF14181B),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                    maxLines: 9,
                                    minLines: 5,
                                    cursorColor: Color(0xFF6F61EF),
                                    validator: _model
                                        .descriptionTextFieldTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Add Tags',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  if (_model.choiceChipsValue == 'Revenue')
                                    FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Uncategorized'),
                                        ChipData('Farm Revenue'),
                                        ChipData('Personal Income')
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.choiceChipsRevenueValue =
                                              val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0x4C39D2C0),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF15161E),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        iconColor: Color(0xFF15161E),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: Color(0xFF135413),
                                        borderWidth: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xFFF1F4F8),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        iconColor: Color(0xFF606A85),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: Color(0xFFE5E7EB),
                                        borderWidth: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 8.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsRevenueValue !=
                                              null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .choiceChipsRevenueValueController ??=
                                          FormFieldController<List<String>>(
                                        ['Uncategorized'],
                                      ),
                                      wrapped: true,
                                    ),
                                  if (_model.choiceChipsValue == 'Expense')
                                    FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Uncategorized'),
                                        ChipData('Business'),
                                        ChipData('Farm Supplies'),
                                        ChipData('Labor'),
                                        ChipData('Livestock'),
                                        ChipData('Loans'),
                                        ChipData('Equipment'),
                                        ChipData('Maintenance'),
                                        ChipData('Tax'),
                                        ChipData('Weather/Atmosphere')
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.choiceChipsExpenseValue =
                                              val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0x4C39D2C0),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF15161E),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        iconColor: Color(0xFF15161E),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: Color(0xFF135413),
                                        borderWidth: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xFFF1F4F8),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        iconColor: Color(0xFF606A85),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: Color(0xFFE5E7EB),
                                        borderWidth: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 8.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsExpenseValue !=
                                              null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .choiceChipsExpenseValueController ??=
                                          FormFieldController<List<String>>(
                                        ['Uncategorized'],
                                      ),
                                      wrapped: true,
                                    ),
                                  if (_model.choiceChipsExpenseValue ==
                                      'Weather/Atmosphere')
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .weatherDropDownValueController ??=
                                          FormFieldController<String>(null),
                                      options: [
                                        'Intense Temperature',
                                        'Rain',
                                        'Thunderstorm',
                                        'Volcanic Activity',
                                        'Snow/Hail',
                                        'Mist'
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.weatherDropDownValue = val),
                                      width: 180.0,
                                      height: 35.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select Event',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2.0,
                                      borderColor: Color(0xFF135413),
                                      borderWidth: 2.0,
                                      borderRadius: 12.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Amount',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.amountTextFieldTextController,
                                    focusNode: _model.amountTextFieldFocusNode,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '0.00',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.figtree(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF5963),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6F61EF),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF7FAF8),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 20.0, 16.0, 20.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF14181B),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    cursorColor: Color(0xFF6F61EF),
                                    validator: _model
                                        .amountTextFieldTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Set Date',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '*',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF1313),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      TextFormField(
                                        controller:
                                            _model.dateTextFieldTextController1,
                                        focusNode:
                                            _model.dateTextFieldFocusNode1,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF606A85),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF606A85),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.figtree(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFFF5963),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E7EB),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF6F61EF),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 20.0, 16.0, 20.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF14181B),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        cursorColor: Color(0xFF6F61EF),
                                        validator: _model
                                            .dateTextFieldTextController1Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          if (!isAndroid && !isiOS)
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              return TextEditingValue(
                                                selection: newValue.selection,
                                                text: newValue.text
                                                    .toCapitalization(
                                                        TextCapitalization
                                                            .words),
                                              );
                                            }),
                                        ],
                                      ),
                                      Opacity(
                                        opacity: 0.1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked1Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  (widget.dateCreatedPARAM ??
                                                      DateTime.now()),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      Color(0xFF6F61EF),
                                                  headerForegroundColor:
                                                      Colors.white,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF15161E),
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                          ),
                                                  pickerBackgroundColor:
                                                      Colors.white,
                                                  pickerForegroundColor:
                                                      Color(0xFF15161E),
                                                  selectedDateTimeBackgroundColor:
                                                      Color(0xFF6F61EF),
                                                  selectedDateTimeForegroundColor:
                                                      Colors.white,
                                                  actionButtonForegroundColor:
                                                      Color(0xFF15161E),
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            TimeOfDay? _datePicked1Time;
                                            if (_datePicked1Date != null) {
                                              _datePicked1Time =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay
                                                    .fromDateTime((widget
                                                            .dateCreatedPARAM ??
                                                        DateTime.now())),
                                                builder: (context, child) {
                                                  return wrapInMaterialTimePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        Color(0xFF6F61EF),
                                                    headerForegroundColor:
                                                        Colors.white,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF15161E),
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                    pickerBackgroundColor:
                                                        Colors.white,
                                                    pickerForegroundColor:
                                                        Color(0xFF15161E),
                                                    selectedDateTimeBackgroundColor:
                                                        Color(0xFF6F61EF),
                                                    selectedDateTimeForegroundColor:
                                                        Colors.white,
                                                    actionButtonForegroundColor:
                                                        Color(0xFF15161E),
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );
                                            }

                                            if (_datePicked1Date != null &&
                                                _datePicked1Time != null) {
                                              safeSetState(() {
                                                _model.datePicked1 = DateTime(
                                                  _datePicked1Date.year,
                                                  _datePicked1Date.month,
                                                  _datePicked1Date.day,
                                                  _datePicked1Time!.hour,
                                                  _datePicked1Time.minute,
                                                );
                                              });
                                            } else if (_model.datePicked1 !=
                                                null) {
                                              safeSetState(() {
                                                _model.datePicked1 =
                                                    widget.dateCreatedPARAM;
                                              });
                                            }
                                            safeSetState(() {
                                              _model.dateTextFieldTextController1
                                                      ?.text =
                                                  valueOrDefault<String>(
                                                dateTimeFormat("d/M h:mm a",
                                                    _model.datePicked1),
                                                'Select a Date',
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF7FAF8),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0xFFE5E7EB),
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                Icons.access_time_filled,
                                                color: Color(0xFF2A5FA9),
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Due Date (Optional)',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF606A85),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Stack(
                                    children: [
                                      TextFormField(
                                        controller:
                                            _model.dateTextFieldTextController2,
                                        focusNode:
                                            _model.dateTextFieldFocusNode2,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF606A85),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF606A85),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.figtree(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFFF5963),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E7EB),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF6F61EF),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 20.0, 16.0, 20.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF14181B),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        cursorColor: Color(0xFF6F61EF),
                                        validator: _model
                                            .dateTextFieldTextController2Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          if (!isAndroid && !isiOS)
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              return TextEditingValue(
                                                selection: newValue.selection,
                                                text: newValue.text
                                                    .toCapitalization(
                                                        TextCapitalization
                                                            .words),
                                              );
                                            }),
                                        ],
                                      ),
                                      Opacity(
                                        opacity: 0.1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  (widget.dateCreatedPARAM ??
                                                      DateTime.now()),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      Color(0xFF6F61EF),
                                                  headerForegroundColor:
                                                      Colors.white,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF15161E),
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                          ),
                                                  pickerBackgroundColor:
                                                      Colors.white,
                                                  pickerForegroundColor:
                                                      Color(0xFF15161E),
                                                  selectedDateTimeBackgroundColor:
                                                      Color(0xFF6F61EF),
                                                  selectedDateTimeForegroundColor:
                                                      Colors.white,
                                                  actionButtonForegroundColor:
                                                      Color(0xFF15161E),
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            TimeOfDay? _datePicked2Time;
                                            if (_datePicked2Date != null) {
                                              _datePicked2Time =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay
                                                    .fromDateTime((widget
                                                            .dateCreatedPARAM ??
                                                        DateTime.now())),
                                                builder: (context, child) {
                                                  return wrapInMaterialTimePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        Color(0xFF6F61EF),
                                                    headerForegroundColor:
                                                        Colors.white,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF15161E),
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                    pickerBackgroundColor:
                                                        Colors.white,
                                                    pickerForegroundColor:
                                                        Color(0xFF15161E),
                                                    selectedDateTimeBackgroundColor:
                                                        Color(0xFF6F61EF),
                                                    selectedDateTimeForegroundColor:
                                                        Colors.white,
                                                    actionButtonForegroundColor:
                                                        Color(0xFF15161E),
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );
                                            }

                                            if (_datePicked2Date != null &&
                                                _datePicked2Time != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  _datePicked2Date.year,
                                                  _datePicked2Date.month,
                                                  _datePicked2Date.day,
                                                  _datePicked2Time!.hour,
                                                  _datePicked2Time.minute,
                                                );
                                              });
                                            } else if (_model.datePicked2 !=
                                                null) {
                                              safeSetState(() {
                                                _model.datePicked2 =
                                                    widget.dateCreatedPARAM;
                                              });
                                            }
                                            safeSetState(() {
                                              _model.dateTextFieldTextController2
                                                      ?.text =
                                                  valueOrDefault<String>(
                                                dateTimeFormat("M/d h:mm a",
                                                    _model.datePicked2),
                                                'Select a Date',
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF7FAF8),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0xFFE5E7EB),
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                Icons.access_time_filled,
                                                color: Color(0xFF2A5FA9),
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                                    .divide(SizedBox(height: 12.0))
                                    .addToEnd(SizedBox(height: 32.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 770.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      if ((_model.choiceChipsValue == null ||
                                              _model.choiceChipsValue == '') ||
                                          (_model.titleTextFieldTextController.text ==
                                                  '') ||
                                          (_model.descriptionTextFieldTextController
                                                      .text ==
                                                  '') ||
                                          (_model.amountTextFieldTextController
                                                      .text ==
                                                  '') ||
                                          (_model.dateTextFieldTextController1
                                                      .text ==
                                                  '') ||
                                          (_model.dateTextFieldTextController2
                                                      .text ==
                                                  '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Field(s) should not be empty.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        if (_model.choiceChipsValue ==
                                            'Expense') {
                                          safeSetState(() {
                                            _model.amountTextFieldTextController
                                                ?.text = (-(double.tryParse(_model
                                                        .amountTextFieldTextController
                                                        .text) ??
                                                    0))
                                                .toString();
                                          });

                                          firestoreBatch.update(
                                              widget.budgetListReferencePARAM!,
                                              createBudgetListCollectionRecordData(
                                                title: _model
                                                    .titleTextFieldTextController
                                                    .text,
                                                description: _model
                                                    .descriptionTextFieldTextController
                                                    .text,
                                                amount: double.tryParse(_model
                                                    .amountTextFieldTextController
                                                    .text),
                                                category:
                                                    _model.choiceChipsValue,
                                                dateCreated: _model.datePicked1,
                                                dueDate: _model.datePicked2,
                                                dateCreatedChart: _model
                                                    .datePicked1
                                                    ?.microsecondsSinceEpoch,
                                                dueDateChart: _model.datePicked2
                                                    ?.microsecondsSinceEpoch,
                                                tags: () {
                                                  if (_model.choiceChipsRevenueValue !=
                                                          null &&
                                                      _model.choiceChipsRevenueValue !=
                                                          '') {
                                                    return _model
                                                        .choiceChipsRevenueValue;
                                                  } else if (_model
                                                              .choiceChipsExpenseValue !=
                                                          null &&
                                                      _model.choiceChipsExpenseValue !=
                                                          '') {
                                                    return _model
                                                        .choiceChipsExpenseValue;
                                                  } else {
                                                    return 'Uncategorized';
                                                  }
                                                }(),
                                                absoluteAmount: double.parse(_model
                                                        .amountTextFieldTextController
                                                        .text)
                                                    .abs(),
                                              ));
                                          if (_model.choiceChipsExpenseValue ==
                                              'Weather/Atmosphere') {
                                            firestoreBatch.update(
                                                widget
                                                    .budgetListReferencePARAM!,
                                                createBudgetListCollectionRecordData(
                                                  weatherData: _model
                                                      .weatherDropDownValue,
                                                ));
                                          } else {
                                            firestoreBatch.update(
                                                widget
                                                    .budgetListReferencePARAM!,
                                                createBudgetListCollectionRecordData(
                                                  weatherData: ' ',
                                                ));
                                          }
                                        } else {
                                          safeSetState(() {
                                            _model.amountTextFieldTextController
                                                ?.text = (double.parse(_model
                                                        .amountTextFieldTextController
                                                        .text)
                                                    .abs())
                                                .toString();
                                          });

                                          firestoreBatch.update(
                                              widget.budgetListReferencePARAM!,
                                              createBudgetListCollectionRecordData(
                                                title: _model
                                                    .titleTextFieldTextController
                                                    .text,
                                                description: _model
                                                    .descriptionTextFieldTextController
                                                    .text,
                                                amount: double.tryParse(_model
                                                    .amountTextFieldTextController
                                                    .text),
                                                category:
                                                    _model.choiceChipsValue,
                                                dateCreated: _model.datePicked1,
                                                dueDate: _model.datePicked2,
                                                dateCreatedChart: _model
                                                    .datePicked1
                                                    ?.microsecondsSinceEpoch,
                                                dueDateChart: _model.datePicked2
                                                    ?.microsecondsSinceEpoch,
                                                tags: () {
                                                  if (_model.choiceChipsRevenueValue !=
                                                          null &&
                                                      _model.choiceChipsRevenueValue !=
                                                          '') {
                                                    return _model
                                                        .choiceChipsRevenueValue;
                                                  } else if (_model
                                                              .choiceChipsExpenseValue !=
                                                          null &&
                                                      _model.choiceChipsExpenseValue !=
                                                          '') {
                                                    return _model
                                                        .choiceChipsExpenseValue;
                                                  } else {
                                                    return 'Uncategorized';
                                                  }
                                                }(),
                                                absoluteAmount: double.parse(_model
                                                        .amountTextFieldTextController
                                                        .text)
                                                    .abs(),
                                              ));
                                        }

                                        firestoreBatch.set(
                                            NotifyActionCollectionRecord
                                                .collection
                                                .doc(),
                                            createNotifyActionCollectionRecordData(
                                              userForeignKEY:
                                                  currentUserReference,
                                              actionType: 'Updated',
                                              titleAndFolder:
                                                  '${_model.titleTextFieldTextController.text} Transaction',
                                              folderOrFolderCollection:
                                                  '${widget.folderNamePARAM} Folder',
                                              currentTimeRelative:
                                                  getCurrentTimestamp,
                                            ));
                                        await actions.scheduleNotification(
                                          getCurrentTimestamp.secondsSinceEpoch,
                                          'Transaction Updated!',
                                          '${_model.titleTextFieldTextController.text} ${_model.choiceChipsValue}has been saved',
                                          functions.intUnixToDateTime(
                                              functions.sumValues(
                                                  getCurrentTimestamp
                                                      .secondsSinceEpoch,
                                                  0))!,
                                          '',
                                        );
                                        Navigator.pop(context);
                                      }
                                    } finally {
                                      await firestoreBatch.commit();
                                    }
                                  },
                                  text: 'Save Changes',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF2A5FA9),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
