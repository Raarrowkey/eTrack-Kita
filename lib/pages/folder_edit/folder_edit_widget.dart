import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'folder_edit_model.dart';
export 'folder_edit_model.dart';

class FolderEditWidget extends StatefulWidget {
  const FolderEditWidget({
    super.key,
    required this.folderReferencePARAM,
  });

  final DocumentReference? folderReferencePARAM;

  @override
  State<FolderEditWidget> createState() => _FolderEditWidgetState();
}

class _FolderEditWidgetState extends State<FolderEditWidget> {
  late FolderEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getFolderName = await FolderCreateCollectionRecord.getDocumentOnce(
          widget.folderReferencePARAM!);
      safeSetState(() {
        _model.editFolderNameWIDGETTextController?.text =
            _model.getFolderName!.folder;
      });
      safeSetState(() {
        _model.dateTextFieldTextController?.text =
            dateTimeFormat("yMMMd", _model.getFolderName!.dateCreated!);
      });
    });

    _model.editFolderNameWIDGETTextController ??= TextEditingController();
    _model.editFolderNameWIDGETFocusNode ??= FocusNode();

    _model.dateTextFieldTextController ??= TextEditingController();
    _model.dateTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        color: Color(0xFFE6F0E8),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Edit Folder',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFF1F2D2B),
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: TextFormField(
                controller: _model.editFolderNameWIDGETTextController,
                focusNode: _model.editFolderNameWIDGETFocusNode,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter folder name...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE0E3E7),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4B39EF),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5963),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5963),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF14181B),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                validator: _model.editFolderNameWIDGETTextControllerValidator
                    .asValidator(context),
                inputFormatters: [
                  if (!isAndroid && !isiOS)
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return TextEditingValue(
                        selection: newValue.selection,
                        text: newValue.text
                            .toCapitalization(TextCapitalization.words),
                      );
                    }),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: Stack(
                children: [
                  TextFormField(
                    controller: _model.dateTextFieldTextController,
                    focusNode: _model.dateTextFieldFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFF606A85),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFF606A85),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFFFF5963),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6F61EF),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 20.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.figtree(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: Color(0xFF14181B),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    cursorColor: Color(0xFF6F61EF),
                    validator: _model.dateTextFieldTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.words),
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
                        final _datePickedDate = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                          builder: (context, child) {
                            return wrapInMaterialDatePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor: Color(0xFF6F61EF),
                              headerForegroundColor: Colors.white,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF15161E),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              pickerBackgroundColor: Colors.white,
                              pickerForegroundColor: Color(0xFF15161E),
                              selectedDateTimeBackgroundColor:
                                  Color(0xFF6F61EF),
                              selectedDateTimeForegroundColor: Colors.white,
                              actionButtonForegroundColor: Color(0xFF15161E),
                              iconSize: 24.0,
                            );
                          },
                        );

                        TimeOfDay? _datePickedTime;
                        if (_datePickedDate != null) {
                          _datePickedTime = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                            builder: (context, child) {
                              return wrapInMaterialTimePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor: Color(0xFF6F61EF),
                                headerForegroundColor: Colors.white,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF15161E),
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                pickerBackgroundColor: Colors.white,
                                pickerForegroundColor: Color(0xFF15161E),
                                selectedDateTimeBackgroundColor:
                                    Color(0xFF6F61EF),
                                selectedDateTimeForegroundColor: Colors.white,
                                actionButtonForegroundColor: Color(0xFF15161E),
                                iconSize: 24.0,
                              );
                            },
                          );
                        }

                        if (_datePickedDate != null &&
                            _datePickedTime != null) {
                          safeSetState(() {
                            _model.datePicked = DateTime(
                              _datePickedDate.year,
                              _datePickedDate.month,
                              _datePickedDate.day,
                              _datePickedTime!.hour,
                              _datePickedTime.minute,
                            );
                          });
                        } else if (_model.datePicked != null) {
                          safeSetState(() {
                            _model.datePicked = getCurrentTimestamp;
                          });
                        }
                        safeSetState(() {
                          _model.dateTextFieldTextController?.text =
                              dateTimeFormat("yMMMd", _model.datePicked);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7FAF8),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFFE5E7EB),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 7.0, 0.0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF2A5FA9),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.05),
              child: FFButtonWidget(
                onPressed: () async {
                  final firestoreBatch = FirebaseFirestore.instance.batch();
                  try {
                    _model.existingFolder =
                        await queryFolderCreateCollectionRecordOnce(
                      queryBuilder: (folderCreateCollectionRecord) =>
                          folderCreateCollectionRecord
                              .where(
                                'folder',
                                isEqualTo: _model
                                    .editFolderNameWIDGETTextController.text,
                              )
                              .where(
                                'userForeignKEY',
                                isEqualTo: currentUserReference,
                              ),
                    );
                    if (!(_model.existingFolder != null &&
                        (_model.existingFolder)!.isNotEmpty)) {
                      if ((_model.editFolderNameWIDGETTextController.text ==
                                  '') ||
                          (_model.dateTextFieldTextController.text == '')) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Alert'),
                              content: Text('Complete input field(s)'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        firestoreBatch.update(
                            widget.folderReferencePARAM!,
                            createFolderCreateCollectionRecordData(
                              folder: _model
                                  .editFolderNameWIDGETTextController.text,
                            ));

                        firestoreBatch.update(
                            widget.folderReferencePARAM!,
                            createFolderCreateCollectionRecordData(
                              dateCreated: _model.datePicked,
                              yearCreated:
                                  functions.getYearFromDate(_model.datePicked),
                            ));
                        _model.updateSameFolder =
                            await queryBudgetListCollectionRecordOnce(
                          queryBuilder: (budgetListCollectionRecord) =>
                              budgetListCollectionRecord
                                  .where(
                                    'userForeignKEY',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'folderForeignKEY',
                                    isEqualTo: widget.folderReferencePARAM,
                                  ),
                        );
                        _model.sameFolderCount =
                            await queryBudgetListCollectionRecordOnce(
                          queryBuilder: (budgetListCollectionRecord) =>
                              budgetListCollectionRecord
                                  .where(
                                    'userForeignKEY',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'folderForeignKEY',
                                    isEqualTo: widget.folderReferencePARAM,
                                  ),
                        );
                        _model.samefolders = 0;
                        safeSetState(() {});
                        while (_model.samefolders !=
                            _model.updateSameFolder?.length) {
                          firestoreBatch.update(
                              _model.updateSameFolder!
                                  .elementAtOrNull(_model.samefolders!)!
                                  .reference,
                              createBudgetListCollectionRecordData(
                                folderCreatedYEAR: functions
                                    .getYearFromDate(_model.datePicked),
                              ));
                          _model.samefolders = _model.samefolders! + 1;
                          safeSetState(() {});
                        }
                        await actions.scheduleNotification(
                          getCurrentTimestamp.secondsSinceEpoch,
                          'Folder Updated!',
                          'Folder ${_model.editFolderNameWIDGETTextController.text} is updated in Folder Collections',
                          functions.intUnixToDateTime(functions.sumValues(
                              getCurrentTimestamp.secondsSinceEpoch, 0))!,
                          '',
                        );

                        firestoreBatch.set(
                            NotifyActionCollectionRecord.collection.doc(),
                            createNotifyActionCollectionRecordData(
                              userForeignKEY: currentUserReference,
                              actionType: 'Updated',
                              titleAndFolder:
                                  '${_model.editFolderNameWIDGETTextController.text} Folder',
                              folderOrFolderCollection: 'Folder Collection',
                              currentTimeRelative: getCurrentTimestamp,
                            ));
                        Navigator.pop(context);
                      }
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text('Name Is Taken'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } finally {
                    await firestoreBatch.commit();
                  }

                  safeSetState(() {});
                },
                text: 'Save Folder',
                options: FFButtonOptions(
                  width: 270.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF2A5FA9),
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
