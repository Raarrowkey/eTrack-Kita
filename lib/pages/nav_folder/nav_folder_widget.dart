import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/folder_create/folder_create_widget.dart';
import '/pages/folder_edit/folder_edit_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'nav_folder_model.dart';
export 'nav_folder_model.dart';

class NavFolderWidget extends StatefulWidget {
  const NavFolderWidget({super.key});

  static String routeName = 'Nav_Folder';
  static String routePath = '/navFolder';

  @override
  State<NavFolderWidget> createState() => _NavFolderWidgetState();
}

class _NavFolderWidgetState extends State<NavFolderWidget> {
  late NavFolderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavFolderModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          backgroundColor: Color(0xFF2E5E4E),
          automaticallyImplyLeading: false,
          title: Text(
            'Harvest',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w800,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 12.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFFFDFDFD),
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      _model.activeVisible = !_model.activeVisible;
                      safeSetState(() {});
                      _model.activeSearch = false;
                      safeSetState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1170.0,
                    ),
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_model.activeVisible)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Container(
                                            width: 230.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              enabled: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF5A5656),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Search...',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF5A5656),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD9E4DD),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF5A5656),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Color(0xFFD36B6B),
                                            borderRadius: 12.0,
                                            borderWidth: 2.0,
                                            buttonSize: 40.0,
                                            fillColor: Colors.white,
                                            icon: Icon(
                                              Icons.clear_rounded,
                                              color: Color(0xFFF94444),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.textController?.clear();
                                              });
                                              _model.activeSearch = false;
                                              safeSetState(() {});
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Color(0xFF2A5FA9),
                                            borderRadius: 12.0,
                                            borderWidth: 2.0,
                                            buttonSize: 40.0,
                                            fillColor: Colors.white,
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFF072C5E),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              _model.formValidation = true;
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                safeSetState(() => _model
                                                    .formValidation = false);
                                                return;
                                              }
                                              await queryFolderCreateCollectionRecordOnce()
                                                  .then(
                                                    (records) => _model
                                                            .simpleSearchResults =
                                                        TextSearch(
                                                      records
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        record,
                                                                        [
                                                                  record.folder
                                                                ]),
                                                          )
                                                          .toList(),
                                                    )
                                                            .search(_model
                                                                .textController
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
                                                            .toList(),
                                                  )
                                                  .onError((_, __) => _model
                                                      .simpleSearchResults = [])
                                                  .whenComplete(() =>
                                                      safeSetState(() {}));

                                              _model.activeSearch = true;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                  color: Color(0xFFD9E4DD),
                                  width: 3.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                'Harvest & Collections',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.black,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Below are this harvest\'s details',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF5A5656),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: GridView(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        StreamBuilder<
                                            List<BudgetListCollectionRecord>>(
                                          stream:
                                              queryBudgetListCollectionRecord(
                                            queryBuilder:
                                                (budgetListCollectionRecord) =>
                                                    budgetListCollectionRecord
                                                        .where(
                                                          'userForeignKEY',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'category',
                                                          isEqualTo: 'Revenue',
                                                        ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BudgetListCollectionRecord>
                                                containerBudgetListCollectionRecordList =
                                                snapshot.data!;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Exact Value:'),
                                                      content: Text(
                                                          valueOrDefault<
                                                              String>(
                                                        formatNumber(
                                                          (List<double>
                                                              profitTotal) {
                                                            return profitTotal
                                                                    .isEmpty
                                                                ? 0.0
                                                                : profitTotal
                                                                    .reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                          }(containerBudgetListCollectionRecordList
                                                              .map((e) =>
                                                                  e.amount)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        '0.00',
                                                      )),
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
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0xFF4CAF7D),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (List<double>
                                                                  profitTotal) {
                                                                return profitTotal
                                                                        .isEmpty
                                                                    ? 0.0
                                                                    : profitTotal.reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                              }(containerBudgetListCollectionRecordList
                                                                  .map((e) =>
                                                                      e.amount)
                                                                  .toList()),
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            '0.00',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF4CAF7D),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Total Revenue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        StreamBuilder<
                                            List<BudgetListCollectionRecord>>(
                                          stream:
                                              queryBudgetListCollectionRecord(
                                            queryBuilder:
                                                (budgetListCollectionRecord) =>
                                                    budgetListCollectionRecord
                                                        .where(
                                                          'userForeignKEY',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'category',
                                                          isEqualTo: 'Expense',
                                                        ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BudgetListCollectionRecord>
                                                containerBudgetListCollectionRecordList =
                                                snapshot.data!;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Exact Value:'),
                                                      content: Text(
                                                          valueOrDefault<
                                                              String>(
                                                        formatNumber(
                                                          (List<double>
                                                              profitTotal) {
                                                            return profitTotal
                                                                    .isEmpty
                                                                ? 0.0
                                                                : profitTotal
                                                                    .reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                          }(containerBudgetListCollectionRecordList
                                                              .map((e) =>
                                                                  e.amount)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        '0.00',
                                                      )),
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
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0xFFD36B6B),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (List<double>
                                                                  profitTotal) {
                                                                return profitTotal
                                                                        .isEmpty
                                                                    ? 0.0
                                                                    : profitTotal.reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                              }(containerBudgetListCollectionRecordList
                                                                  .map((e) =>
                                                                      e.amount)
                                                                  .toList()),
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            '0.00',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFF94444),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Total Expense',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        StreamBuilder<
                                            List<BudgetListCollectionRecord>>(
                                          stream:
                                              queryBudgetListCollectionRecord(
                                            queryBuilder:
                                                (budgetListCollectionRecord) =>
                                                    budgetListCollectionRecord
                                                        .where(
                                              'userForeignKEY',
                                              isEqualTo: currentUserReference,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BudgetListCollectionRecord>
                                                containerBudgetListCollectionRecordList =
                                                snapshot.data!;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Exact Value:'),
                                                      content: Text(
                                                          valueOrDefault<
                                                              String>(
                                                        formatNumber(
                                                          (List<double>
                                                              profitTotal) {
                                                            return profitTotal
                                                                    .isEmpty
                                                                ? 0.0
                                                                : profitTotal
                                                                    .reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                          }(containerBudgetListCollectionRecordList
                                                              .map((e) =>
                                                                  e.amount)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        '0.00',
                                                      )),
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
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0xFF2E5E4E),
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.payments,
                                                        color:
                                                            Color(0xFF2E5E4E),
                                                        size: 20.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (List<double>
                                                                  profitTotal) {
                                                                return profitTotal
                                                                        .isEmpty
                                                                    ? 0.0
                                                                    : profitTotal.reduce((value,
                                                                            element) =>
                                                                        value +
                                                                        element);
                                                              }(containerBudgetListCollectionRecordList
                                                                  .map((e) =>
                                                                      e.amount)
                                                                  .toList()),
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            '0.00',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2E5E4E),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'NET',
                                                        textAlign:
                                                            TextAlign.center,
                                                        minFontSize: 12.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: FolderCreateWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'Create Folder',
                                  icon: Icon(
                                    Icons.folder_copy_outlined,
                                    size: 30.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Colors.white,
                                    color: Color(0xFF2A5FA9),
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
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFF072C5E),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ].addToStart(SizedBox(width: 20.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Log Entry',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF5A5656),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          if (!_model.activeSearch)
                            StreamBuilder<List<FolderCreateCollectionRecord>>(
                              stream: queryFolderCreateCollectionRecord(
                                queryBuilder: (folderCreateCollectionRecord) =>
                                    folderCreateCollectionRecord
                                        .where(
                                          'userForeignKEY',
                                          isEqualTo: currentUserReference,
                                        )
                                        .orderBy('dateCreated',
                                            descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FolderCreateCollectionRecord>
                                    listViewFolderCreateCollectionRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    12.0,
                                    0,
                                    44.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewFolderCreateCollectionRecordList
                                          .length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewFolderCreateCollectionRecord =
                                        listViewFolderCreateCollectionRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            NavCxalcWidget.routeName,
                                            queryParameters: {
                                              'folderForeignKEYPARAM':
                                                  serializeParam(
                                                listViewFolderCreateCollectionRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'folderTitlePARAM':
                                                  serializeParam(
                                                listViewFolderCreateCollectionRecord
                                                    .folder,
                                                ParamType.String,
                                              ),
                                              'folderCreatedYearPARAM':
                                                  serializeParam(
                                                listViewFolderCreateCollectionRecord
                                                    .yearCreated,
                                                ParamType.String,
                                              ),
                                              'dateCreatedPARAM':
                                                  serializeParam(
                                                listViewFolderCreateCollectionRecord
                                                    .dateCreated,
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: 570.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFD9E4DD),
                                              width: 3.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0xFF2A5FA9),
                                                      icon: Icon(
                                                        Icons.folder_open,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        listViewFolderCreateCollectionRecord
                                                            .folder,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF1F2D2B),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0xFF1F2D2B),
                                                      borderRadius: 12.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        color:
                                                            Color(0xFF1F2D2B),
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    FolderEditWidget(
                                                                  folderReferencePARAM:
                                                                      listViewFolderCreateCollectionRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0xFFD36B6B),
                                                      borderRadius: 12.0,
                                                      buttonSize: 40.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            Color(0xFFD36B6B),
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        final firestoreBatch =
                                                            FirebaseFirestore
                                                                .instance
                                                                .batch();
                                                        try {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Delete Folder'),
                                                                        content:
                                                                            Text('Are you sure you want to delete this folder?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await actions
                                                                .scheduleNotification(
                                                              getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                              'Folder Deleted!',
                                                              'Folder ${listViewFolderCreateCollectionRecord.folder} has been deleted',
                                                              functions.intUnixToDateTime(
                                                                  functions.sumValues(
                                                                      getCurrentTimestamp
                                                                          .secondsSinceEpoch,
                                                                      0))!,
                                                              '',
                                                            );

                                                            firestoreBatch.set(
                                                                NotifyActionCollectionRecord
                                                                    .collection
                                                                    .doc(),
                                                                createNotifyActionCollectionRecordData(
                                                                  userForeignKEY:
                                                                      currentUserReference,
                                                                  actionType:
                                                                      'Deleted',
                                                                  titleAndFolder:
                                                                      '${listViewFolderCreateCollectionRecord.folder} Folder',
                                                                  folderOrFolderCollection:
                                                                      'Folder Collection',
                                                                  currentTimeRelative:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            firestoreBatch.delete(
                                                                listViewFolderCreateCollectionRecord
                                                                    .reference);
                                                            _model.deleteSameFolder =
                                                                await queryBudgetListCollectionRecordOnce(
                                                              queryBuilder:
                                                                  (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'folderForeignKEY',
                                                                            isEqualTo:
                                                                                listViewFolderCreateCollectionRecord.reference,
                                                                          ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.sameFoldersCount =
                                                                await queryBudgetListCollectionRecordOnce(
                                                              queryBuilder:
                                                                  (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'folderForeignKEY',
                                                                            isEqualTo:
                                                                                listViewFolderCreateCollectionRecord.reference,
                                                                          ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.sameFolders =
                                                                0;
                                                            safeSetState(() {});
                                                            while (_model
                                                                    .sameFolders !=
                                                                _model
                                                                    .deleteSameFolder
                                                                    ?.length) {
                                                              firestoreBatch.delete(_model
                                                                  .deleteSameFolder!
                                                                  .elementAtOrNull(
                                                                      _model
                                                                          .sameFolders!)!
                                                                  .reference);
                                                              _model.sameFolders =
                                                                  _model.sameFolders! +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        } finally {
                                                          await firestoreBatch
                                                              .commit();
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          if (_model.activeSearch)
                            Builder(
                              builder: (context) {
                                final searchFolder = _model.simpleSearchResults
                                    .where((e) =>
                                        currentUserReference ==
                                        e.userForeignKEY)
                                    .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    12.0,
                                    0,
                                    44.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchFolder.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, searchFolderIndex) {
                                    final searchFolderItem =
                                        searchFolder[searchFolderIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            NavCxalcWidget.routeName,
                                            queryParameters: {
                                              'folderForeignKEYPARAM':
                                                  serializeParam(
                                                searchFolderItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'folderTitlePARAM':
                                                  serializeParam(
                                                searchFolderItem.folder,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: 570.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFD9E4DD),
                                              width: 3.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0xFF2A5FA9),
                                                      icon: Icon(
                                                        Icons.folder_open,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        searchFolderItem.folder,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF15161E),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0xFF1F2D2B),
                                                      borderRadius: 12.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        color:
                                                            Color(0xFF57636C),
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    FolderEditWidget(
                                                                  folderReferencePARAM:
                                                                      searchFolderItem
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0xFFD36B6B),
                                                      borderRadius: 12.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons
                                                            .delete_outline_rounded,
                                                        color:
                                                            Color(0xFFD36B6B),
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        final firestoreBatch =
                                                            FirebaseFirestore
                                                                .instance
                                                                .batch();
                                                        try {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Delete Folder'),
                                                                        content:
                                                                            Text('Are you sure you want to delete this folder?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await actions
                                                                .scheduleNotification(
                                                              getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                              'Folder Deleted!',
                                                              'Folder ${searchFolderItem.folder} has been deleted',
                                                              functions.intUnixToDateTime(
                                                                  functions.sumValues(
                                                                      getCurrentTimestamp
                                                                          .secondsSinceEpoch,
                                                                      0))!,
                                                              '',
                                                            );

                                                            firestoreBatch.set(
                                                                NotifyActionCollectionRecord
                                                                    .collection
                                                                    .doc(),
                                                                createNotifyActionCollectionRecordData(
                                                                  userForeignKEY:
                                                                      currentUserReference,
                                                                  actionType:
                                                                      'Deleted',
                                                                  titleAndFolder:
                                                                      '${searchFolderItem.folder} Folder',
                                                                  folderOrFolderCollection:
                                                                      'Folder Collection',
                                                                  currentTimeRelative:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            firestoreBatch.delete(
                                                                searchFolderItem
                                                                    .reference);
                                                            _model.deleteSameFolderSearch =
                                                                await queryBudgetListCollectionRecordOnce(
                                                              queryBuilder:
                                                                  (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'folderForeignKEY',
                                                                            isEqualTo:
                                                                                searchFolderItem.reference,
                                                                          ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.sameFoldersCountSearch =
                                                                await queryBudgetListCollectionRecordOnce(
                                                              queryBuilder:
                                                                  (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'folderForeignKEY',
                                                                            isEqualTo:
                                                                                searchFolderItem.reference,
                                                                          ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.sameFolders =
                                                                0;
                                                            safeSetState(() {});
                                                            while (_model
                                                                    .sameFolders !=
                                                                _model
                                                                    .deleteSameFolderSearch
                                                                    ?.length) {
                                                              firestoreBatch.delete(_model
                                                                  .deleteSameFolder!
                                                                  .elementAtOrNull(
                                                                      _model
                                                                          .sameFolders!)!
                                                                  .reference);
                                                              _model.sameFolders =
                                                                  _model.sameFolders! +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        } finally {
                                                          await firestoreBatch
                                                              .commit();
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
